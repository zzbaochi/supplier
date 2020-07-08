package com.geely.project.supplier.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.geely.framework.aspectj.lang.annotation.Excel;
import com.geely.framework.web.domain.BaseEntity;

/**
 * 首次办理 对象 b_first_handle
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public class BFirstHandle extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 办理id */
    private String hId;

    /** 用户id */
    @Excel(name = "用户id")
    private String uId;

    /** 服务对象 */
    @Excel(name = "服务对象")
    private String department;

    /** 服务项目组 */
    @Excel(name = "服务项目组")
    private String projectTeam;

    /** 服务器项目名称 */
    @Excel(name = "服务器项目名称")
    private String projectName;

    /** 餐卡办理 0：否，1：是 */
    @Excel(name = "餐卡办理 0：否，1：是")
    private String isCard;

    /** 硬盘应用 0：否，1：是 */
    @Excel(name = "硬盘应用 0：否，1：是")
    private String isCaliche;

    /** 电脑型号 */
    @Excel(name = "电脑型号")
    private String computerType;

    /** 标段 业务类型为租赁人员管理则必填 */
    @Excel(name = "标段 业务类型为租赁人员管理则必填")
    private String bidSection;

    /** 评价等级 业务类型为租赁人员管理则必填 */
    @Excel(name = "评价等级 业务类型为租赁人员管理则必填")
    private String evaLevel;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    public void sethId(String hId) 
    {
        this.hId = hId;
    }

    public String gethId() 
    {
        return hId;
    }
    public void setuId(String uId) 
    {
        this.uId = uId;
    }

    public String getuId() 
    {
        return uId;
    }
    public void setDepartment(String department) 
    {
        this.department = department;
    }

    public String getDepartment() 
    {
        return department;
    }
    public void setProjectTeam(String projectTeam) 
    {
        this.projectTeam = projectTeam;
    }

    public String getProjectTeam() 
    {
        return projectTeam;
    }
    public void setProjectName(String projectName) 
    {
        this.projectName = projectName;
    }

    public String getProjectName() 
    {
        return projectName;
    }
    public void setIsCard(String isCard) 
    {
        this.isCard = isCard;
    }

    public String getIsCard() 
    {
        return isCard;
    }
    public void setIsCaliche(String isCaliche) 
    {
        this.isCaliche = isCaliche;
    }

    public String getIsCaliche() 
    {
        return isCaliche;
    }
    public void setComputerType(String computerType) 
    {
        this.computerType = computerType;
    }

    public String getComputerType() 
    {
        return computerType;
    }
    public void setBidSection(String bidSection) 
    {
        this.bidSection = bidSection;
    }

    public String getBidSection() 
    {
        return bidSection;
    }
    public void setEvaLevel(String evaLevel) 
    {
        this.evaLevel = evaLevel;
    }

    public String getEvaLevel() 
    {
        return evaLevel;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("hId", gethId())
            .append("uId", getuId())
            .append("department", getDepartment())
            .append("projectTeam", getProjectTeam())
            .append("projectName", getProjectName())
            .append("isCard", getIsCard())
            .append("isCaliche", getIsCaliche())
            .append("computerType", getComputerType())
            .append("bidSection", getBidSection())
            .append("evaLevel", getEvaLevel())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .append("status", getStatus())
            .toString();
    }
}
