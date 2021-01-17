package com.service;

import com.domain.Member;
import com.domain.Orders;
import com.domain.Product;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/22
 **/
public interface IOrderService {

    List<Orders> findAll(Integer page,Integer size);

    Orders findById(Integer id);

    void save(Orders orders);

    List<Member> findAllMembers();

    List<Product> findAllProduct();

    void deleteOrderById(Integer id) throws Exception;

    void update(Orders orders);

    List<Orders> findAllByLikeName(Integer page,Integer size,String orderNum);
}
