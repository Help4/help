package com.help.controller;

import com.help.entity.Organizations;
import com.help.service.OrganizationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OrganizationController {
    @Resource
    private OrganizationService os;
    @RequestMapping("search.do")
    @ResponseBody
        public List<Organizations> search(HttpServletRequest request, HttpServletResponse response){
      List<Organizations> list= os.search();
           HttpSession session= request.getSession();
           session.setAttribute("list",list);
            return list;
        }

    @RequestMapping("findAll_Org.do")
    @ResponseBody
    public List<Organizations> findAll_Org(HttpServletRequest request, HttpServletResponse response) {
        List<Organizations> list = os.search();

        HttpSession session = request.getSession();
        session.setAttribute("list", list);
        if (list != null) {
            return list;

        }
        return list;

    }

    public List<Organizations> find(){
           return os.find();
    }

}
