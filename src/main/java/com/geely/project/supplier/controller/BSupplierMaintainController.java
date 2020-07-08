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
import com.geely.project.supplier.domain.BSupplierMaintain;
import com.geely.project.supplier.service.IBSupplierMaintainService;
import com.geely.framework.web.controller.BaseController;
import com.geely.framework.web.domain.AjaxResult;
import com.geely.common.utils.poi.ExcelUtil;
import com.geely.framework.web.page.TableDataInfo;

/**
 * 供应商维护 Controller
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@RestController
@RequestMapping("/supplier/maintain")
public class BSupplierMaintainController extends BaseController
{
    @Autowired
    private IBSupplierMaintainService bSupplierMaintainService;

    /**
     * 查询供应商维护 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:maintain:list')")
    @GetMapping("/list")
    public TableDataInfo list(BSupplierMaintain bSupplierMaintain)
    {
        startPage();
        List<BSupplierMaintain> list = bSupplierMaintainService.selectBSupplierMaintainList(bSupplierMaintain);
        return getDataTable(list);
    }

    /**
     * 导出供应商维护 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:maintain:export')")
    @Log(title = "供应商维护 ", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BSupplierMaintain bSupplierMaintain)
    {
        List<BSupplierMaintain> list = bSupplierMaintainService.selectBSupplierMaintainList(bSupplierMaintain);
        ExcelUtil<BSupplierMaintain> util = new ExcelUtil<BSupplierMaintain>(BSupplierMaintain.class);
        return util.exportExcel(list, "maintain");
    }

    /**
     * 获取供应商维护 详细信息
     */
    @PreAuthorize("@ss.hasPermi('supplier:maintain:query')")
    @GetMapping(value = "/{sId}")
    public AjaxResult getInfo(@PathVariable("sId") String sId)
    {
        return AjaxResult.success(bSupplierMaintainService.selectBSupplierMaintainById(sId));
    }

    /**
     * 新增供应商维护 
     */
    @PreAuthorize("@ss.hasPermi('supplier:maintain:add')")
    @Log(title = "供应商维护 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BSupplierMaintain bSupplierMaintain) {
        return toAjax(bSupplierMaintainService.insertBSupplierMaintain(bSupplierMaintain));
    }

    /**
     * 修改供应商维护 
     */
    @PreAuthorize("@ss.hasPermi('supplier:maintain:edit')")
    @Log(title = "供应商维护 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BSupplierMaintain bSupplierMaintain) {
        return toAjax(bSupplierMaintainService.updateBSupplierMaintain(bSupplierMaintain));
    }

    /**
     * 删除供应商维护 
     */
    @PreAuthorize("@ss.hasPermi('supplier:maintain:remove')")
    @Log(title = "供应商维护 ", businessType = BusinessType.DELETE)
	@DeleteMapping("/{sIds}")
    public AjaxResult remove(@PathVariable String[] sIds) {
        return toAjax(bSupplierMaintainService.deleteBSupplierMaintainByIds(sIds));
    }
}
