package com.geely.project.supplier.mapper;

import java.util.List;
import com.geely.project.supplier.domain.BSupplier;

/**
 * 供应商 Mapper接口
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface BSupplierMapper 
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
     * 删除供应商 
     * 
     * @param sId 供应商 ID
     * @return 结果
     */
    public int deleteBSupplierById(String sId);

    /**
     * 批量删除供应商 
     * 
     * @param sIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteBSupplierByIds(String[] sIds);
}
