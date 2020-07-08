package com.geely.project.supplier.service.impl;

import java.util.List;
import com.geely.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.geely.project.supplier.mapper.BUserMapper;
import com.geely.project.supplier.domain.BUser;
import com.geely.project.supplier.service.IBUserService;

/**
 * 用户信息 Service业务层处理
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
@Service
public class BUserServiceImpl implements IBUserService 
{
    @Autowired
    private BUserMapper bUserMapper;

    /**
     * 查询用户信息 
     * 
     * @param userId 用户信息 ID
     * @return 用户信息 
     */
    @Override
    public BUser selectBUserById(String userId)
    {
        return bUserMapper.selectBUserById(userId);
    }

    /**
     * 查询用户信息 列表
     * 
     * @param bUser 用户信息 
     * @return 用户信息 
     */
    @Override
    public List<BUser> selectBUserList(BUser bUser)
    {
        return bUserMapper.selectBUserList(bUser);
    }

    /**
     * 新增用户信息 
     * 
     * @param bUser 用户信息 
     * @return 结果
     */
    @Override
    public int insertBUser(BUser bUser)
    {
        bUser.setCreateTime(DateUtils.getNowDate());
        return bUserMapper.insertBUser(bUser);
    }

    /**
     * 修改用户信息 
     * 
     * @param bUser 用户信息 
     * @return 结果
     */
    @Override
    public int updateBUser(BUser bUser)
    {
        bUser.setUpdateTime(DateUtils.getNowDate());
        return bUserMapper.updateBUser(bUser);
    }

    /**
     * 批量删除用户信息 
     * 
     * @param userIds 需要删除的用户信息 ID
     * @return 结果
     */
    @Override
    public int deleteBUserByIds(String[] userIds)
    {
        return bUserMapper.deleteBUserByIds(userIds);
    }

    /**
     * 删除用户信息 信息
     * 
     * @param userId 用户信息 ID
     * @return 结果
     */
    @Override
    public int deleteBUserById(String userId)
    {
        return bUserMapper.deleteBUserById(userId);
    }
}
