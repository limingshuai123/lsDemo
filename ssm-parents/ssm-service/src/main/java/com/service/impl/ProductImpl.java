package com.service.impl;

import com.dao.IProductDao;
import com.domain.Product;
import com.github.pagehelper.PageHelper;
import com.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/16
 **/
@Service
@Transactional(readOnly=true,propagation= Propagation.SUPPORTS)
public class ProductImpl implements IProductService {
    @Autowired
    private IProductDao productDao;

    @Override
    public List<Product> findAll(Integer page,Integer size) {
        PageHelper.startPage(page,size);
        return productDao.findAll();
    }

    @Override
    public void save(Product pro) {
         productDao.save(pro);
    }

    @Override
    public Product findById(Integer id) {
        return productDao.findById(id);
    }

    @Override
    public void deleteById(Integer id) {
        productDao.deleteById(id);
    }

    @Override
    public void updateProduct(Product product) {
        productDao.updateProduct(product);
    }

    @Override
    public List<Product> findAllByNameLike(Integer page, Integer size, String productName) {
        PageHelper.startPage(page,size);
        return productDao.findAllByNameLike(productName);
    }


}
