package com.geely.project.supplier.service;

import java.util.List;
import com.geely.project.supplier.domain.BCallPosition;

/**
 * 调动 Service接口
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface IBCallPositionService 
{
    /**
     * 查询调动 
     * 
     * @param cId 调动 ID
     * @return 调动 
     */
    public BCallPosition selectBCallPositionById(String cId);

    /**
     * 查询调动 列表
     * 
     * @param bCallPosition 调动 
     * @return 调动 集合
     */
    public List<BCallPosition> selectBCallPositionList(BCallPosition bCallPosition);

    /**
     * 新增调动 
     * 
     * @param bCallPosition 调动 
     * @return 结果
     */
    public int insertBCallPosition(BCallPosition bCallPosition);

    /**
     * 修改调动 
     * 
     * @param bCallPosition 调动 
     * @return 结果
     */
    public int updateBCallPosition(BCallPosition bCallPosition);

    /**
     * 批量删除调动 
     * 
     * @param cIds 需要删除的调动 ID
     * @return 结果
     */
    public int deleteBCallPositionByIds(String[] cIds);

    /**
     * 删除调动 信息
     * 
     * @param cId 调动 ID
     * @return 结果
     */
    public int deleteBCallPositionById(String cId);
}
