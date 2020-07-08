package com.geely.project.supplier.service;

import java.util.List;
import com.geely.project.supplier.domain.BUser;

/**
 * 用户信息 Service接口
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface IBUserService 
{
    /**
     * 查询用户信息 
     * 
     * @param userId 用户信息 ID
     * @return 用户信息 
     */
    public BUser selectBUserById(String userId);

    /**
     * 查询用户信息 列表
     * 
     * @param bUser 用户信息 
     * @return 用户信息 集合
     */
    public List<BUser> selectBUserList(BUser bUser);

    /**
     * 新增用户信息 
     * 
     * @param bUser 用户信息 
     * @return 结果
     */
    public int insertBUser(BUser bUser);

    /**
     * 修改用户信息 
     * 
     * @param bUser 用户信息 
     * @return 结果
     */
    public int updateBUser(BUser bUser);

    /**
     * 批量删除用户信息 
     * 
     * @param userIds 需要删除的用户信息 ID
     * @return 结果
     */
    public int deleteBUserByIds(String[] userIds);

    /**
     * 删除用户信息 信息
     * 
     * @param userId 用户信息 ID
     * @return 结果
     */
    public int deleteBUserById(String userId);
}
