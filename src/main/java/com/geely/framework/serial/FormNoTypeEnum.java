package com.geely.framework.serial;

/**
 * @author 占助
 * @date 2020/6/29 13:37
 * @description ${单号生成类型枚举}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 * 生成规则 = 1位字母+7位数字流水码，1开始
 */
public enum FormNoTypeEnum {
    /**
     * 用户单号：
     * 固定前缀：S
     */
    USER_ORDER("S" ),
    /**
     * 供应商单号：
     * 固定前缀：P
     */
    SUPPLIER_ORDER("P"),
    ;

    /**
     * 单号前缀
     * 为空时填""
     */
    private String prefix;


    FormNoTypeEnum(String prefix ) {
        this.prefix = prefix;

    }

    public String getPrefix() {
        return prefix;
    }

}
