package com.controller;

import com.domain.Member;
import com.domain.Orders;
import com.domain.Product;
import com.github.pagehelper.PageInfo;
import com.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/22
 **/
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private IOrderService orderService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true,defaultValue = "2") Integer size,
                                @RequestParam(name = "orderNum",required = true,defaultValue = "") String orderNum){
         ModelAndView modelAndView = new ModelAndView();
        List<Orders> ordersList =null;
         if (orderNum==null||orderNum=="") {
             ordersList = orderService.findAll(page, size);
         }else {
             ordersList = orderService.findAllByLikeName(page, size, orderNum);
         }
         PageInfo pageInfo = new PageInfo(ordersList);
         modelAndView.addObject("orderNum",orderNum);
         modelAndView.addObject("pageInfo",pageInfo);
         modelAndView.setViewName("orders-page-list");
         return modelAndView;
    }
    @RequestMapping("/findById.do")
    public  ModelAndView findById(Integer id){
        Orders orders = orderService.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("orders",orders);
        modelAndView.setViewName("order-show");
        return  modelAndView;
    }

     @RequestMapping("/add.do")
     public  ModelAndView addSave(){
        ModelAndView md = new ModelAndView();
        List<Member> members =orderService.findAllMembers();
        List<Product> products = orderService.findAllProduct();
        md.addObject("members",members);
        md.addObject("products",products);
        md.setViewName("orders-page-add");
        return md;
     }
     @PostMapping("/save.do")
     public  String save(Orders orders){
        orderService.save(orders);
        return "redirect:findAll.do";
     }

     @RequestMapping("/delete.do")
     public  String delete(Integer id) throws Exception{
        orderService.deleteOrderById(id);
        return "redirect:findAll.do";
     }

    /**
     * 修改订单前根据id查询订单信息
     * @param id
     * @return
     */
     @RequestMapping("/updateById.do")
     @Secured("ROLE_A")//拥有该角色的才能访问次方法
     public  ModelAndView updateById(@RequestParam(name = "id" ,required = true) Integer id){
        ModelAndView mv = new ModelAndView();
        Orders orders = orderService.findById(id);
        List<Member> members = orderService.findAllMembers();
        List<Product> products = orderService.findAllProduct();
        Integer pId = orders.getProductId();
        Integer mId =orders.getMemberId();
         for (Member member : members) {//在会员表中设置mId的值
             member.setTempId(mId);
         }
         for (Product product : products) {//在产品表中设置pId的值
             product.setTempId(pId);
         }
         mv.addObject("members", members);
         mv.addObject("products", products);
         mv.addObject("orders",orders);
         mv.setViewName("orders-page-update");
         return mv;
     }

     @RequestMapping("/update.do")
     public  String update(Orders orders){
        orderService.update(orders);
        return "redirect:findAll.do";
     }

}
