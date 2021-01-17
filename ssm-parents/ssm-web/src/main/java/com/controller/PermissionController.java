package com.controller;

import com.dao.IPermissionsDao;
import com.domain.Permission;
import com.service.IPermissionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/26
 **/
@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private IPermissionsService permissionsService;
    @RequestMapping("/findAll.do")
    @RolesAllowed("ROLE_A")  //拥有该角色的才能访问次方法
    public ModelAndView findAll(){
        List<Permission> permissions = permissionsService.findAll();
        ModelAndView md = new ModelAndView();
        md.addObject("permission",permissions);
        md.setViewName("permission-list");
        return md;
    }

    @RequestMapping("/save.do")
    public  String save(Permission p){
        permissionsService.save(p);
        return "redirect:findAll.do";
    }
    @RequestMapping("/delete.do")
    public String delete(Integer id){
        permissionsService.deleteId(id);
        return "redirect:findAll.do";
    }
}
