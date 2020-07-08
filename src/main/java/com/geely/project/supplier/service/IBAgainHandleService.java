package com.geely.project.supplier.service;

import java.util.List;
import com.geely.project.supplier.domain.BAgainHandle;

/**
 * 续办 Service接口
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface IBAgainHandleService 
{
    /**
     * 查询续办 
     * 
     * @param cId 续办 ID
     * @return 续办 
     */
    public BAgainHandle selectBAgainHandleById(String cId);

    /**
     * 查询续办 列表
     * 
     * @param bAgainHandle 续办 
     * @return 续办 集合
     */
    public List<BAgainHandle> selectBAgainHandleList(BAgainHandle bAgainHandle);

    /**
     * 新增续办 
     * 
     * @param bAgainHandle 续办 
     * @return 结果
     */
    public int insertBAgainHandle(BAgainHandle bAgainHandle);

    /**
     * 修改续办 
     * 
     * @param bAgainHandle 续办 
     * @return 结果
     */
    public int updateBAgainHandle(BAgainHandle bAgainHandle);

    /**
     * 批量删除续办 
     * 
     * @param cIds 需要删除的续办 ID
     * @return 结果
     */
    public int deleteBAgainHandleByIds(String[] cIds);

    /**
     * 删除续办 信息
     * 
     * @param cId 续办 ID
     * @return 结果
     */
    public int deleteBAgainHandleById(String cId);
}
