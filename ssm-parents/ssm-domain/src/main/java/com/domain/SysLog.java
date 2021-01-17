package com.domain;

/**
 * @Auther 笙
 * @Date 2020/12/23
 **/

import com.util.DateUtils;

import java.util.Date;

/**
 * 日志类
 */
public class SysLog {
    //日志id
     private   Integer id;
     private  String  username;
     //访问时间
    private Date visitTime;
    private  String visitTimeStr;

    //访问ip
    private  String  ip;
    //访问资源url
    private  String url;
    //执行时长
    private  long executionTime;
    //访问方法
    private  String method;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getVisitTime() {
        return visitTime;
    }

    public void setVisitTime(Date visitTime) {
        this.visitTime = visitTime;
    }

    public String getVisitTimeStr() {
        if (visitTime!=null) {
            visitTimeStr = DateUtils.date2String(visitTime, "yyyy-MM-dd HH:mm:ss");
        }
        return visitTimeStr;
    }

    public void setVisitTimeStr(String visitTimeStr) {
        this.visitTimeStr = visitTimeStr;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public long getExecutionTime() {
        return executionTime;
    }

    public void setExecutionTime(long executionTime) {
        this.executionTime = executionTime;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }
}
