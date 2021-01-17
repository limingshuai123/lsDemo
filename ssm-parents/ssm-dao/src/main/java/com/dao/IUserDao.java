package com.dao;

import com.domain.Role;
import com.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/23
 **/
public interface IUserDao {
    /**
     * 根据用户名查询用户信息
     * @param username
     * @return
     */
    @Select("select * from userinfo where username=#{username}")
    @Results( id="users",value = {
            @Result(id=true,property = "id",column = "id"),
            @Result(column = "username",property = "username"),
            @Result(column = "email",property = "email"),
            @Result(column = "password",property = "password"),
            @Result(column = "phoneNum",property = "phoneNum"),
            @Result(column = "status",property = "status"),
            @Result(column = "id",property = "roles",javaType = List.class,many = @Many(select = "com.dao.IRoleDao.findRoleByUserId"))
    })
     UserInfo findByUserName(String username);

    /**
     * 根据名字修改最后登录时间
     * @param
     */
     @Update("update userinfo set loginTime =#{loginTime} where username = #{username}")
     @ResultMap("users")
     void updateLoginTime(@Param(value = "username") String userName,@Param(value = "loginTime") Date loginTime);


    /**
     * 查询全部用户信息
     */
    @Select("select * from userinfo")
    @ResultMap("users")
     List<UserInfo> findAll();

    /**
     * 添加用户
     * @param userInfo
     */
    @Insert("insert into userinfo(email,username,password,phoneNum,loginTime,status) values(#{email},#{username},#{password},#{phoneNum},#{loginTime},#{status})")
    void save(UserInfo userInfo);

    /**
     * 根据id查询用户  和用户所具有的角色
     * @param id
     * @return
     */
    @Select("select * from userinfo where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = List.class,many = @Many(select = "com.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findById(Integer id);

    /**
     * 根据userId查询roleId 在查询没有赋予这个角色的用户
     * @param id
     * @return
     */
    @Select("select * from role where id not in (select roleId from users_role where userId=#{userId})")
    List<Role> findOtherRoles(Integer id);

    /**
     * 添加角色id和用户id
     * @param userId
     * @param roleId
     */
    @Insert("insert into users_role(userId,roleId) values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") Integer userId,@Param("roleId") Integer roleId);


    @Delete("delete from users_role where userId=#{userId}")
    void  deleteUser_Role(Integer uId);

    @Delete("delete from userinfo where id=#{id}")
    void deleteUser(Integer id);

    @Select("select * from userinfo where username like concat(concat('%',#{username},'%'))")
    List<UserInfo> findAllLikeName(String username);


}
