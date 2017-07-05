package com.help.dao;

import com.help.entity.Role;
import com.help.entity.User;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/6/23 0023.
 */
@Repository
public interface UserDao {
 public List<User> findAllUser2();
 public List<User> findAllUser(List<Integer> data);
 //删除用户
 public int removeUserById(List<Integer> data);
//添加用户
 public void addUser(User user);
 //修改用户
 public void editUser(User user);

}
