package com.geely.project.supplier.domain.bo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author 占助
 * @date 2020/6/28 16:55
 * @description ${根据供应商和用户编号查询用户相关信息的对象}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
@ApiModel("查询用户相关信息")
public class UserInforBO {

    @ApiModelProperty("用户ID")
    private String uid;

    @ApiModelProperty("姓名")
    private String userName;

    @ApiModelProperty("用户编号")
    private String userNumber;

    @ApiModelProperty("用户联系方式")
    private String phone;

    @ApiModelProperty("调出品牌院")
    private String department;

    @ApiModelProperty("餐卡办理，0：否，1：是")
    private String isCard;

    @ApiModelProperty("硬盘应用，0：否，1：是")
    private String isCaliche;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(String userNumber) {
        this.userNumber = userNumber;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
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
}
