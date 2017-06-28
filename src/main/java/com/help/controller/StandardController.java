package com.help.controller;

import com.help.dao.StandardDao;
import com.help.entity.Standard;
import com.help.service.StandardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/6/26 0026.
 */
@Controller
public class StandardController {
    @Resource
    private StandardService ss;
    @RequestMapping("findSt.do")
    @ResponseBody
    public List<Standard> findSt(){
        return ss.findSt();
    }
}
