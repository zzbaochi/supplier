package com.geely.project.supplier.service.impl;

import com.geely.common.enums.BusTypeEnum;
import com.geely.common.enums.CheckTypeEnum;
import com.geely.common.exception.CustomException;
import com.geely.common.utils.DateUtils;
import com.geely.common.utils.StringUtils;
import com.geely.framework.redis.RedisCache;
import com.geely.framework.serial.FormNoTypeEnum;
import com.geely.framework.web.domain.AjaxResult;
import com.geely.project.supplier.domain.BFirstHandle;
import com.geely.project.supplier.domain.BSupplier;
import com.geely.project.supplier.domain.BUser;
import com.geely.project.supplier.domain.bo.UserFirstBO;
import com.geely.project.supplier.domain.vo.SupplierAndUserVO;
import com.geely.project.supplier.domain.vo.SupplierVO;
import com.geely.project.supplier.domain.vo.UserVO;
import com.geely.project.supplier.domain.bo.UserInforBO;
import com.geely.project.supplier.domain.vo.UserExcelVO;
import com.geely.project.supplier.mapper.AddSupplierMapper;
import com.geely.project.supplier.mapper.BFirstHandleMapper;
import com.geely.project.supplier.mapper.BSupplierMapper;
import com.geely.project.supplier.mapper.BUserMapper;
import com.geely.project.supplier.service.AddSupplierService;
import org.n3r.idworker.Sid;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * @author 占助
 * @date 2020/6/28 9:09
 * @description ${外部供应商操作  业务处理层}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
@Service
public class AddSupplierServiceImpl implements AddSupplierService {
    private static final Logger log = LoggerFactory.getLogger(AddSupplierServiceImpl.class);

    @Autowired
    private BUserMapper bUserMapper;
    @Autowired
    private BFirstHandleMapper bFirstHandleMapper;
    @Autowired
    private BSupplierMapper bSupplierMapper;
    @Autowired
    private RedissonClient redissonClient;
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private AddSupplierMapper addSupplierMapper;
    @Autowired
    private Sid sid;

    // 用户编号存在redis中key
    @Value("${system.user.key}")
    private String key;

    // 用户编号锁
    @Value("${system.user.lock}")
    private String userLock;



    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public AjaxResult AddSupplier(List<UserExcelVO> userList) {
        if (StringUtils.isNull(userList) || userList.size() == 0) {
            throw new CustomException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        List<String> listId = new ArrayList<>();
        AjaxResult result = new AjaxResult();
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for(UserExcelVO userVO: userList){
            try {
                // 先判断用户是否存在
                BUser bUser = new BUser();
                bUser.setNumberId(userVO.getNumberId());
                List<BUser> bUserList = bUserMapper.selectBUserList(bUser);
                if(bUserList != null && bUserList.size() >0){
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、账号 " + userVO.getUserName() + " 已存在");
                }else{
                    String userId = sid.nextShort();
                    String firstId = sid.nextShort();
                    BUser user = new BUser();
                    BFirstHandle first = new BFirstHandle();
                    BeanUtils.copyProperties(userVO,user);
                    //补充参数
                    user.setUserId(userId);
                    user.setCreateTime(DateUtils.getNowDate());
                    BeanUtils.copyProperties(userVO,first);
                    //补充参数
                    first.setuId(userId);
                    first.sethId(firstId);
                    first.setCreateTime(DateUtils.getNowDate());
                    bUserMapper.insertBUser(user);
                    bFirstHandleMapper.insertBFirstHandle(first);
                    listId.add(userId);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 导入成功");

                }
            }catch (Exception e){
                failureNum++;
                String msg = "<br/>" + failureNum + "、账号 " + userVO.getUserName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
                return AjaxResult.error(msg);
            }
        }
        if (failureNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new CustomException(failureMsg.toString());
        }else{
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
            String[] strings = new String[listId.size()];
            List<UserFirstBO> userLists = addSupplierMapper.selectBUserByIds(listId.toArray(strings));
            return AjaxResult.success(successMsg.toString(),userLists);
        }


    }
    @Transactional(propagation = Propagation.SUPPORTS )
    @Override
    public List<UserFirstBO> selectBUserByIds(String[] userIds) {
        return addSupplierMapper.selectBUserByIds(userIds);
    }


    @Transactional(propagation = Propagation.SUPPORTS )
    @Override
    public AjaxResult queryByUserNumber(String sNumber,String userNumber) {
        Map<String,Object> map  = new HashMap<>();
        map.put("userNumber",userNumber);
        map.put("sNumber",sNumber);
        List<UserInforBO> userList = bUserMapper.searchUserinfor(map);
        if(StringUtils.isNull(userList) || userList.size() ==0){
            return AjaxResult.success("查询的用户不存在!");
        }
        return  AjaxResult.success(userList.get(0));
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public AjaxResult firstAddSupplier(SupplierAndUserVO supplierAndUserVO) {
        String supplierId = sid.nextShort();
        SupplierVO supplierVO = supplierAndUserVO.getSupplierVO(); //供应商对象
        List<UserVO> userVOList = supplierAndUserVO.getUserVOList(); //用户列表
        for (UserVO userVO:  userVOList) {
            if((supplierVO.getBusType().trim().equals(BusTypeEnum.RENT.getCode()))  &&
                    (StringUtils.isEmpty(userVO.getBidSection().trim()) || StringUtils.isEmpty(userVO.getEvaLevel().trim())) ){  //类型为租赁管理人员，标段和评价等级是必填
                return AjaxResult.error("标段和评价等级不能为空！");
            }
            //先判断是否用户信息已经存在。存在则更新
            BUser bUser = new BUser();
            bUser.setNumberId(userVO.getNumberId());
            List<BUser> bUserList = bUserMapper.selectBUserList(bUser);
            if(bUserList != null && bUserList.size() >0){
                String userId = bUserList.get(0).getUserId();
                updateUser(userVO,userId);  //存在用户则更新用户列表
            }else {
                addUserBO(userVO,supplierId);   //插入用户数据表
            }

        }
        addBsupplier(supplierVO,supplierId);  //插入供应商数据表
        return AjaxResult.success();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void addBsupplier (SupplierVO supplierVO, String supplierId){
        BSupplier bSupplier = new BSupplier();
        BeanUtils.copyProperties(supplierVO,bSupplier);
        bSupplier.setsId(supplierId);
        bSupplier.setCreateTime(DateUtils.getNowDate());
        bSupplier.setStatus(CheckTypeEnum.FIRST.getCode()); //首次办理
        bSupplierMapper.insertBSupplier(bSupplier);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void addUserBO (UserVO userVO, String supplierId){
        BUser buser = new BUser();
        BeanUtils.copyProperties(userVO,buser);
        String userId = sid.nextShort();
        buser.setsNumber(supplierId);
        buser.setCreateTime(new Date());
        buser.setUserId(userId);
        buser.setStatus(CheckTypeEnum.FIRST.getCode()); //首次办理
        String newMaxValue = null;
        String PRE_USER_CODE = FormNoTypeEnum.USER_ORDER.getPrefix(); //生成编号前缀。
        //TODO 使用redis分布式锁生成用户编号
        RLock lock = redissonClient.getLock(userLock);
        try {
            lock.lock(10, TimeUnit.SECONDS);
            String MaxValue =  redisCache.getCacheObject(key); //获取当前最大编码值
            if(StringUtils.isNull(MaxValue)){
                //从数据库获取
                MaxValue = bUserMapper.getUserNumberMax();
                if(StringUtils.isNull(MaxValue)){  //没有查询到则初始化编码
                    MaxValue = PRE_USER_CODE + "0000000";
                }
            }
            int currentMaxNum = Integer.parseInt(MaxValue.substring(MaxValue.indexOf(PRE_USER_CODE)+1));
            currentMaxNum = currentMaxNum + 1;
            newMaxValue = PRE_USER_CODE + String.format("%07d", currentMaxNum);
            //4、将新的最大值同步到redis缓存
            redisCache.setCacheObject(key, newMaxValue, 30, TimeUnit.MINUTES); //30分钟
            buser.setUserNumber(newMaxValue);
            bUserMapper.insertBUser(buser);  //插入用户

            addFirstHandle(userVO,userId); //插入首次办理
        }catch (Exception e){
            e.printStackTrace();
            throw new CustomException("获取redis分布式锁异常，请联系系统管理员");
        }finally {
            log.info("生成用户编号，释放redis分布式锁");
            lock.unlock(); //释放锁
        }

    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void addFirstHandle(UserVO userVO, String userId){
        BFirstHandle bFirstHandle = new BFirstHandle();
        BeanUtils.copyProperties(userVO,bFirstHandle);
        bFirstHandle.sethId(sid.nextShort());
        bFirstHandle.setuId(userId);
        bFirstHandle.setCreateTime(new Date());
        bFirstHandle.setStatus(CheckTypeEnum.FIRST.getCode());
        bFirstHandleMapper.insertBFirstHandle(bFirstHandle);
    }
    //更新用户列表和首次办理接口
    @Transactional(propagation = Propagation.REQUIRED)
    public void updateUser(UserVO userVO, String userId){
        BUser buser = new BUser();
        BeanUtils.copyProperties(userVO,buser);
        buser.setUserId(userId);
        bUserMapper.updateBUser(buser);
        updateFirstHandle(userVO, userId);

    }
    //首次办理接口
    @Transactional(propagation = Propagation.REQUIRED)
    public void updateFirstHandle(UserVO userVO, String userId ){
        BFirstHandle bFirstHandle = new BFirstHandle();
        BeanUtils.copyProperties(userVO,bFirstHandle);
        bFirstHandle.setuId(userId);
        bFirstHandleMapper.updateBFirstHandleByUid(bFirstHandle);
    }

}
