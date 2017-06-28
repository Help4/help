package com.help.controller;

import com.help.entity.Resource2;
import com.help.entity.User;
import com.help.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

    @Resource
    private UserService us;

    @RequestMapping("/findAllUser.do")
    @ResponseBody
    public List<User> findAllUser() {

        return  us.findAllUser();
    }
    //删除用户
    @RequestMapping("removeUserById.do")
    @ResponseBody
    public int removeUserById(@RequestBody ArrayList<Integer> data){
        return us.removeUserById(data);
    }

    //添加用户
    @RequestMapping(value = "au.do",method= RequestMethod.POST)
    @ResponseBody
    public int addUser(User user){
        System.out.println("user:"+user.getOrg_name());
         us.addUser(user);
    return 1;
    }

    //修改用户
    @RequestMapping("editUser.do")
    @ResponseBody
    public int editdUser(User user){


               us.editUser(user);


        return 1;
    }
}
