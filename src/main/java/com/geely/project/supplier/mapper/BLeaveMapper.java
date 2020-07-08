package com.geely.project.supplier.mapper;

import java.util.List;
import com.geely.project.supplier.domain.BLeave;

/**
 * 离岗 Mapper接口
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface BLeaveMapper 
{
    /**
     * 查询离岗 
     * 
     * @param cId 离岗 ID
     * @return 离岗 
     */
    public BLeave selectBLeaveById(String cId);

    /**
     * 查询离岗 列表
     * 
     * @param bLeave 离岗 
     * @return 离岗 集合
     */
    public List<BLeave> selectBLeaveList(BLeave bLeave);

    /**
     * 新增离岗 
     * 
     * @param bLeave 离岗 
     * @return 结果
     */
    public int insertBLeave(BLeave bLeave);

    /**
     * 修改离岗 
     * 
     * @param bLeave 离岗 
     * @return 结果
     */
    public int updateBLeave(BLeave bLeave);

    /**
     * 删除离岗 
     * 
     * @param cId 离岗 ID
     * @return 结果
     */
    public int deleteBLeaveById(String cId);

    /**
     * 批量删除离岗 
     * 
     * @param cIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteBLeaveByIds(String[] cIds);
}
