package com.service;

import com.domain.Product;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/16
 **/
public interface IProductService {
     //查询所有产品
    List<Product> findAll(Integer page,Integer size);
    //添加商品
    void save(Product pro);

    Product findById(Integer id);

    void deleteById(Integer id);
    void updateProduct(Product product);

    List<Product> findAllByNameLike(Integer page,Integer size,String productName);
}
