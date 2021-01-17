package com.controller;

import com.domain.Product;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/16
 **/
@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private IProductService productService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",defaultValue = "1",required = true) Integer page,
                                @RequestParam(name = "size",defaultValue = "5",required = true) Integer size,
                                @RequestParam(name = "productName",defaultValue = "",required = true) String productName){
        ModelAndView md = new ModelAndView();
        List<Product> list =null;
        if (productName==null||productName==""){
            list = productService.findAll(page, size);
        }else {
            list=productService.findAllByNameLike(page, size, productName);
        }
        PageInfo pageInfo = new PageInfo(list);
        md.addObject("productName",productName);
        md.addObject("pageInfo",pageInfo);
        md.setViewName("product-list");
        return md;
    }
    @PostMapping("/save.do")
    public  String save(Product product){
        productService.save(product);
        return "redirect:/product/findAll.do";
    }
    @RequestMapping("/delete.do")
    public  String delete(Integer id){
        productService.deleteById(id);
        return "redirect:findAll.do";
    }
    @PostMapping("/update.do")
    public  String update(Product product){
        productService.updateProduct(product);
        return "redirect:findAll.do";
    }

    @RequestMapping("/findById.do")
    public  ModelAndView findById(@RequestParam(name = "id",required = true)Integer id){
        ModelAndView modelAndView = new ModelAndView();
        Product product = productService.findById(id);
        modelAndView.addObject("product",product);
        modelAndView.setViewName("product-update");
        return  modelAndView;
    }

    @RequestMapping("/findByShow.do")
    public  ModelAndView findByShow(@RequestParam(name = "id",required = true)Integer id){
        ModelAndView modelAndView = new ModelAndView();
        Product product = productService.findById(id);
        modelAndView.addObject("product",product);
        modelAndView.setViewName("product-show");
        return  modelAndView;
    }
}
