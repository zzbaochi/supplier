package com.geely.project.supplier.domain.vo;

import com.geely.project.supplier.domain.vo.SupplierVO;
import com.geely.project.supplier.domain.vo.UserVO;

import javax.validation.Valid;
import java.util.List;

/**
 * @author 占助
 * @date 2020/6/24 13:34
 * @description ${供应商和用户包装类}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
public class SupplierAndUserVO {

    @Valid
    public SupplierVO supplierVO;

    @Valid
    public List<UserVO> userVOList;

    public SupplierVO getSupplierVO() {
        return supplierVO;
    }

    public void setSupplierVO(SupplierVO supplierVO) {
        this.supplierVO = supplierVO;
    }

    public List<UserVO> getUserVOList() {
        return userVOList;
    }

    public void setUserVOList(List<UserVO> userVOList) {
        this.userVOList = userVOList;
    }
}
