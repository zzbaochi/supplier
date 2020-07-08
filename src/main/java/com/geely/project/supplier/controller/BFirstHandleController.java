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
import com.geely.project.supplier.domain.BFirstHandle;
import com.geely.project.supplier.service.IBFirstHandleService;
import com.geely.framework.web.controller.BaseController;
import com.geely.framework.web.domain.AjaxResult;
import com.geely.common.utils.poi.ExcelUtil;
import com.geely.framework.web.page.TableDataInfo;

/**
 * 首次办理 Controller
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@RestController
@RequestMapping("/supplier/firsthandle")
public class BFirstHandleController extends BaseController
{
    @Autowired
    private IBFirstHandleService bFirstHandleService;

    /**
     * 查询首次办理 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:list')")
    @GetMapping("/list")
    public TableDataInfo list(BFirstHandle bFirstHandle)
    {
        startPage();
        List<BFirstHandle> list = bFirstHandleService.selectBFirstHandleList(bFirstHandle);
        return getDataTable(list);
    }

    /**
     * 导出首次办理 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:export')")
    @Log(title = "首次办理 ", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BFirstHandle bFirstHandle)
    {
        List<BFirstHandle> list = bFirstHandleService.selectBFirstHandleList(bFirstHandle);
        ExcelUtil<BFirstHandle> util = new ExcelUtil<BFirstHandle>(BFirstHandle.class);
        return util.exportExcel(list, "handle");
    }

    /**
     * 获取首次办理 详细信息
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:query')")
    @GetMapping(value = "/{hId}")
    public AjaxResult getInfo(@PathVariable("hId") String hId)
    {
        return AjaxResult.success(bFirstHandleService.selectBFirstHandleById(hId));
    }

    /**
     * 新增首次办理 
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:add')")
    @Log(title = "首次办理 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BFirstHandle bFirstHandle)
    {
        return toAjax(bFirstHandleService.insertBFirstHandle(bFirstHandle));
    }

    /**
     * 修改首次办理 
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:edit')")
    @Log(title = "首次办理 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BFirstHandle bFirstHandle)
    {
        return toAjax(bFirstHandleService.updateBFirstHandle(bFirstHandle));
    }

    /**
     * 删除首次办理 
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:remove')")
    @Log(title = "首次办理 ", businessType = BusinessType.DELETE)
	@DeleteMapping("/{hIds}")
    public AjaxResult remove(@PathVariable String[] hIds)
    {
        return toAjax(bFirstHandleService.deleteBFirstHandleByIds(hIds));
    }
}
