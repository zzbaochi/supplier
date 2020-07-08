package com.geely.project.supplier.mapper;

import java.util.List;
import com.geely.project.supplier.domain.BSupplierMaintain;

/**
 * 供应商维护 Mapper接口
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface BSupplierMaintainMapper 
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
     * 删除供应商维护 
     * 
     * @param sId 供应商维护 ID
     * @return 结果
     */
    public int deleteBSupplierMaintainById(String sId);

    /**
     * 批量删除供应商维护 
     * 
     * @param sIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteBSupplierMaintainByIds(String[] sIds);
    /**
     * 获取供应商最大的编号
     * @return
     */
    public String getSupplierNumberMax();
}
