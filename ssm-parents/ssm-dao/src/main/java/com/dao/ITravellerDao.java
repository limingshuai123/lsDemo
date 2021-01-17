package com.dao;

import com.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/23
 **/
public interface ITravellerDao {
   @Select("SELECT * FROM traveller WHERE id IN (SELECT  travellerId FROM order_traveller WHERE orderId =#{orderId})")
    List<Traveller> findByOrderId(String orderId);
}
