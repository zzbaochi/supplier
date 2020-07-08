package com.geely.project.supplier.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.geely.framework.aspectj.lang.annotation.Log;
import com.geely.framework.aspectj.lang.enums.BusinessType;
import com.geely.project.supplier.domain.BSupplier;
import com.geely.project.supplier.service.IBSupplierService;
import com.geely.framework.web.controller.BaseController;
import com.geely.framework.web.domain.AjaxResult;
import com.geely.common.utils.poi.ExcelUtil;
import com.geely.framework.web.page.TableDataInfo;

/**
 * 供应商 Controller
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@RestController
@RequestMapping("/supplier/supplier")
public class BSupplierController extends BaseController
{
    @Autowired
    private IBSupplierService bSupplierService;

    /**
     * 查询供应商 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:supplier:list')")
    @GetMapping("/list")
    public TableDataInfo list(BSupplier bSupplier)
    {
        startPage();
        List<BSupplier> list = bSupplierService.selectBSupplierList(bSupplier);
        return getDataTable(list);
    }

    /**
     * 导出供应商 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:supplier:export')")
    @Log(title = "供应商 ", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BSupplier bSupplier)
    {
        List<BSupplier> list = bSupplierService.selectBSupplierList(bSupplier);
        ExcelUtil<BSupplier> util = new ExcelUtil<BSupplier>(BSupplier.class);
        return util.exportExcel(list, "supplier");
    }

    /**
     * 获取供应商 详细信息
     */
    @PreAuthorize("@ss.hasPermi('supplier:supplier:query')")
    @GetMapping(value = "/{sId}")
    public AjaxResult getInfo(@PathVariable("sId") String sId)
    {
        return AjaxResult.success(bSupplierService.selectBSupplierById(sId));
    }

    /**
     * 新增供应商 
     */
    @PreAuthorize("@ss.hasPermi('supplier:supplier:add')")
    @Log(title = "供应商 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BSupplier bSupplier)
    {
        return toAjax(bSupplierService.insertBSupplier(bSupplier));
    }

    /**
     * 修改供应商 
     */
    @PreAuthorize("@ss.hasPermi('supplier:supplier:edit')")
    @Log(title = "供应商 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BSupplier bSupplier)
    {
        return toAjax(bSupplierService.updateBSupplier(bSupplier));
    }

    /**
     * 删除供应商 
     */
    @PreAuthorize("@ss.hasPermi('supplier:supplier:remove')")
    @Log(title = "供应商 ", businessType = BusinessType.DELETE)
	@DeleteMapping("/{sIds}")
    public AjaxResult remove(@PathVariable String[] sIds)
    {
        return toAjax(bSupplierService.deleteBSupplierByIds(sIds));
    }
}
