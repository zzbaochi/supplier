package com.geely.common.enums;

/**
 * @author 占助
 * @date 2020/6/30 9:36
 * @description ${办理类型, 1首次办理、2续办、3离岗、4调动}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
public enum SexEnum {
    WOMAN("0", "女"),
    MAN("1", "男");

    private final String code;
    private final String mes;

    SexEnum(String code, String mes)
    {
        this.code = code;
        this.mes = mes;
    }

    public String getCode()
    {
        return code;
    }

    public String getMes()
    {
        return mes;
    }
}
