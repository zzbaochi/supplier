package com.geely.project.supplier.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.geely.framework.aspectj.lang.annotation.Excel;
import com.geely.framework.web.domain.BaseEntity;

/**
 * 离岗 对象 b_leave
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public class BLeave extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 调用id */
    private String cId;

    /** 用户id */
    @Excel(name = "用户id")
    private String uId;

    /** 已交过押金 0：否，1：是 */
    @Excel(name = "已交过押金 0：否，1：是")
    private String isDeposit;

    /** 押金单号 */
    @Excel(name = "押金单号")
    private String depositName;

    /** 开户人姓名 */
    @Excel(name = "开户人姓名")
    private String accountName;

    /** 银行卡号 */
    @Excel(name = "银行卡号")
    private String accountCard;

    /** 支付名称 */
    @Excel(name = "支付名称")
    private String paymentName;

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
    public void setIsDeposit(String isDeposit) 
    {
        this.isDeposit = isDeposit;
    }

    public String getIsDeposit() 
    {
        return isDeposit;
    }
    public void setDepositName(String depositName) 
    {
        this.depositName = depositName;
    }

    public String getDepositName() 
    {
        return depositName;
    }
    public void setAccountName(String accountName) 
    {
        this.accountName = accountName;
    }

    public String getAccountName() 
    {
        return accountName;
    }
    public void setAccountCard(String accountCard) 
    {
        this.accountCard = accountCard;
    }

    public String getAccountCard() 
    {
        return accountCard;
    }
    public void setPaymentName(String paymentName) 
    {
        this.paymentName = paymentName;
    }

    public String getPaymentName() 
    {
        return paymentName;
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
            .append("isDeposit", getIsDeposit())
            .append("depositName", getDepositName())
            .append("accountName", getAccountName())
            .append("accountCard", getAccountCard())
            .append("paymentName", getPaymentName())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .append("status", getStatus())
            .toString();
    }
}
