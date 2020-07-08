package com.geely.project.supplier.service.impl;

import com.geely.common.exception.CustomException;
import com.geely.common.utils.DateUtils;
import com.geely.common.utils.StringUtils;
import com.geely.framework.redis.RedisCache;
import com.geely.framework.serial.FormNoTypeEnum;
import com.geely.project.supplier.domain.BSupplierMaintain;
import com.geely.project.supplier.mapper.BSupplierMaintainMapper;
import com.geely.project.supplier.service.IBSupplierMaintainService;
import org.n3r.idworker.Sid;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 供应商维护 Service业务层处理
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@Service
public class BSupplierMaintainServiceImpl implements IBSupplierMaintainService {
    private static final Logger log = LoggerFactory.getLogger(BSupplierMaintainServiceImpl.class);
    @Autowired
    private BSupplierMaintainMapper bSupplierMaintainMapper;
    @Autowired
    private RedissonClient redissonClient;
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private Sid sid;

    // 供应商编码存在redis中key
    @Value("${system.supplier.key}")
    private String key;

    // 获取供应商编号锁
    @Value("${system.supplier.lock}")
    private String supplierLock;

    /**
     * 查询供应商维护 
     * 
     * @param sId 供应商维护 ID
     * @return 供应商维护 
     */
    @Override
    public BSupplierMaintain selectBSupplierMaintainById(String sId)
    {
        return bSupplierMaintainMapper.selectBSupplierMaintainById(sId);
    }

    /**
     * 查询供应商维护 列表
     * 
     * @param bSupplierMaintain 供应商维护 
     * @return 供应商维护 
     */
    @Override
    public List<BSupplierMaintain> selectBSupplierMaintainList(BSupplierMaintain bSupplierMaintain)
    {
        return bSupplierMaintainMapper.selectBSupplierMaintainList(bSupplierMaintain);
    }

    /**
     * 新增供应商维护 
     * 
     * @param bSupplierMaintain 供应商维护 
     * @return 结果
     */
    @Override
    public int insertBSupplierMaintain(BSupplierMaintain bSupplierMaintain) {
        String id = sid.nextShort();
        bSupplierMaintain.setCreateTime(DateUtils.getNowDate());
        bSupplierMaintain.setsId(id);
        String newMaxValue = null;
        int result = 0;
        String PRE_GROUP_CODE = FormNoTypeEnum.SUPPLIER_ORDER.getPrefix();
        //TODO 使用redis分布式锁生成供应商编号
        RLock lock = redissonClient.getLock(supplierLock);
        try {
            lock.lock(30, TimeUnit.SECONDS);
            log.info("获取到锁了");
            String currentMaxValue =  redisCache.getCacheObject(key); //获取当前最大编码值
            if(StringUtils.isNull(currentMaxValue)){
                //从数据库获取
                currentMaxValue = bSupplierMaintainMapper.getSupplierNumberMax();
                if(StringUtils.isNull(currentMaxValue)){  //没有查询到则初始化编码
                    currentMaxValue = PRE_GROUP_CODE + "0000000";
                }
            }
            int currentMaxNum = Integer.parseInt(currentMaxValue.substring(currentMaxValue.indexOf(PRE_GROUP_CODE)+1));
            currentMaxNum = currentMaxNum + 1;
            newMaxValue = PRE_GROUP_CODE + String.format("%07d", currentMaxNum);
            //4、将新的最大值同步到redis缓存
            redisCache.setCacheObject(key, newMaxValue, 30, TimeUnit.MINUTES); //30分钟
            bSupplierMaintain.setsNumber(newMaxValue);
            result = bSupplierMaintainMapper.insertBSupplierMaintain(bSupplierMaintain);
        }catch (Exception e){
            e.printStackTrace();
            throw new CustomException("获取redis分布式锁异常，请联系系统管理员");
        }finally {
            log.info("生成供应商编号，释放redis分布式锁");
            lock.unlock(); //释放锁
        }
        return result;
    }

    /**
     * 修改供应商维护 
     * 
     * @param bSupplierMaintain 供应商维护 
     * @return 结果
     */
    @Override
    public int updateBSupplierMaintain(BSupplierMaintain bSupplierMaintain)
    {
        bSupplierMaintain.setUpdateTime(DateUtils.getNowDate());
        return bSupplierMaintainMapper.updateBSupplierMaintain(bSupplierMaintain);
    }

    /**
     * 批量删除供应商维护 
     * 
     * @param sIds 需要删除的供应商维护 ID
     * @return 结果
     */
    @Override
    public int deleteBSupplierMaintainByIds(String[] sIds)
    {
        return bSupplierMaintainMapper.deleteBSupplierMaintainByIds(sIds);
    }

    /**
     * 删除供应商维护 信息
     * 
     * @param sId 供应商维护 ID
     * @return 结果
     */
    @Override
    public int deleteBSupplierMaintainById(String sId)
    {
        return bSupplierMaintainMapper.deleteBSupplierMaintainById(sId);
    }
}
