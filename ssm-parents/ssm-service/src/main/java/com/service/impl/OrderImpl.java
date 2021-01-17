package com.service.impl;

import com.dao.IMemberDao;
import com.dao.IOdersDao;
import com.dao.IProductDao;
import com.domain.Member;
import com.domain.Orders;
import com.domain.Product;
import com.github.pagehelper.PageHelper;
import com.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/22
 **/
@Service
@Transactional(readOnly=true,propagation= Propagation.SUPPORTS)
public class OrderImpl implements IOrderService {
    @Autowired
    private IOdersDao ordersDao;
    @Autowired
    private IMemberDao memberDao;
    @Autowired
    private IProductDao iProductDao;
    @Override
    public List<Orders> findAll(Integer page,Integer size) {
        PageHelper.startPage(page,size);
        return ordersDao.findAll();
    }

    @Override
    public Orders findById(Integer id) {
        return ordersDao.findById(id);
    }

    @Override
    public void save(Orders orders) {
        ordersDao.save(orders);
    }

    @Override
    public List<Member> findAllMembers() {
        return memberDao.findAll();
    }

    @Override
    public List<Product> findAllProduct() {
        return iProductDao.findAll();
    }

    @Override
    @Transactional(readOnly = false,propagation = Propagation.REQUIRED)
    public void deleteOrderById(Integer id) throws Exception {
        ordersDao.deleteOrder_TravellerById(id);
        ordersDao.deleteOrderById(id);
    }

    @Override
    public void update(Orders orders) {
        ordersDao.update(orders);
    }

    @Override
    public List<Orders> findAllByLikeName(Integer page, Integer size, String orderNum) {
        PageHelper.startPage(page,size);
        return ordersDao.findAllByLikeName(orderNum);
    }


}
