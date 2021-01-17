package com.service;

import com.domain.Product;
import com.domain.Role;
import com.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/23
 **/
public interface IUserService extends UserDetailsService {
    //查询
    List<UserInfo> findAll(Integer page,Integer size);
    //添加
    void save(UserInfo userInfo);

    //给用户添加角色
    UserInfo findById(Integer id);
    List<Role> findOtherRoles(Integer userId);
    void addRoleToUser(Integer userId,Integer[]roleIds);

    //删除用户
    void  deleteUser_Role(Integer uId);
    //模糊查询
    List<UserInfo> findAllLikeName(Integer page,Integer size,String username);
}
