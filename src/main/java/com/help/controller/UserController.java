package com.help.controller;

import com.help.entity.Resource2;
import com.help.entity.User;
import com.help.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

    @Resource
    private UserService us;

    @RequestMapping("findAllUser.do")
    @ResponseBody
    public List<User> findAllUser() {
        System.out.println(us.findAllUser().size());
        return  us.findAllUser();
    }
    //删除用户
    @RequestMapping("removeUserById.do")
    @ResponseBody
    public int removeUserById(@RequestBody ArrayList<Integer> data){
        return us.removeUserById(data);
    }
    @RequestMapping("addUser.do")
    @ResponseBody
    public int addUser(User user){
         us.addUser(user);
         return 1;
    }
}
