package com.geely.project.supplier.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.geely.framework.aspectj.lang.annotation.Excel;
import com.geely.framework.web.domain.BaseEntity;

/**
 * 供应商维护 对象 b_supplier_maintain
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public class BSupplierMaintain extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 供应商id */
    private String sId;

    /** 供应商编号 */
    @Excel(name = "供应商编号")
    private String sNumber;

    /** 供应商公司名称 */
    @Excel(name = "供应商公司名称")
    private String sName;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    public void setsId(String sId) 
    {
        this.sId = sId;
    }

    public String getsId() 
    {
        return sId;
    }
    public void setsNumber(String sNumber) 
    {
        this.sNumber = sNumber;
    }

    public String getsNumber() 
    {
        return sNumber;
    }
    public void setsName(String sName) 
    {
        this.sName = sName;
    }

    public String getsName() 
    {
        return sName;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("sId", getsId())
            .append("sNumber", getsNumber())
            .append("sName", getsName())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .toString();
    }
}
