package com.dao;

import com.domain.Permission;
import com.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/23
 **/
public interface IRoleDao {
    /**
     * 根据userId查询角色roleId  然后根据角色roleId查询这个用户所拥有的角色  以及这个用户所对应的所有权限
     * @param userId
     * @return
     */
    @Select("select * from role where id in (select roleId from users_role where userId =#{userId})")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "roleName",property = "roleName"),
            @Result(column = "roleDesc",property = "roleDesc"),
            @Result(column = "id",property = "permissions",javaType = List.class,many = @Many(select = "com.dao.IPermissionsDao.findRoleByUserId"))
    })
    Role findRoleByUserId(Integer userId);

    /**
     * 查询所有角色
     * @return
     */
    @Select("select * from role")
    List<Role> findAll();

    /**
     * 添加角色
     * @param role
     */
    @Insert("insert into role(roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void save(Role role);

     @Select("select * from role where id =#{id}")
     @Results(id = "role",value = {
             @Result(id = true,column = "id",property = "id"),
             @Result(column = "roleDesc",property = "roleDesc"),
             @Result(column = "id",property = "permissions",javaType = List.class,many = @Many(select = "com.dao.IPermissionsDao.findRoleByUserId"))
     })
     Role findById(Integer id);


    /**
     * 添加role_permission的数据
     */
    @Insert("insert into role_permission(roleId,permissionId) values(#{roleId},#{permissionId})")
    void premission_roleAdd(@Param(value = "roleId") Integer roleId,@Param(value = "permissionId") Integer permissionId);

    /**
     * 根据roleId 查询permissionId  然后再根据permissionId 查询还有那些角色没有赋予权限
     * @param roleId
     * @return
     */
    @Select("select * from permission where id not in(select permissionId from role_permission where roleId =#{roleId})")
    List<Permission> findNotPermission(Integer roleId);

    /**
     * 删除角色  删除角色对应的权限
     * @param id
     */
    @Delete("delete from role where id =#{id}")
    void deleteRole(Integer id);
    @Delete("delete from role_permission where roleId =#{roleId}")
    void deleteRole_permission(Integer roleId);
}
