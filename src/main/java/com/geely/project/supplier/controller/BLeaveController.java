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
import com.geely.project.supplier.domain.BLeave;
import com.geely.project.supplier.service.IBLeaveService;
import com.geely.framework.web.controller.BaseController;
import com.geely.framework.web.domain.AjaxResult;
import com.geely.common.utils.poi.ExcelUtil;
import com.geely.framework.web.page.TableDataInfo;

/**
 * 离岗 Controller
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@RestController
@RequestMapping("/supplier/leave")
public class BLeaveController extends BaseController
{
    @Autowired
    private IBLeaveService bLeaveService;

    /**
     * 查询离岗 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:leave:list')")
    @GetMapping("/list")
    public TableDataInfo list(BLeave bLeave)
    {
        startPage();
        List<BLeave> list = bLeaveService.selectBLeaveList(bLeave);
        return getDataTable(list);
    }

    /**
     * 导出离岗 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:leave:export')")
    @Log(title = "离岗 ", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BLeave bLeave)
    {
        List<BLeave> list = bLeaveService.selectBLeaveList(bLeave);
        ExcelUtil<BLeave> util = new ExcelUtil<BLeave>(BLeave.class);
        return util.exportExcel(list, "leave");
    }

    /**
     * 获取离岗 详细信息
     */
    @PreAuthorize("@ss.hasPermi('supplier:leave:query')")
    @GetMapping(value = "/{cId}")
    public AjaxResult getInfo(@PathVariable("cId") String cId)
    {
        return AjaxResult.success(bLeaveService.selectBLeaveById(cId));
    }

    /**
     * 新增离岗 
     */
    @PreAuthorize("@ss.hasPermi('supplier:leave:add')")
    @Log(title = "离岗 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BLeave bLeave)
    {
        return toAjax(bLeaveService.insertBLeave(bLeave));
    }

    /**
     * 修改离岗 
     */
    @PreAuthorize("@ss.hasPermi('supplier:leave:edit')")
    @Log(title = "离岗 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BLeave bLeave)
    {
        return toAjax(bLeaveService.updateBLeave(bLeave));
    }

    /**
     * 删除离岗 
     */
    @PreAuthorize("@ss.hasPermi('supplier:leave:remove')")
    @Log(title = "离岗 ", businessType = BusinessType.DELETE)
	@DeleteMapping("/{cIds}")
    public AjaxResult remove(@PathVariable String[] cIds)
    {
        return toAjax(bLeaveService.deleteBLeaveByIds(cIds));
    }
}
