package com.domain;

/**
 * @Auther 笙
 * @Date 2020/12/23
 **/

import com.util.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * 用户表
 */
public class UserInfo {
    //用户id值
    private  Integer id;
    //邮件
    private  String email;
    //用户名
    private  String username;
    //密码
    private  String password;
    //电话
    private  String phoneNum;
    //状态0 未开启 1 开启
    private int status;
    private  String statusStr;
    //时间
    @DateTimeFormat(pattern ="yyyy-MM-dd HH:mm")
    private Date loginTime;
    private  String loginTimeStr;

    //一个用户对应多个角色
    private List<Role> roles;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusStr() {
        if (status==1){
            statusStr="开启";
        }
        if (status==0){
            statusStr="未开启";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getLoginTimeStr() {
        if (loginTime!=null){
            loginTimeStr= DateUtil.formatDate2(loginTime);
        }
        return loginTimeStr;
    }

    public void setLoginTimeStr(String loginTimeStr) {
        this.loginTimeStr = loginTimeStr;
    }

    public UserInfo() {
    }

    public UserInfo(String username, Date loginTime) {
        this.username = username;
        this.loginTime = loginTime;
    }
}
