package com.geely.project.supplier.domain.bo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.geely.project.supplier.domain.vo.UserVO;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * @author 占助
 * @date 2020/7/2 15:56
 * @description ${首次办理和用户对象封装类}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
public class UserFirstBO {

    /** 用户id */
    private String userId;

    /** 姓名 */
    @ApiModelProperty(value = "姓名",required = true)
    private String userName;

    /** 联系方式 */
    @ApiModelProperty(value = "联系方式",required = true)
    private String phone;

    /** 性别 */
    @NotBlank(message = "性别不能为空")
    @ApiModelProperty(value = "性别-0：女，1：男",required = true)
    private String gender;

    /** 年龄 */
    @NotBlank(message = "年龄不能为空")
    @ApiModelProperty(value = "年龄",required = true)
    private String age;

    /** 籍贯 */
    @NotBlank(message = "籍贯不能为空")
    @ApiModelProperty(value = "籍贯",required = true)
    private String nativePlace;

    /** 身份证号码 */
    @NotBlank(message = "身份证号码不能为空")
    @Size(min = 0, max = 18, message = "身份证号码长度不能超过18个字符")
    @ApiModelProperty(value = "身份证号码",required = true)
    private String numberId;

    /** 身份证地址 */
    @NotBlank(message = "联系方式不能为空")
    @ApiModelProperty(value = "身份证地址",required = true)
    private String address;

    /** 最高学历 */
    @NotBlank(message = "最高学历不能为空")
    @ApiModelProperty(value = "最高学历",required = true)
    private String education;

    /** 毕业院校 */
    @NotBlank(message = "毕业院校不能为空")
    @ApiModelProperty(value = "毕业院校",required = true)
    private String graduate;

    /** 毕业时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @NotNull(message ="毕业时间不能为空")
    @ApiModelProperty(value = "毕业时间",required = true)
    private Date graduationTime;

    /** 专业 */
    @NotBlank(message = "专业不能为空")
    @ApiModelProperty(value = "专业",required = true)
    private String major;

    /** 工作年限 */
    @NotBlank(message = "工作年限不能为空")
    @ApiModelProperty(value = "工作年限",required = true)
    private String workYears;

    /** 服务对象 */
    @NotBlank(message = "服务对象不能为空")
    @ApiModelProperty(value = "服务对象",required = true)
    private String department;

    /** 服务项目组 */
    @NotBlank(message = "服务项目组不能为空")
    @ApiModelProperty(value = "服务项目组",required = true)
    private String projectTeam;

    /** 服务器项目名称 */
    @NotBlank(message = "服务项目名称不能为空")
    @ApiModelProperty(value = "服务项目名称",required = true)
    private String projectName;

    /** 餐卡办理 */
    @NotBlank(message = "餐卡办理不能为空")
    @ApiModelProperty(value = "餐卡办理-0：否，1：是",required = true)
    private String isCard;

    /** 硬盘应用 */
    @NotBlank(message = "硬盘领用不能为空")
    @ApiModelProperty(value = "硬盘领用-0：否，1：是",required = true)
    private String isCaliche;

    /** 电脑型号 */
    @NotBlank(message = "电脑型号不能为空")
    @ApiModelProperty(value = "电脑型号",required = true)
    private String computerType;

    /** 标段 */
    @ApiModelProperty(value = "标段-业务类型为租赁人员管理则必填")
    private String bidSection;

    /** 评价等级 */
    @ApiModelProperty(value = "评价等级-业务类型为租赁人员管理则必填")
    private String evaLevel;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public String getNumberId() {
        return numberId;
    }

    public void setNumberId(String numberId) {
        this.numberId = numberId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getGraduate() {
        return graduate;
    }

    public void setGraduate(String graduate) {
        this.graduate = graduate;
    }

    public Date getGraduationTime() {
        return graduationTime;
    }

    public void setGraduationTime(Date graduationTime) {
        this.graduationTime = graduationTime;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getWorkYears() {
        return workYears;
    }

    public void setWorkYears(String workYears) {
        this.workYears = workYears;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getProjectTeam() {
        return projectTeam;
    }

    public void setProjectTeam(String projectTeam) {
        this.projectTeam = projectTeam;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getIsCard() {
        return isCard;
    }

    public void setIsCard(String isCard) {
        this.isCard = isCard;
    }

    public String getIsCaliche() {
        return isCaliche;
    }

    public void setIsCaliche(String isCaliche) {
        this.isCaliche = isCaliche;
    }

    public String getComputerType() {
        return computerType;
    }

    public void setComputerType(String computerType) {
        this.computerType = computerType;
    }

    public String getBidSection() {
        return bidSection;
    }

    public void setBidSection(String bidSection) {
        this.bidSection = bidSection;
    }

    public String getEvaLevel() {
        return evaLevel;
    }

    public void setEvaLevel(String evaLevel) {
        this.evaLevel = evaLevel;
    }
}
