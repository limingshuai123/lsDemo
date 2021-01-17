package com.dao;

import com.domain.SysLog;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/25
 **/
public interface ISysLogDao {

    /**
     * 添加日志
     * @param sysLog
     */
    @Insert("insert into syslog(visitTime,username,ip,executionTime,method,url) values(#{visitTime},#{username},#{ip},#{executionTime},#{method},#{url})")
    void save(SysLog sysLog);

    /**
     * 查询日志消息以visitTime降序
     * @return
     */
    @Select("select * from syslog order by visitTime desc")
    @Results(id = "syslogResultMap" ,value={
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "visitTime",property = "visitTime"),
            @Result(column = "username",property = "username"),
            @Result(column = "url",property = "url"),
            @Result(column = "ip",property = "ip"),
            @Result(column = "executionTime",property = "executionTime"),
            @Result(column = "method",property = "method")
    })
    List<SysLog> findAll();


    /**
     * 多选删除日志
     */
      void  deleteSysLog(List delList);


    /**
     *   根据username模糊查询
     */
     @Select("select * from syslog where username like concat(concat('%',#{username},'%')) order by visitTime desc")
     List<SysLog> findAllLikeName(String username);




}
