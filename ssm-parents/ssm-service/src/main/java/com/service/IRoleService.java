package com.service;

import com.domain.Permission;
import com.domain.Role;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/26
 **/
public interface IRoleService {
    //查询所有角色
    List<Role> findAll();
    //添加角色
    void save(Role role);

    //给角色添加权限
    Role findById(Integer roleId);
    List<Permission> findNotPermission(Integer id);
    void  permissionAdd(Integer roleId,Integer[] permissionIds);

    //删除角色及对应权限
    void deleteRole_permission(Integer roleId);

}
