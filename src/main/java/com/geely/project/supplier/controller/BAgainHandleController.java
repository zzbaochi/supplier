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
import com.geely.project.supplier.domain.BAgainHandle;
import com.geely.project.supplier.service.IBAgainHandleService;
import com.geely.framework.web.controller.BaseController;
import com.geely.framework.web.domain.AjaxResult;
import com.geely.common.utils.poi.ExcelUtil;
import com.geely.framework.web.page.TableDataInfo;

/**
 * 续办 Controller
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@RestController
@RequestMapping("/supplier/againhandle")
public class BAgainHandleController extends BaseController
{
    @Autowired
    private IBAgainHandleService bAgainHandleService;

    /**
     * 查询续办 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:list')")
    @GetMapping("/list")
    public TableDataInfo list(BAgainHandle bAgainHandle)
    {
        startPage();
        List<BAgainHandle> list = bAgainHandleService.selectBAgainHandleList(bAgainHandle);
        return getDataTable(list);
    }

    /**
     * 导出续办 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:export')")
    @Log(title = "续办 ", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BAgainHandle bAgainHandle)
    {
        List<BAgainHandle> list = bAgainHandleService.selectBAgainHandleList(bAgainHandle);
        ExcelUtil<BAgainHandle> util = new ExcelUtil<BAgainHandle>(BAgainHandle.class);
        return util.exportExcel(list, "handle");
    }

    /**
     * 获取续办 详细信息
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:query')")
    @GetMapping(value = "/{cId}")
    public AjaxResult getInfo(@PathVariable("cId") String cId)
    {
        return AjaxResult.success(bAgainHandleService.selectBAgainHandleById(cId));
    }

    /**
     * 新增续办 
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:add')")
    @Log(title = "续办 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BAgainHandle bAgainHandle)
    {
        return toAjax(bAgainHandleService.insertBAgainHandle(bAgainHandle));
    }

    /**
     * 修改续办 
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:edit')")
    @Log(title = "续办 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BAgainHandle bAgainHandle)
    {
        return toAjax(bAgainHandleService.updateBAgainHandle(bAgainHandle));
    }

    /**
     * 删除续办 
     */
    @PreAuthorize("@ss.hasPermi('supplier:handle:remove')")
    @Log(title = "续办 ", businessType = BusinessType.DELETE)
	@DeleteMapping("/{cIds}")
    public AjaxResult remove(@PathVariable String[] cIds)
    {
        return toAjax(bAgainHandleService.deleteBAgainHandleByIds(cIds));
    }
}
