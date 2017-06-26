package com.help.controller;

import com.help.entity.Resource2;
import com.help.entity.Role;
import com.help.service.ResourceService;
import com.help.service.RoleService;

import com.sun.net.httpserver.HttpServer;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class RoleController {

    @Resource
   private RoleService rs;

    @RequestMapping("tologin.do")
    public String tologin() {

        return "login";
    }

    @RequestMapping("login.do")
    public String login(String account,String pwd,HttpServletRequest request, HttpServletResponse response){
        HttpSession session= request.getSession();
       Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(account,pwd);
        try {
            subject.login(token);
        } catch (AuthenticationException e) {
            System.out.print("login");
            String msg="登录失败";
               session.setAttribute("msg",msg);
            return "login";
        }
       Role role=rs.findRole(account);


        session.setAttribute("role",role);
        return "main";
    }



    @RequestMapping(value="findReByRole.do",method= RequestMethod.GET)
    @ResponseBody
    public List<Resource2> findResourceByUser(int rid){

       List<Resource2> list= rs.findReByRole(rid);

        return list;

    }

    @RequestMapping("findSubByPid.do")
    @ResponseBody
    public List<Resource2> findSubByPid(int pid,HttpServletRequest request){


        HttpSession session = request.getSession();
       Role role = (Role) session.getAttribute("role");

        Map<String, Integer> map=new HashMap<String, Integer>();
        map.put("rid",role.getRid());
        map.put("pid",pid);

        System.out.println("rid:"+role.getRid()+".."+pid);
        List<Resource2> list = rs.findSubByPid(map);
        System.out.println("+++"+list.size());
        return list;

    }

}
