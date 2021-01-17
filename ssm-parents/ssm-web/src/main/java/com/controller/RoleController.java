package com.controller;

import com.domain.Permission;
import com.domain.Role;
import com.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/26
 **/
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    /**
     * 查询角色
     * @return md
     */
    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROLE_A')")
    public ModelAndView findAll(){
        ModelAndView md = new ModelAndView();
        List<Role> roleList = roleService.findAll();
        md.addObject("roles",roleList);
        md.setViewName("role-list");
        return md;
    }

    /**
     * 添加角色
     * @param role
     * @return
     */
    @PostMapping("/save.do")
    public String  save(Role role){
        roleService.save(role);
        return "redirect:findAll.do";
    }


    //角色详情查询
    @RequestMapping("/findById.do")
    public  ModelAndView findById(@RequestParam(name="id",required = true)Integer roleId){
        ModelAndView modelAndView = new ModelAndView();
        Role role = roleService.findById(roleId);
        modelAndView.addObject("role",role);
        modelAndView.setViewName("role-show");
        return modelAndView;
    }

    //给角色添加权限
    @RequestMapping("/addpermissionToRole.do")
    public String addPermissionToRole(@RequestParam(name="id",required = true) Integer roleId,@RequestParam(name="ids",required = true) Integer[] permissionIds){
        roleService.permissionAdd(roleId,permissionIds);
        return "redirect:findAll.do";
    }

    //根据roleId 查询role,并查询出可以添加的权限
    @RequestMapping("/findRoleByIdAndPermission.do")
    public  ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id", required = true) Integer roleId){
        ModelAndView mv = new ModelAndView();
        //根据roleId查询role
        Role role = roleService.findById(roleId);
        //根据roleId查可以添加的权限
        List<Permission> otherPermission = roleService.findNotPermission(roleId);
        mv.addObject("role",role);
        mv.addObject("permissionList",otherPermission);
        mv.setViewName("role-permission-add");
        return mv;
    }

    @RequestMapping("/delete.do")
    public  String delete(@RequestParam(name = "id",required = true) Integer id){
        roleService.deleteRole_permission(id);
        return "redirect:findAll.do";
    }
}
