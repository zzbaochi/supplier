package com.geely.project.supplier.service;

import java.util.List;
import com.geely.project.supplier.domain.BSupplier;

/**
 * 供应商 Service接口
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface IBSupplierService 
{
    /**
     * 查询供应商 
     * 
     * @param sId 供应商 ID
     * @return 供应商 
     */
    public BSupplier selectBSupplierById(String sId);

    /**
     * 查询供应商 列表
     * 
     * @param bSupplier 供应商 
     * @return 供应商 集合
     */
    public List<BSupplier> selectBSupplierList(BSupplier bSupplier);

    /**
     * 新增供应商 
     * 
     * @param bSupplier 供应商 
     * @return 结果
     */
    public int insertBSupplier(BSupplier bSupplier);

    /**
     * 修改供应商 
     * 
     * @param bSupplier 供应商 
     * @return 结果
     */
    public int updateBSupplier(BSupplier bSupplier);

    /**
     * 批量删除供应商 
     * 
     * @param sIds 需要删除的供应商 ID
     * @return 结果
     */
    public int deleteBSupplierByIds(String[] sIds);

    /**
     * 删除供应商 信息
     * 
     * @param sId 供应商 ID
     * @return 结果
     */
    public int deleteBSupplierById(String sId);
}
