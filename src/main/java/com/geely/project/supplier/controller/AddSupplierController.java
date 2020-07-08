package com.geely.project.supplier.controller;

import com.geely.common.utils.StringUtils;
import com.geely.common.utils.poi.ExcelUtil;
import com.geely.framework.aspectj.lang.annotation.RedisRateLimiter;
import com.geely.framework.web.controller.BaseController;
import com.geely.framework.web.domain.AjaxResult;
import com.geely.project.supplier.domain.BSupplier;
import com.geely.project.supplier.domain.BSupplierMaintain;
import com.geely.project.supplier.domain.vo.SupplierAndUserVO;
import com.geely.project.supplier.domain.vo.SupplierVO;
import com.geely.project.supplier.domain.vo.UserVO;
import com.geely.project.supplier.domain.vo.UserExcelVO;
import com.geely.project.supplier.service.AddSupplierService;
import com.geely.project.supplier.service.IBSupplierMaintainService;
import com.geely.project.supplier.service.IBSupplierService;
import com.sun.org.apache.regexp.internal.RE;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

/**
 * @author 占助
 * @date 2020/6/24 10:08
 * @description ${供应商录入供应商和用户信息}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
@Api(value = "供应商添加接口",tags = {"供应商添加接口" })
@RestController
@RequestMapping("/vi/api")
public class AddSupplierController extends BaseController {


    @Autowired
    private IBSupplierService bSupplierService;
    @Autowired
    private AddSupplierService addSupplierService;
    @Autowired
    private RedissonClient redissonClient;
    @Autowired
    private IBSupplierMaintainService bSupplierMaintainService;
    /**
     * 新增供应商 和 供应商列表
     */
    @ApiOperation(value = "首次办理",notes = "首次办理",httpMethod = "POST")
    @PostMapping("/firstAdd")
    public AjaxResult addSupplier(@Validated  @RequestBody SupplierAndUserVO supplierAndUserVO) {
        return addSupplierService.firstAddSupplier(supplierAndUserVO);
    }

    @ApiOperation(value = "用户导入模板下载",notes = "用户导入模板下载",httpMethod = "GET")
    @GetMapping("/importTemplate")
    public AjaxResult importTemplate() {
        ExcelUtil<UserExcelVO> util = new ExcelUtil<UserExcelVO>(UserExcelVO.class);
        return util.importTemplateExcel("供应商导入模板");
    }

    @ApiOperation(value = "供应商导入",notes = "供应商导入",httpMethod = "POST")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file) throws Exception {
        ExcelUtil<UserExcelVO> util = new ExcelUtil<UserExcelVO>(UserExcelVO.class);
        List<UserExcelVO> userList = util.importExcel(file.getInputStream());
        AjaxResult result = new AjaxResult();
        for(UserExcelVO userExcelVO: userList){
            result = isParaneter(userExcelVO);
            if(result.get("code").toString().equals("500")){
                return  result;
            }
        }
        return addSupplierService.AddSupplier(userList);
    }

    @ApiOperation(value = "根据用户编号和供应商编号获取用户信息",notes = "根据用户编号和供应商编号获取用户信息",httpMethod = "GET")
    @GetMapping("/getUser")
    public AjaxResult getUser(
            @ApiParam(name="sNumber",value = "供应商编号",required = true)@RequestParam String sNumber,
            @ApiParam(name="userNumber",value = "用户编号",required = true)@RequestParam String userNumber)  {
        if (StringUtils.isNull(sNumber) && StringUtils.isNull(userNumber)) {
            return AjaxResult.error("用户编号和供应商编号不能为空!");
        }
        return  addSupplierService.queryByUserNumber(sNumber, userNumber);
    }

//    @ApiOperation(value = "用户数组查询用户",notes = "用户数组查询用户",httpMethod = "POST")
//    @PostMapping("/queryUserByIds")
//    public AjaxResult queryUserByIds(
//            @ApiParam(name="userIds",value = "用户ID数组",required = true)@RequestParam String[] userIds)  {
//        return AjaxResult.success(addSupplierService.selectBUserByIds(userIds));
//    }

    @ApiOperation(value = "添加供应商",notes = "添加供应商",httpMethod = "POST")
    @RedisRateLimiter(value = 20, limit = 1)
    @PostMapping("/addSupplier")
    public AjaxResult add(@RequestBody BSupplierMaintain bSupplierMaintain) {
        return toAjax(bSupplierMaintainService.insertBSupplierMaintain(bSupplierMaintain));
    }


    public AjaxResult isParaneter(UserExcelVO userExcelVO){
        if(StringUtils.isEmpty(userExcelVO.getUserName())){
            return AjaxResult.error("姓名不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getPhone())){
            return AjaxResult.error("手机号不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getGender())){
            return AjaxResult.error("性别不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getAge())){
            return AjaxResult.error("年龄不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getNativePlace())){
            return AjaxResult.error("籍贯不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getNumberId())){
            return AjaxResult.error("身份证号码/护照不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getAddress())){
            return AjaxResult.error("身份证地址不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getEducation())){
            return AjaxResult.error("全日制最高学历不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getGraduate())){
            return AjaxResult.error("毕业院校不能为空");
        }
        if(userExcelVO.getGraduationTime() == null || "".equals(userExcelVO.getGraduationTime())){
            return AjaxResult.error("毕业时间不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getMajor())){
            return AjaxResult.error("专业不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getWorkYears())){
            return AjaxResult.error("工作年限不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getDepartment())){
            return AjaxResult.error("服务对象不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getProjectTeam())){
            return AjaxResult.error("服务项目组不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getProjectName())){
            return AjaxResult.error("服务项目名称不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getIsCard())){
            return AjaxResult.error("餐卡办理不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getIsCaliche())){
            return AjaxResult.error("领用硬盘不能为空");
        }
        if(StringUtils.isEmpty(userExcelVO.getComputerType())){
            return AjaxResult.error("电脑规格型号不能为空");
        }
        return AjaxResult.success();
    }
}
