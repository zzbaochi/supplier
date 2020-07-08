package com.geely.project.supplier.service.impl;

import java.util.List;
import com.geely.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.geely.project.supplier.mapper.BCallPositionMapper;
import com.geely.project.supplier.domain.BCallPosition;
import com.geely.project.supplier.service.IBCallPositionService;

/**
 * 调动 Service业务层处理
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@Service
public class BCallPositionServiceImpl implements IBCallPositionService 
{
    @Autowired
    private BCallPositionMapper bCallPositionMapper;

    /**
     * 查询调动 
     * 
     * @param cId 调动 ID
     * @return 调动 
     */
    @Override
    public BCallPosition selectBCallPositionById(String cId)
    {
        return bCallPositionMapper.selectBCallPositionById(cId);
    }

    /**
     * 查询调动 列表
     * 
     * @param bCallPosition 调动 
     * @return 调动 
     */
    @Override
    public List<BCallPosition> selectBCallPositionList(BCallPosition bCallPosition)
    {
        return bCallPositionMapper.selectBCallPositionList(bCallPosition);
    }

    /**
     * 新增调动 
     * 
     * @param bCallPosition 调动 
     * @return 结果
     */
    @Override
    public int insertBCallPosition(BCallPosition bCallPosition)
    {
        bCallPosition.setCreateTime(DateUtils.getNowDate());
        return bCallPositionMapper.insertBCallPosition(bCallPosition);
    }

    /**
     * 修改调动 
     * 
     * @param bCallPosition 调动 
     * @return 结果
     */
    @Override
    public int updateBCallPosition(BCallPosition bCallPosition)
    {
        bCallPosition.setUpdateTime(DateUtils.getNowDate());
        return bCallPositionMapper.updateBCallPosition(bCallPosition);
    }

    /**
     * 批量删除调动 
     * 
     * @param cIds 需要删除的调动 ID
     * @return 结果
     */
    @Override
    public int deleteBCallPositionByIds(String[] cIds)
    {
        return bCallPositionMapper.deleteBCallPositionByIds(cIds);
    }

    /**
     * 删除调动 信息
     * 
     * @param cId 调动 ID
     * @return 结果
     */
    @Override
    public int deleteBCallPositionById(String cId)
    {
        return bCallPositionMapper.deleteBCallPositionById(cId);
    }
}
