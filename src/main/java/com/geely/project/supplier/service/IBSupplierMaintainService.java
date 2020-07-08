package com.geely.project.supplier.service;

import java.util.List;
import com.geely.project.supplier.domain.BSupplierMaintain;

/**
 * 供应商维护 Service接口
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface IBSupplierMaintainService 
{
    /**
     * 查询供应商维护 
     * 
     * @param sId 供应商维护 ID
     * @return 供应商维护 
     */
    public BSupplierMaintain selectBSupplierMaintainById(String sId);

    /**
     * 查询供应商维护 列表
     * 
     * @param bSupplierMaintain 供应商维护 
     * @return 供应商维护 集合
     */
    public List<BSupplierMaintain> selectBSupplierMaintainList(BSupplierMaintain bSupplierMaintain);

    /**
     * 新增供应商维护 
     * 
     * @param bSupplierMaintain 供应商维护 
     * @return 结果
     */
    public int insertBSupplierMaintain(BSupplierMaintain bSupplierMaintain);

    /**
     * 修改供应商维护 
     * 
     * @param bSupplierMaintain 供应商维护 
     * @return 结果
     */
    public int updateBSupplierMaintain(BSupplierMaintain bSupplierMaintain);

    /**
     * 批量删除供应商维护 
     * 
     * @param sIds 需要删除的供应商维护 ID
     * @return 结果
     */
    public int deleteBSupplierMaintainByIds(String[] sIds);

    /**
     * 删除供应商维护 信息
     * 
     * @param sId 供应商维护 ID
     * @return 结果
     */
    public int deleteBSupplierMaintainById(String sId);
}
