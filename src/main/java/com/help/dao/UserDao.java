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

}
