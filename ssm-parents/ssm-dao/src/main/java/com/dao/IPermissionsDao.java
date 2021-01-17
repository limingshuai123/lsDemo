package com.dao;

import com.domain.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/24
 **/
public interface IPermissionsDao {
    /**
     * 根据角色id查询权限id 最后用id查询这个角色所拥有的权限
     * @param id
     * @return
     */
    @Select("select * from permission where id in (select permissionid from role_permission where roleid = #{id})")
    List<Permission> findRoleByUserId(Integer id);

    /**
     * 查询所有权限
     * @return
     */
    @Select("select * from permission")
    List<Permission> findAll();

    /**
     * 添加权限
     * @param permission
     */
    @Insert("insert into permission(permissionName,url) values(#{permissionName},#{url}) ")
    void save(Permission permission);

    /**
     * 根据id删除权限
     * @param id
     */
    @Delete("delete from permission where id =#{id}")
    void deleteId(Integer id);
}
