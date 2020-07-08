package com.geely.project.supplier.service.impl;

import java.util.List;
import com.geely.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.geely.project.supplier.mapper.BLeaveMapper;
import com.geely.project.supplier.domain.BLeave;
import com.geely.project.supplier.service.IBLeaveService;

/**
 * 离岗 Service业务层处理
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@Service
public class BLeaveServiceImpl implements IBLeaveService 
{
    @Autowired
    private BLeaveMapper bLeaveMapper;

    /**
     * 查询离岗 
     * 
     * @param cId 离岗 ID
     * @return 离岗 
     */
    @Override
    public BLeave selectBLeaveById(String cId)
    {
        return bLeaveMapper.selectBLeaveById(cId);
    }

    /**
     * 查询离岗 列表
     * 
     * @param bLeave 离岗 
     * @return 离岗 
     */
    @Override
    public List<BLeave> selectBLeaveList(BLeave bLeave)
    {
        return bLeaveMapper.selectBLeaveList(bLeave);
    }

    /**
     * 新增离岗 
     * 
     * @param bLeave 离岗 
     * @return 结果
     */
    @Override
    public int insertBLeave(BLeave bLeave)
    {
        bLeave.setCreateTime(DateUtils.getNowDate());
        return bLeaveMapper.insertBLeave(bLeave);
    }

    /**
     * 修改离岗 
     * 
     * @param bLeave 离岗 
     * @return 结果
     */
    @Override
    public int updateBLeave(BLeave bLeave)
    {
        bLeave.setUpdateTime(DateUtils.getNowDate());
        return bLeaveMapper.updateBLeave(bLeave);
    }

    /**
     * 批量删除离岗 
     * 
     * @param cIds 需要删除的离岗 ID
     * @return 结果
     */
    @Override
    public int deleteBLeaveByIds(String[] cIds)
    {
        return bLeaveMapper.deleteBLeaveByIds(cIds);
    }

    /**
     * 删除离岗 信息
     * 
     * @param cId 离岗 ID
     * @return 结果
     */
    @Override
    public int deleteBLeaveById(String cId)
    {
        return bLeaveMapper.deleteBLeaveById(cId);
    }
}
