package com.domain;

/**
 * @Auther 笙
 * @Date 2020/12/23
 **/

import java.util.List;

/**
 * 角色表
 */
public class Role {

    //角色表id
    private  Integer id;
    //角色表名称
    private  String roleName;

    //角色表叙述
    private  String roleDesc;
    //一个角色对应多个权限
    private List<Permission> permissions;
    //一个角色对应多个用户
    private  List<UserInfo> users;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public List<UserInfo> getUsers() {
        return users;
    }

    public void setUsers(List<UserInfo> users) {
        this.users = users;
    }
}
