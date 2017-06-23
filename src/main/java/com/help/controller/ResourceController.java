package com.help.controller;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.help.entity.Resource2;
import com.help.service.ResourceService;
/**
 * Created by Administrator on 2017/6/23 0023.
 */
@Controller
public class ResourceController {
    @Resource
    private ResourceService rService;
    @RequestMapping("findRs.do")
    @ResponseBody
    public List<Resource2> findRs(){
        return rService.findRs();
    }
}