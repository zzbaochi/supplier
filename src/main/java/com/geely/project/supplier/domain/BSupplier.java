package com.geely.project.supplier.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.geely.framework.aspectj.lang.annotation.Excel;
import com.geely.framework.web.domain.BaseEntity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 供应商 对象 b_supplier
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public class BSupplier extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 供应商id */
    private String sId;

    /** 供应商公司名称 */
    @Excel(name = "供应商公司名称")
    private String sName;

    /** 供应商编号 */
    @Excel(name = "供应商编号")
    private String sNumber;

    /** 预计开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 预计结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 办理类型 1首次办理、2续办、3离岗、4调动 */
    @Excel(name = "办理类型 1首次办理、2续办、3离岗、4调动")
    private String checkType;

    /** 业务类型 1租赁人员管理、2供应商驻司人员管理 */
    @Excel(name = "业务类型 1租赁人员管理、2供应商驻司人员管理")
    private String busType;

    /** 事由 */
    @Excel(name = "事由")
    private String subjectMatter;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 吉利对接人姓名 */
    @Excel(name = "吉利对接人姓名")
    private String counterpartName;

    /** 吉利对接人工号 */
    @Excel(name = "吉利对接人工号")
    private String counterpartNumber;



    public void setsId(String sId) 
    {
        this.sId = sId;
    }

    public String getsId() 
    {
        return sId;
    }
    public void setsNumber(String sNumber) {
        this.sNumber = sNumber;
    }

    public String getsNumber() {
        return sNumber;
    }


    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public void setStartDate(Date startDate)
    {
        this.startDate = startDate;
    }

    public Date getStartDate() 
    {
        return startDate;
    }
    public void setEndDate(Date endDate) 
    {
        this.endDate = endDate;
    }

    public Date getEndDate() 
    {
        return endDate;
    }
    public void setCheckType(String checkType) 
    {
        this.checkType = checkType;
    }

    public String getCheckType() 
    {
        return checkType;
    }
    public void setBusType(String busType) 
    {
        this.busType = busType;
    }

    public String getBusType() 
    {
        return busType;
    }
    public void setSubjectMatter(String subjectMatter) 
    {
        this.subjectMatter = subjectMatter;
    }

    public String getSubjectMatter() 
    {
        return subjectMatter;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setCounterpartName(String counterpartName) 
    {
        this.counterpartName = counterpartName;
    }

    public String getCounterpartName() 
    {
        return counterpartName;
    }
    public void setCounterpartNumber(String counterpartNumber) 
    {
        this.counterpartNumber = counterpartNumber;
    }

    public String getCounterpartNumber() 
    {
        return counterpartNumber;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("sId", getsId())
                .append("sName", getsName())
                .append("sNumber", getsNumber())
                .append("startDate", getStartDate())
                .append("endDate", getEndDate())
                .append("checkType", getCheckType())
                .append("busType", getBusType())
                .append("subjectMatter", getSubjectMatter())
                .append("status", getStatus())
                .append("counterpartName", getCounterpartName())
                .append("counterpartNumber", getCounterpartNumber())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("createBy", getCreateBy())
                .append("updateBy", getUpdateBy())
                .append("remark", getRemark())
                .toString();
    }
}
