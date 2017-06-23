package com.help.controller;

import com.help.entity.Role;
import com.help.service.RoleService;
import com.help.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class RoleController {

    @Resource
    private RoleService rs;

    @RequestMapping("tologin.do")
    public String tologin() {

        return "login";
    }

    @RequestMapping("login.do")
    public String login(String account,String pwd){

       Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(account,pwd);
        try {
            subject.login(token);
        } catch (AuthenticationException e) {
            System.out.print("login");
            return "login";
        }

        return "main";
    }



}
