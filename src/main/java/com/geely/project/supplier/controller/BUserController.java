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
import com.geely.project.supplier.domain.BUser;
import com.geely.project.supplier.service.IBUserService;
import com.geely.framework.web.controller.BaseController;
import com.geely.framework.web.domain.AjaxResult;
import com.geely.common.utils.poi.ExcelUtil;
import com.geely.framework.web.page.TableDataInfo;

/**
 * 用户信息 Controller
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@RestController
@RequestMapping("/supplier/user")
public class BUserController extends BaseController
{
    @Autowired
    private IBUserService bUserService;

    /**
     * 查询用户信息 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(BUser bUser)
    {
        startPage();
        List<BUser> list = bUserService.selectBUserList(bUser);
        return getDataTable(list);
    }

    /**
     * 导出用户信息 列表
     */
    @PreAuthorize("@ss.hasPermi('supplier:user:export')")
    @Log(title = "用户信息 ", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BUser bUser)
    {
        List<BUser> list = bUserService.selectBUserList(bUser);
        ExcelUtil<BUser> util = new ExcelUtil<BUser>(BUser.class);
        return util.exportExcel(list, "user");
    }

    /**
     * 获取用户信息 详细信息
     */
    @PreAuthorize("@ss.hasPermi('supplier:user:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") String userId)
    {
        return AjaxResult.success(bUserService.selectBUserById(userId));
    }

    /**
     * 新增用户信息 
     */
    @PreAuthorize("@ss.hasPermi('supplier:user:add')")
    @Log(title = "用户信息 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BUser bUser)
    {
        return toAjax(bUserService.insertBUser(bUser));
    }

    /**
     * 修改用户信息 
     */
    @PreAuthorize("@ss.hasPermi('supplier:user:edit')")
    @Log(title = "用户信息 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BUser bUser)
    {
        return toAjax(bUserService.updateBUser(bUser));
    }

    /**
     * 删除用户信息 
     */
    @PreAuthorize("@ss.hasPermi('supplier:user:remove')")
    @Log(title = "用户信息 ", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable String[] userIds)
    {
        return toAjax(bUserService.deleteBUserByIds(userIds));
    }
}
