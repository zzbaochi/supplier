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
import com.geely.project.supplier.domain.BCallPosition;
import com.geely.project.supplier.service.IBCallPositionService;
import com.geely.framework.web.controller.BaseController;
import com.geely.framework.web.domain.AjaxResult;
import com.geely.common.utils.poi.ExcelUtil;
import com.geely.framework.web.page.TableDataInfo;

/**
 * 调动 Controller
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@RestController
@RequestMapping("/supplier/position")
public class BCallPositionController extends BaseController
{
    @Autowired
    private IBCallPositionService bCallPositionService;

    /**
     * 查询调动 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:position:list')")
    @GetMapping("/list")
    public TableDataInfo list(BCallPosition bCallPosition)
    {
        startPage();
        List<BCallPosition> list = bCallPositionService.selectBCallPositionList(bCallPosition);
        return getDataTable(list);
    }

    /**
     * 导出调动 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:position:export')")
    @Log(title = "调动 ", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BCallPosition bCallPosition)
    {
        List<BCallPosition> list = bCallPositionService.selectBCallPositionList(bCallPosition);
        ExcelUtil<BCallPosition> util = new ExcelUtil<BCallPosition>(BCallPosition.class);
        return util.exportExcel(list, "position");
    }

    /**
     * 获取调动 详细信息
     */
    @PreAuthorize("@ss.hasPermi('supplier:position:query')")
    @GetMapping(value = "/{cId}")
    public AjaxResult getInfo(@PathVariable("cId") String cId)
    {
        return AjaxResult.success(bCallPositionService.selectBCallPositionById(cId));
    }

    /**
     * 新增调动 
     */
    @PreAuthorize("@ss.hasPermi('supplier:position:add')")
    @Log(title = "调动 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BCallPosition bCallPosition)
    {
        return toAjax(bCallPositionService.insertBCallPosition(bCallPosition));
    }

    /**
     * 修改调动 
     */
    @PreAuthorize("@ss.hasPermi('supplier:position:edit')")
    @Log(title = "调动 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BCallPosition bCallPosition)
    {
        return toAjax(bCallPositionService.updateBCallPosition(bCallPosition));
    }

    /**
     * 删除调动 
     */
    @PreAuthorize("@ss.hasPermi('supplier:position:remove')")
    @Log(title = "调动 ", businessType = BusinessType.DELETE)
	@DeleteMapping("/{cIds}")
    public AjaxResult remove(@PathVariable String[] cIds)
    {
        return toAjax(bCallPositionService.deleteBCallPositionByIds(cIds));
    }
}
