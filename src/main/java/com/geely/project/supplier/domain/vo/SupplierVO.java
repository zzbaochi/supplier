package com.geely.project.supplier.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.geely.framework.aspectj.lang.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.*;
import java.util.Date;

/**
 * @author 占助
 * @date 2020/6/24 13:14
 * @description ${供应商BO}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
@ApiModel("供应商实体")
public class SupplierVO {

    /** 供应商公司名称 */
    @NotBlank(message = "供应商公司名称不能为空")
    @Size(min = 0, max = 30, message = "供应商公司名称长度不能超过30个字符")
    @ApiModelProperty(value = "供应商公司名称",required = true)
    private String sName;

    /** 预计开始时间 */
    @NotNull(message = "预计开始日期不能为空")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "预计开始时间",required = true)
    private Date startDate;

    /** 预计结束日期 */
    @NotNull(message = "预计结束日期不能为空")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "预计结束日期",required = true)
    private Date endDate;

    /** 办理类型 */
    @NotBlank(message = "办理类型名称不能为空")
    @Max(value = 4,message = "办理类型的值必须小于4")
    @Min(value = 1,message = "办理类型的值大于等于1")
    @ApiModelProperty( value = "办理类型-1首次办理、2续办、3调动、4离岗",required = true)
    private String checkType;

    /** 业务类型 */
    @NotBlank(message = "业务类型不能为空")
    @Max(value = 2,message = "业务类型的值必须小于2")
    @Min(value = 1,message = "业务类型的值大于等于1")
    @ApiModelProperty(value = "业务类型-1租赁人员管理、2供应商驻司人员管理",required = true)
    private String busType;

    /** 事由 */
    @NotBlank(message = "供应商公司名称不能为空")
    @ApiModelProperty(value = "事由",required = true)
    private String subjectMatter;

    /** 吉利对接人姓名 */
    @NotBlank(message = "吉利对接人姓名不能为空")
    @ApiModelProperty(value = "吉利对接人姓名",required = true)
    private String counterpartName;

    /** 吉利对接人工号 */
    @NotBlank(message = "吉利对接人工号不能为空")
    @ApiModelProperty(value = "吉利对接人工号",required = true)
    private String counterpartNumber;




    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }


    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }


    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }


    public String getCheckType() {
        return checkType;
    }

    public void setCheckType(String checkType) {
        this.checkType = checkType;
    }


    public String getBusType() {
        return busType;
    }

    public void setBusType(String busType) {
        this.busType = busType;
    }

    public String getSubjectMatter() {
        return subjectMatter;
    }

    public void setSubjectMatter(String subjectMatter) {
        this.subjectMatter = subjectMatter;
    }

    public String getCounterpartName() {
        return counterpartName;
    }

    public void setCounterpartName(String counterpartName) {
        this.counterpartName = counterpartName;
    }


    public String getCounterpartNumber() {
        return counterpartNumber;
    }


    public void setCounterpartNumber(String counterpartNumber) {
        this.counterpartNumber = counterpartNumber;
    }
}
