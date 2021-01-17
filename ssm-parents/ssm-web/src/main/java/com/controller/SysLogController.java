package com.controller;

import com.domain.SysLog;
import com.github.pagehelper.PageInfo;
import com.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/25
 **/

@Controller
@RequestMapping("/syslog")
public class SysLogController {
    @Autowired
    private ISysLogService sysLogService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page
            ,@RequestParam(value = "size",required = true,defaultValue = "8") Integer size
            ,@RequestParam(name = "username",required = true,defaultValue = "") String username){
        ModelAndView md =new ModelAndView();
        List<SysLog> logList =null;
        if (username==null||username==""){
            logList =sysLogService.findAll(page, size);
        }else {
            logList = sysLogService.findAllLikeName(page, size, username);
        }
        PageInfo pageInfo = new PageInfo(logList);
        md.addObject("name",username);
        md.addObject("pageInfo",pageInfo);
        md.setViewName("syslog-list");
        return  md;
    }

    @RequestMapping("/deleteSysLog.do")
    public  String  delete(String sysLogList){
        String[] strs = sysLogList.split(",");
        List<Integer> ids = new ArrayList<>();
        for(int i = 0;i<strs.length; i++){
            ids.add(Integer.parseInt(strs[i]));
        }
        sysLogService.deleteSysLog(ids);
          return "redirect:findAll.do";
    }
}
