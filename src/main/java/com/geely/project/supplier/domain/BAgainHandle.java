package com.geely.project.supplier.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.geely.framework.aspectj.lang.annotation.Excel;
import com.geely.framework.web.domain.BaseEntity;

/**
 * 续办 对象 b_again_handle
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public class BAgainHandle extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 调用id */
    private String cId;

    /** 用户id */
    @Excel(name = "用户id")
    private String uId;

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
