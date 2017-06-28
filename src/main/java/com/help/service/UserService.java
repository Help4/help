package com.help.service;

import com.help.dao.RoleDao;
import com.help.dao.UserDao;
import com.help.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {

    @Resource
   private UserDao ud;
   public List<User> findAllUser(){
       return  ud.findAllUser();
   }
   public int removeUserById(List<Integer> data){
       return  ud.removeUserById(data);
   }
   public void addUser(User user){
       ud.addUser(user);
   }
   public void editUser(User user){
        ud.editUser(user);
    }
}
