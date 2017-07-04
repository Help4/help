package com.help.controller;

import com.help.entity.Person;
import com.help.entity.Person_State_Reason;
import com.help.entity.Reason;
import com.help.entity.State;
import com.help.service.StopService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/29 0029.
 */
@Controller
public class StopController {
    @Resource
    private StopService sc;
    @RequestMapping("findAllState.do")
    @ResponseBody
    public List<State> findAllState(){
        return sc.findAllState();
    };

    @RequestMapping("findAllWhy.do")
    @ResponseBody
    public List<Reason> findAllWhy(){
        return sc.findAllWhy();
    };

    @RequestMapping("editState.do")
    @ResponseBody
    public void editState(Person_State_Reason psr) {
         sc.editState(psr);
    }

    @RequestMapping("addState.do")
    @ResponseBody
    public int addState(Person_State_Reason psr) {
        sc.addState(psr);
        return 1;
    }
}
