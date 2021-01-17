package com.service;


import com.domain.Permission;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/26
 **/
public interface IPermissionsService {

    List<Permission> findAll();
    void save(Permission permission);

    void deleteId(Integer id);
}
