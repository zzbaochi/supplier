package com.geely.project.supplier.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * @author 占助
 * @date 2020/7/6 9:58
 * @description ${调用用户类对象封装对象}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
@ApiModel("调动供应商人员信息")
public class CallPositionVO {

    @ApiModelProperty("用户ID")
    private String uid;

    /** 姓名 */
    @NotBlank(message = "姓名不能为空")
    @Size(min = 0, max = 10, message = "姓名长度不能超过10个字符")
    @ApiModelProperty(value = "姓名",required = true)
    private String userName;




}
