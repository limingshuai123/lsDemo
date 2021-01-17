package com.controller;

import com.domain.Role;
import com.domain.UserInfo;
import com.github.pagehelper.PageInfo;
import com.service.IUserService;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/24
 **/
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", defaultValue = "1") Integer page, @RequestParam(name = "size", defaultValue = "1") Integer size,@RequestParam(name="username",defaultValue = "",required = true) String username) {
        ModelAndView modelAndView = new ModelAndView();
        List<UserInfo> userInfo =null;
        if (username ==""||username==null){
            userInfo =  userService.findAll(page, size);
        }else {
            userInfo = userService.findAllLikeName(page, size, username);
        }
        PageInfo pageInfo = new PageInfo(userInfo);
        modelAndView.addObject("username",username);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }

    @PostMapping("/save.do")
    public String save(UserInfo userInfo) {
        userService.save(userInfo);
        return "redirect:findAll.do";
    }

    //查询用户级用户可以添加的角色
    @RequestMapping("/findUserByIdAndAllRole.do")
    public  ModelAndView findUserByIdAndAllRole(@RequestParam(name="id",required = true)Integer userId){
        ModelAndView md = new ModelAndView();
        //根据用户id查询用户
        UserInfo userInfo = userService.findById(userId);
        //根据用户id查询可以添加的角色
        List<Role> otherRoles = userService.findOtherRoles(userId);
        md.addObject("user",userInfo);
        md.addObject("roleList",otherRoles);
        md.setViewName("user-role-add");
        return md;
    }

    //查询指定id的用户
    @RequestMapping("/findById.do")
    public  ModelAndView findById(Integer id){
        ModelAndView md = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        md.addObject("user",userInfo);
        md.setViewName("user-show");
        return md;
    }

    //给用户添加角色
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name = "userId",required = true)Integer userId,@RequestParam(name = "ids",required = true) Integer [] roleIds){
        userService.addRoleToUser(userId,roleIds);
        return "redirect:findAll.do";
    }

    //删除用户
    @RequestMapping("/delete.do")
    public  String deleteUser_Role(@RequestParam(name = "id",required = true) Integer uid){
        userService.deleteUser_Role(uid);
        return "redirect:findAll.do";
    }

}