package com.geely.project.supplier.mapper;

import java.util.List;
import com.geely.project.supplier.domain.BFirstHandle;

/**
 * 首次办理 Mapper接口
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface BFirstHandleMapper 
{
    /**
     * 查询首次办理 
     * 
     * @param hId 首次办理 ID
     * @return 首次办理 
     */
    public BFirstHandle selectBFirstHandleById(String hId);

    /**
     * 查询首次办理 列表
     * 
     * @param bFirstHandle 首次办理 
     * @return 首次办理 集合
     */
    public List<BFirstHandle> selectBFirstHandleList(BFirstHandle bFirstHandle);

    /**
     * 新增首次办理 
     * 
     * @param bFirstHandle 首次办理 
     * @return 结果
     */
    public int insertBFirstHandle(BFirstHandle bFirstHandle);

    /**
     * 修改首次办理 
     * 
     * @param bFirstHandle 首次办理 
     * @return 结果
     */
    public int updateBFirstHandle(BFirstHandle bFirstHandle);

    /**
     * 删除首次办理 
     * 
     * @param hId 首次办理 ID
     * @return 结果
     */
    public int deleteBFirstHandleById(String hId);

    /**
     * 批量删除首次办理 
     * 
     * @param hIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteBFirstHandleByIds(String[] hIds);

    /**
     * 根据用户UID 更新首次办理
     * @param bFirstHandle
     * @return
     */
    public int updateBFirstHandleByUid(BFirstHandle bFirstHandle);
}
