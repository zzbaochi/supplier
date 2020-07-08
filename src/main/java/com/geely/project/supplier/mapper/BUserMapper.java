package com.geely.project.supplier.mapper;

import java.util.List;
import java.util.Map;

import com.geely.project.supplier.domain.BUser;
import com.geely.project.supplier.domain.bo.UserFirstBO;
import com.geely.project.supplier.domain.bo.UserInforBO;
import org.apache.ibatis.annotations.Param;

/**
 * 用户信息 Mapper接口
 * 
 * @author zhanzhu
 * @date 2020-06-24
 */
public interface BUserMapper 
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
     * 删除用户信息 
     * 
     * @param userId 用户信息 ID
     * @return 结果
     */
    public int deleteBUserById(String userId);

    /**
     * 批量删除用户信息 
     * 
     * @param userIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserByIds(String[] userIds);

    /**
     * 根据供应商编号和用户编号查询用户信息
     * @param map
     * @return
     */
    public List<UserInforBO> searchUserinfor  (@Param("paramsMap") Map<String,Object> map);

    /**
     * 获取最大的编号
     * @return
     */
    public String getUserNumberMax();



}
