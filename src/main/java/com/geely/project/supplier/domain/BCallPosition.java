package com.geely.project.supplier.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.geely.framework.aspectj.lang.annotation.Excel;
import com.geely.framework.web.domain.BaseEntity;

/**
 * 调动 对象 b_call_position
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public class BCallPosition extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 调用id */
    private String cId;

    /** 用户id */
    @Excel(name = "用户id")
    private String uId;

    /** 调出品牌院/中心 首次办理的服务对象 */
    @Excel(name = "调出品牌院/中心 首次办理的服务对象")
    private String exportDep;

    /** 调入品牌院/中心 */
    @Excel(name = "调入品牌院/中心")
    private String entryDep;

    /** 调入服务项目组 */
    @Excel(name = "调入服务项目组")
    private String projectTeam;

    /** 调入服务项目名称 */
    @Excel(name = "调入服务项目名称")
    private String projectName;

    /** 标段 业务类型为租赁人员管理则必填 */
    @Excel(name = "标段 业务类型为租赁人员管理则必填")
    private String bidSection;

    /** 评价等级 业务类型为租赁人员管理则必填 */
    @Excel(name = "评价等级 业务类型为租赁人员管理则必填")
    private String evaLevel;

    /** 需要办理餐卡 0：否，1：是 */
    @Excel(name = "需要办理餐卡 0：否，1：是")
    private String isCard;

    /** 需要领用硬盘 0：否，1：是 */
    @Excel(name = "需要领用硬盘 0：否，1：是")
    private String isCaliche;

    /** 电脑型号 */
    @Excel(name = "电脑型号")
    private String computerType;
    /** 状态 */
    @Excel(name = "状态")
    private String status;

    public void setcId(String cId) 
    {
        this.cId = cId;
    }
    public String getcId() 
    {
        return cId;
    }

    public void setuId(String uId) 
    {
        this.uId = uId;
    }
    public String getuId() 
    {
        return uId;
    }

    public void setExportDep(String exportDep) 
    {
        this.exportDep = exportDep;
    }

    public String getExportDep() 
    {
        return exportDep;
    }
    public void setEntryDep(String entryDep) 
    {
        this.entryDep = entryDep;
    }

    public String getEntryDep() 
    {
        return entryDep;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("cId", getcId())
            .append("uId", getuId())
            .append("exportDep", getExportDep())
            .append("entryDep", getEntryDep())
            .append("projectTeam", getProjectTeam())
            .append("projectName", getProjectName())
            .append("bidSection", getBidSection())
            .append("evaLevel", getEvaLevel())
            .append("isCard", getIsCard())
            .append("isCaliche", getIsCaliche())
            .append("computerType", getComputerType())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .append("status", getStatus())
            .toString();
    }
}
