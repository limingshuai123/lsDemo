package com.service.impl;

import com.dao.ISysLogDao;
import com.domain.SysLog;
import com.github.pagehelper.PageHelper;
import com.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/25
 **/
@Service
@Transactional(readOnly=true,propagation= Propagation.SUPPORTS)
public class SysLogImpl implements ISysLogService {
    @Autowired
    private ISysLogDao sysLogDao;
    @Override
    public void save(SysLog sysLog) {
        sysLogDao.save(sysLog);
    }

    @Override
    public List<SysLog> findAll(Integer page,Integer size) {
        PageHelper.startPage(page,size);
        return sysLogDao.findAll();
    }

    @Override
    public void deleteSysLog(List delList) {
        sysLogDao.deleteSysLog(delList);
    }

    @Override
    public List<SysLog> findAllLikeName(Integer page, Integer size, String username) {
        PageHelper.startPage(page,size);
        return sysLogDao.findAllLikeName(username);
    }
}
