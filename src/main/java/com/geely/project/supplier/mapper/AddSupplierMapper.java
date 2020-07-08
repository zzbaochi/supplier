package com.geely.project.supplier.mapper;

import com.geely.project.supplier.domain.bo.UserFirstBO;

import java.util.List;

/**
 * @author 占助
 * @date 2020/7/2 19:46
 * @description ${类的描述}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
public interface AddSupplierMapper {
    /**
     *根据ids批量查询用户和第一次列表
     * @param userIds
     * @return
     */
    public List<UserFirstBO> selectBUserByIds(String[] userIds);

}
