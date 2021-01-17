package com.dao;

import com.domain.Orders;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/22
 **/
@Repository
public interface IOdersDao {
    /**
     * 查询所有订单
      * @return
     */
     @Select("select * from orders")
     @Results({
             @Result(id = true,column = "id",property = "id"),
             @Result(column = "orderNum",property = "orderNum"),
             @Result(column = "orderTime",property = "orderTime"),
             @Result(column = "orderStatus",property = "orderStatus"),
             @Result(column = "peopleCount",property = "peopleCount"),
             @Result(column = "payType",property = "payType"),
             @Result(column = "orderDesc",property = "orderDesc"),
             @Result(column = "productId",property = "product",one = @One(select="com.dao.IProductDao.findById"))
     })
     List<Orders> findAll();

    /**
     * 根据id查询订单页面详情
     * @param id
     * @return
     */
     @Select("select * from orders where id =#{id}")
     @Results({
             @Result(id = true,column = "id",property = "id"),
             @Result(column = "orderNum",property = "orderNum"),
             @Result(column = "orderTime",property = "orderTime"),
             @Result(column = "orderStatus",property = "orderStatus"),
             @Result(column = "peopleCount",property = "peopleCount"),
             @Result(column = "payType",property = "payType"),
             @Result(column = "orderDesc",property = "orderDesc"),
             @Result(property = "productId", column = "productId"),
             @Result(property = "memberId", column = "memberId"),
             @Result(column = "productId",property = "product",one = @One(select="com.dao.IProductDao.findById")),
             @Result(column = "memberId",property = "member",one = @One(select="com.dao.IMemberDao.findById")),
             @Result(column = "id",property = "travellers",many = @Many(select="com.dao.ITravellerDao.findByOrderId"))
     })
     Orders findById(Integer id);

    /**
     * 添加订单
     * @param orders
     */
     @Insert("insert into orders(orderNum,orderTime,peopleCount,orderStatus,payType,orderDesc,productId,memberId) values(#{orderNum},#{orderTime},#{peopleCount},#{orderStatus},#{payType},#{orderDesc},#{productId},#{memberId})")
     void save(Orders orders);

    /**
     * 删除订单
     */
     @Delete("delete from orders where id=#{id}")
     void deleteOrderById(Integer id) throws Exception;
     @Delete("delete from order_traveller where orderId =#{orderId}")
     void deleteOrder_TravellerById(Integer orderId) throws  Exception;
     @Update("update orders set orderNum=#{orderNum},orderTime=#{orderTime},peopleCount=#{peopleCount},orderStatus=#{orderStatus},payType=#{payType},orderDesc=#{orderDesc},productId=#{productId},memberId=#{memberId} where id=#{id}")
     void update(Orders orders);
     @Select("select * from orders where orderNum like concat(concat('%',#{orderNum},'%'))")
     List<Orders> findAllByLikeName(String orderNum);
}
