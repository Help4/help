package com.help.dao;

import com.help.entity.Role;
import com.help.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/6/23 0023.
 */
@Repository
public interface UserDao {

 public List<User> findAllUser();
 //删除用户
 public int removeUserById(List<Integer> data);
}
