package com.help.controller;

import com.help.entity.Organizations;
import com.help.service.OrganizationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class OrganizationController {
    @Resource
    private OrganizationService os;
    @RequestMapping("search.do")
    @ResponseBody
    public List<Organizations> search(){
        return os.search();
    }
}
