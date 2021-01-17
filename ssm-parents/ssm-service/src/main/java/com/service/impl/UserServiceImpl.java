package com.service.impl;

import com.dao.IUserDao;
import com.domain.Product;
import com.domain.Role;
import com.domain.UserInfo;
import com.github.pagehelper.PageHelper;
import com.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther 笙
 * @Date 2020/12/23
 **/
@Service
@Transactional(readOnly=true,propagation= Propagation.SUPPORTS)
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username)throws UsernameNotFoundException {
        UserInfo userInfo =userDao.findByUserName(username);
        List<Role> roles = userInfo.getRoles();
        List<SimpleGrantedAuthority> authorities = getAuthority(roles);
        User user = new User(userInfo.getUsername(),userInfo.getPassword(),userInfo.getStatus()==0?false:true,true,true,true,authorities);
        return user;
    }

    private List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        for (Role role : roles) {
            authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
        }
        return authorities;

    }

    @Override
    public List<UserInfo> findAll(Integer page, Integer size) {
        PageHelper.startPage(page,size);
        return userDao.findAll();
    }

    @Override
    public void save(UserInfo userInfo) {
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.save(userInfo);
    }

    @Override
    public UserInfo findById(Integer id) {
        return userDao.findById(id);
    }

    @Override
    public List<Role> findOtherRoles(Integer userId) {
        return userDao.findOtherRoles(userId);
    }

    @Override
    public void addRoleToUser(Integer userId, Integer[] roleIds) {
        for (Integer roleId : roleIds) {
            userDao.addRoleToUser(userId,roleId);
        }
    }

    @Override
    public void deleteUser_Role(Integer uId) {
        userDao.deleteUser(uId);
        userDao.deleteUser_Role(uId);
    }

    @Override
    public List<UserInfo> findAllLikeName( Integer page,Integer size,String username) {
        PageHelper.startPage(page,size);
        return userDao.findAllLikeName(username);
    }


}
