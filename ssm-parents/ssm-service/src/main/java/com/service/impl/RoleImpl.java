package com.service.impl;

import com.dao.IRoleDao;
import com.domain.Permission;
import com.domain.Role;
import com.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/26
 **/
@Service
@Transactional(readOnly=true,propagation= Propagation.SUPPORTS)
public class RoleImpl implements IRoleService {
    @Autowired
    private IRoleDao roleDao;
    @Override
    public List<Role> findAll() {
        return roleDao.findAll();
    }

    @Override
    public void save(Role role) {
        roleDao.save(role);
    }

    @Override
    public Role findById(Integer roleId) {
        return roleDao.findById(roleId);
    }

    @Override
    public List<Permission> findNotPermission(Integer id) {
        return roleDao.findNotPermission(id);
    }

    @Override
    public void permissionAdd(Integer roleId, Integer[] permissionIds) {
        for (Integer permissionId : permissionIds) {
             roleDao.premission_roleAdd(roleId,permissionId);
        }
    }

    @Override
    public void deleteRole_permission(Integer roleId) {
        roleDao.deleteRole(roleId);
        roleDao.deleteRole_permission(roleId);
    }
}
