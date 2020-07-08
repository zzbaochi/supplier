package com.geely.project.supplier.service.impl;

import java.util.List;
import com.geely.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.geely.project.supplier.mapper.BSupplierMapper;
import com.geely.project.supplier.domain.BSupplier;
import com.geely.project.supplier.service.IBSupplierService;

/**
 * 供应商 Service业务层处理
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@Service
public class BSupplierServiceImpl implements IBSupplierService 
{
    @Autowired
    private BSupplierMapper bSupplierMapper;

    /**
     * 查询供应商 
     * 
     * @param sId 供应商 ID
     * @return 供应商 
     */
    @Override
    public BSupplier selectBSupplierById(String sId)
    {
        return bSupplierMapper.selectBSupplierById(sId);
    }

    /**
     * 查询供应商 列表
     * 
     * @param bSupplier 供应商 
     * @return 供应商 
     */
    @Override
    public List<BSupplier> selectBSupplierList(BSupplier bSupplier)
    {
        return bSupplierMapper.selectBSupplierList(bSupplier);
    }

    /**
     * 新增供应商 
     * 
     * @param bSupplier 供应商 
     * @return 结果
     */
    @Override
    public int insertBSupplier(BSupplier bSupplier)
    {
        bSupplier.setCreateTime(DateUtils.getNowDate());
        return bSupplierMapper.insertBSupplier(bSupplier);
    }

    /**
     * 修改供应商 
     * 
     * @param bSupplier 供应商 
     * @return 结果
     */
    @Override
    public int updateBSupplier(BSupplier bSupplier)
    {
        bSupplier.setUpdateTime(DateUtils.getNowDate());
        return bSupplierMapper.updateBSupplier(bSupplier);
    }

    /**
     * 批量删除供应商 
     * 
     * @param sIds 需要删除的供应商 ID
     * @return 结果
     */
    @Override
    public int deleteBSupplierByIds(String[] sIds)
    {
        return bSupplierMapper.deleteBSupplierByIds(sIds);
    }

    /**
     * 删除供应商 信息
     * 
     * @param sId 供应商 ID
     * @return 结果
     */
    @Override
    public int deleteBSupplierById(String sId)
    {
        return bSupplierMapper.deleteBSupplierById(sId);
    }
}
