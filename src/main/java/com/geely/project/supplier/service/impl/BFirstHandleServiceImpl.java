package com.geely.project.supplier.service.impl;

import java.util.List;
import com.geely.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.geely.project.supplier.mapper.BFirstHandleMapper;
import com.geely.project.supplier.domain.BFirstHandle;
import com.geely.project.supplier.service.IBFirstHandleService;

/**
 * 首次办理 Service业务层处理
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@Service
public class BFirstHandleServiceImpl implements IBFirstHandleService 
{
    @Autowired
    private BFirstHandleMapper bFirstHandleMapper;

    /**
     * 查询首次办理 
     * 
     * @param hId 首次办理 ID
     * @return 首次办理 
     */
    @Override
    public BFirstHandle selectBFirstHandleById(String hId)
    {
        return bFirstHandleMapper.selectBFirstHandleById(hId);
    }

    /**
     * 查询首次办理 列表
     * 
     * @param bFirstHandle 首次办理 
     * @return 首次办理 
     */
    @Override
    public List<BFirstHandle> selectBFirstHandleList(BFirstHandle bFirstHandle)
    {
        return bFirstHandleMapper.selectBFirstHandleList(bFirstHandle);
    }

    /**
     * 新增首次办理 
     * 
     * @param bFirstHandle 首次办理 
     * @return 结果
     */
    @Override
    public int insertBFirstHandle(BFirstHandle bFirstHandle)
    {
        bFirstHandle.setCreateTime(DateUtils.getNowDate());
        return bFirstHandleMapper.insertBFirstHandle(bFirstHandle);
    }

    /**
     * 修改首次办理 
     * 
     * @param bFirstHandle 首次办理 
     * @return 结果
     */
    @Override
    public int updateBFirstHandle(BFirstHandle bFirstHandle)
    {
        bFirstHandle.setUpdateTime(DateUtils.getNowDate());
        return bFirstHandleMapper.updateBFirstHandle(bFirstHandle);
    }

    /**
     * 批量删除首次办理 
     * 
     * @param hIds 需要删除的首次办理 ID
     * @return 结果
     */
    @Override
    public int deleteBFirstHandleByIds(String[] hIds)
    {
        return bFirstHandleMapper.deleteBFirstHandleByIds(hIds);
    }

    /**
     * 删除首次办理 信息
     * 
     * @param hId 首次办理 ID
     * @return 结果
     */
    @Override
    public int deleteBFirstHandleById(String hId)
    {
        return bFirstHandleMapper.deleteBFirstHandleById(hId);
    }
}
