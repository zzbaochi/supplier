package com.geely.project.supplier.domain.vo;

import com.geely.framework.aspectj.lang.annotation.Excel;

import java.util.Date;

/**
 * @author 占助
 * @date 2020/6/24 16:39
 * @description ${用户导入excel封装对象类}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
public class UserExcelVO {

    /** 姓名 */
    @Excel(name = "姓名")
    private String userName;

    /**  联系电话 */
    @Excel(name = "手机号码")
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
    @Excel(name = "身份证号码/护照")
    private String numberId;

    /** 身份证地址 */
    @Excel(name = "身份证地址")
    private String address;

    /** 状态 0：首次,：1：调动,2：续办,3：离岗 */
    //@Excel(name = "状态",readConverterExp = "0=首次,1=调动,2=续办,3=离岗")
   // private String status;

    /** 最高学历 */
    @Excel(name = "全日制最高学历")
    private String education;

    /** 毕业院校 */
    @Excel(name = "毕业院校")
    private String graduate;

    /** 毕业时间 */
    @Excel(name = "毕业时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date graduationTime;

    /** 专业 */
    @Excel(name = "专业")
    private String major;

    /** 工作年限 */
    @Excel(name = "工作年限")
    private String workYears;

    /** 服务对象 */
    @Excel(name = "服务对象")
    private String department;

    /** 服务项目组 */
    @Excel(name = "服务项目组")
    private String projectTeam;

    /** 服务项目名称 */
    @Excel(name = "服务项目名称")
    private String projectName;

    /** 餐卡办理 0：否，1：是 */
    @Excel(name = "餐卡办理",readConverterExp = "0=否,1=是")
    private String isCard;

    /** 领用硬盘 0：否，1：是 */
    @Excel(name = "领用硬盘",readConverterExp = "0=否,1=是")
    private String isCaliche;

    /** 电脑型号 */
    @Excel(name = "电脑规格型号")
    private String computerType;

    /** 标段 业务类型为租赁人员管理则必填 */
    //@Excel(name = "标段,业务类型为租赁人员管理则必填")
    private String bidSection;

    /** 评价等级 业务类型为租赁人员管理则必填 */
    //@Excel(name = "评价等级,业务类型为租赁人员管理则必填")
    private String evaLevel;



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
