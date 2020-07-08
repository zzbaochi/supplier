package com.geely.project.supplier.service;


import com.geely.framework.web.domain.AjaxResult;
import com.geely.project.supplier.domain.bo.UserFirstBO;
import com.geely.project.supplier.domain.vo.SupplierAndUserVO;
import com.geely.project.supplier.domain.vo.UserExcelVO;

import java.util.List;

/**
 * 外部供应商操作的service层
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface AddSupplierService {

    /**
     * 供应商导入用户接口
     * @param userList
     * @return
     */
    public AjaxResult AddSupplier(List<UserExcelVO> userList) ;

    /**
     * 根据供应商编号和用户编号查询用户信息
     * @param sNumber  供应商编号
     * @param userNumber 用户编号
     * @return
     */
    public AjaxResult queryByUserNumber(String sNumber,String userNumber);

    /**
     *
     * @param supplierAndUserVO
     * @return
     */
    public AjaxResult firstAddSupplier( SupplierAndUserVO supplierAndUserVO);

    /**
     *根据ids批量查询用户和第一次列表
     * @param userIds
     * @return
     */
    public List<UserFirstBO> selectBUserByIds(String[] userIds);
}
