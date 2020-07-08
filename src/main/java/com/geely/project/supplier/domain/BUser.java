package com.geely.project.supplier.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.geely.framework.aspectj.lang.annotation.Excel;
import com.geely.framework.web.domain.BaseEntity;

import javax.validation.constraints.NotBlank;

/**
 * 用户信息 对象 b_user
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public class BUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户id */
    private String userId;

    /** 人员编号 */
    @Excel(name = "人员编号")
    private String userNumber;

    /** 供应商id */
    //@Excel(name = "供应商id")
    private String sNumber;

    /** 姓名 姓名 */
    @Excel(name = "姓名")
    private String userName;
    /** 账号 */
    //@Excel(name = "账号")
    private String userAccount;

    /** 卡号 */
    //@Excel(name = "卡号")
    private String cardNumber;


    /** 联系方式 联系电话 */
    @Excel(name = "联系方式")
    private String phone;

    /** 性别 0：女，1：男 */
    @Excel(name = "性别 ",readConverterExp = "0=女,1=男")
    private String gender;

    /** 年龄 */
    @Excel(name = "年龄")
    private String age;

    /** 籍贯 */
    @Excel(name = "籍贯")
    private String nativePlace;

    /** 身份证号码 */
    @Excel(name = "身份证号码")
    private String numberId;

    /** 身份证地址 */
    @Excel(name = "身份证地址")
    private String address;

    /** 状态 0：首次,：1：调动,2：续办,3：离岗 */
    //@Excel(name = "状态",readConverterExp = "0=首次,1=调动,2=续办,3=离岗")
    private String status;

    /** 最高学历 */
    @Excel(name = "最高学历")
    private String education;

    /** 毕业院校 */
    @Excel(name = "毕业院校")
    private String graduate;

    /** 毕业时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "毕业时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date graduationTime;

    /** 专业 */
    @Excel(name = "专业")
    private String major;

    /** 工作年限 */
    @Excel(name = "工作年限")
    private String workYears;


    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setsNumber(String sNumber) 
    {
        this.sNumber = sNumber;
    }

    public String getsNumber() 
    {
        return sNumber;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() { return userName; }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setGender(String gender) 
    {
        this.gender = gender;
    }

    public String getGender() 
    {
        return gender;
    }
    public void setAge(String age) 
    {
        this.age = age;
    }

    public String getAge() 
    {
        return age;
    }
    public void setNativePlace(String nativePlace) 
    {
        this.nativePlace = nativePlace;
    }

    public String getNativePlace() 
    {
        return nativePlace;
    }
    public void setNumberId(String numberId) 
    {
        this.numberId = numberId;
    }

    public String getNumberId() 
    {
        return numberId;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setEducation(String education) 
    {
        this.education = education;
    }

    public String getEducation() 
    {
        return education;
    }
    public void setGraduate(String graduate) 
    {
        this.graduate = graduate;
    }

    public String getGraduate() 
    {
        return graduate;
    }
    public void setGraduationTime(Date graduationTime) 
    {
        this.graduationTime = graduationTime;
    }

    public Date getGraduationTime() 
    {
        return graduationTime;
    }
    public void setMajor(String major) 
    {
        this.major = major;
    }

    public String getMajor() 
    {
        return major;
    }
    public void setWorkYears(String workYears) 
    {
        this.workYears = workYears;
    }

    public String getWorkYears() 
    {
        return workYears;
    }

    public String getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(String userNumber) {
        this.userNumber = userNumber;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("userId", getUserId())
                .append("userNumber", getUserNumber())
                .append("sNumber", getsNumber())
                .append("userName", getUserName())
                .append("userAccount", getUserAccount())
                .append("cardNumber", getCardNumber())
                .append("phone", getPhone())
                .append("gender", getGender())
                .append("age", getAge())
                .append("nativePlace", getNativePlace())
                .append("numberId", getNumberId())
                .append("address", getAddress())
                .append("status", getStatus())
                .append("education", getEducation())
                .append("graduate", getGraduate())
                .append("graduationTime", getGraduationTime())
                .append("major", getMajor())
                .append("workYears", getWorkYears())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("createBy", getCreateBy())
                .append("updateBy", getUpdateBy())
                .append("remark", getRemark())
                .toString();
    }
}
