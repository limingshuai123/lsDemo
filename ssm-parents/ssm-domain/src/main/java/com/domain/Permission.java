package com.domain;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/23
 **/
public class Permission {
    //权限id值
    private  Integer id;
    //权限名
    private  String permissionName;
    //资源路径
    private String url;
    //一个权限对应多个角色
    private List<Role> roles;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}
