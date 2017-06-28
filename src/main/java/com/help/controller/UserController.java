package com.help.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.help.entity.Resource2;
import com.help.entity.User;
import com.help.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

    @Resource
    private UserService us;


    @RequestMapping(value = "findAllUser")
    public void findAllUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
    String page = req.getParameter("page");

    List<User> rs = us.findAllUser(page);
    String json = JSON.toJSONString(rs);
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().print(json);
    }
    //删除用户
    @RequestMapping("removeUserById.do")
    @ResponseBody
    public int removeUserById(@RequestBody ArrayList<Integer> data){
        return us.removeUserById(data);
    }

    //添加用户
    @RequestMapping(value = "addUser.do",method= RequestMethod.POST)
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
