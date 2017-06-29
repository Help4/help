package com.help.controller;

import com.help.entity.Organizations;
import com.help.service.OrganizationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    @RequestMapping("findAllOrganization.do")
    @ResponseBody
    public List<Organizations> findAllOrganization(Organizations organizations){
           return os.findAllOrganization(organizations);
    }
    @RequestMapping("findParOrg.do")
    @ResponseBody
    public List<Organizations> findParOrg(Organizations organizations){
        return os.findParOrg(organizations);
    }
    //删除组织
    @RequestMapping("removeOrg.do")
    @ResponseBody
    public int removeOrg(@RequestBody ArrayList<Integer> data){
        return os.removeOrg(data);
    };
    //添加组织
    @RequestMapping("addOrg.do")
    @ResponseBody
    public void addOrg(Organizations organizations){
        os.addOrg(organizations);
    };
    //修改组织
    @RequestMapping("editOrg.do")
    @ResponseBody
    public void editOrg(Organizations organizations){
        os.editOrg(organizations);
    };
}
