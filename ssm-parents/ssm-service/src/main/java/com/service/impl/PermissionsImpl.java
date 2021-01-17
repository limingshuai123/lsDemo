package com.service.impl;
import com.dao.IPermissionsDao;
import com.domain.Permission;
import com.service.IPermissionsService;
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
public class PermissionsImpl implements IPermissionsService {

    @Autowired
    private IPermissionsDao permissionsDao;

    @Override
    public List<Permission> findAll() {
        return permissionsDao.findAll();
    }

    @Override
    public void save(Permission permission) {
         permissionsDao.save(permission);
    }

    @Override
    public void deleteId(Integer id) {
        permissionsDao.deleteId(id);
    }
}
