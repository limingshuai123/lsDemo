package com.dao;

import com.domain.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/22
 **/
public interface IMemberDao {
    /**
     *
     * @param id
     * @return根据id查询会员表信息
     */
    @Select("select * from member where id =#{id}")
    @Results(id = "member",value = {
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "name",property = "name"),
            @Result(column = "nickName",property = "nickName"),
            @Result(column = "phoneNum",property = "phoneNum"),
            @Result(column = "email",property = "email"),
    })
    Member findById(Integer id);

    @Select("select * from member")
    @ResultMap("member")
    List<Member> findAll();
}
