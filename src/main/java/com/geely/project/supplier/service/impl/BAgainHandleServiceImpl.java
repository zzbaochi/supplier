package com.geely.project.supplier.service.impl;

import java.util.List;
import com.geely.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.geely.project.supplier.mapper.BAgainHandleMapper;
import com.geely.project.supplier.domain.BAgainHandle;
import com.geely.project.supplier.service.IBAgainHandleService;

/**
 * 续办 Service业务层处理
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@Service
public class BAgainHandleServiceImpl implements IBAgainHandleService 
{
    @Autowired
    private BAgainHandleMapper bAgainHandleMapper;

    /**
     * 查询续办 
     * 
     * @param cId 续办 ID
     * @return 续办 
     */
    @Override
    public BAgainHandle selectBAgainHandleById(String cId)
    {
        return bAgainHandleMapper.selectBAgainHandleById(cId);
    }

    /**
     * 查询续办 列表
     * 
     * @param bAgainHandle 续办 
     * @return 续办 
     */
    @Override
    public List<BAgainHandle> selectBAgainHandleList(BAgainHandle bAgainHandle)
    {
        return bAgainHandleMapper.selectBAgainHandleList(bAgainHandle);
    }

    /**
     * 新增续办 
     * 
     * @param bAgainHandle 续办 
     * @return 结果
     */
    @Override
    public int insertBAgainHandle(BAgainHandle bAgainHandle)
    {
        bAgainHandle.setCreateTime(DateUtils.getNowDate());
        return bAgainHandleMapper.insertBAgainHandle(bAgainHandle);
    }

    /**
     * 修改续办 
     * 
     * @param bAgainHandle 续办 
     * @return 结果
     */
    @Override
    public int updateBAgainHandle(BAgainHandle bAgainHandle)
    {
        bAgainHandle.setUpdateTime(DateUtils.getNowDate());
        return bAgainHandleMapper.updateBAgainHandle(bAgainHandle);
    }

    /**
     * 批量删除续办 
     * 
     * @param cIds 需要删除的续办 ID
     * @return 结果
     */
    @Override
    public int deleteBAgainHandleByIds(String[] cIds)
    {
        return bAgainHandleMapper.deleteBAgainHandleByIds(cIds);
    }

    /**
     * 删除续办 信息
     * 
     * @param cId 续办 ID
     * @return 结果
     */
    @Override
    public int deleteBAgainHandleById(String cId)
    {
        return bAgainHandleMapper.deleteBAgainHandleById(cId);
    }
}
