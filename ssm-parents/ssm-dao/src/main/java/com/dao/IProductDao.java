package com.dao;

import com.domain.Product;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/16
 **/
@Repository
public interface IProductDao {
    /**
     *
     * @return查询所有产品
     */
    @Select("select * from product")
    List<Product> findAll();

    /**
     * 添加产品
     * @param pro
     */
    @Insert("insert into product(productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) values(#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void save(Product pro);

    /**
     * 根据id查询所有产品信息
     * @param id
     * @return
     */
    @Select("select * from product where id =#{id}")
    Product findById(Integer id);

    /**
     * 删除 根据id
     * @param id
     */
    @Delete("delete from product where id =#{id}")
    void deleteById(Integer id);

    /**
     * 修改用户
     * @param product
     */
    @Update("update product set productNum =#{productNum},productName=#{productName},cityName=#{cityName},departureTime=#{departureTime},productPrice=#{productPrice},productDesc=#{productDesc},productStatus=#{productStatus} where id =#{id}")
    void updateProduct(Product product);

   @Select("select * from product where productName like concat(concat('%',#{productName},'%'))")
    List<Product> findAllByNameLike(String productName);
}
