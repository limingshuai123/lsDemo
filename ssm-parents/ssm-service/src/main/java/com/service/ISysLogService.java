package com.service;

import com.domain.SysLog;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/25
 **/
public interface ISysLogService {

    void save(SysLog sysLog);
    List<SysLog> findAll(Integer page,Integer size);

    void  deleteSysLog(List delList);

    List<SysLog> findAllLikeName( Integer page,Integer size, String username);

}
