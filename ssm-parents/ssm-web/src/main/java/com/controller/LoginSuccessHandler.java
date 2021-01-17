package com.controller;

import com.dao.IUserDao;
import com.domain.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * @Auther 笙
 * @Date 2020/12/24
 **/
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    @Autowired
    private IUserDao userDao;

    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        //记录相关的用户信息,如上次登录时间
        response.setContentType("text/html;charset=utf-8");
        String name = authentication.getName();
        userDao.updateLoginTime(name,new Date());
        UserInfo userInfo = userDao.findByUserName(name);
        String  loginTimeStr = userInfo.getLoginTimeStr();
        Cookie cookie = new Cookie("loginTime",loginTimeStr);
        response.addCookie(cookie);
        System.out.println("登陆成功!");

        //调用父类的方法把用户引导到未登录前要去的页面
        super.onAuthenticationSuccess(request,response,authentication);
    }
}