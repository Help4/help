package com.help.controller;

import com.help.entity.Distribute_Money;
import com.help.service.Distribute_MoneyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/7/1 0001.
 */
@Controller
public class Distribute_MoneyController {
    @Resource
    private Distribute_MoneyService dms;
    @RequestMapping("findMoney.do")
    @ResponseBody
    public List<Distribute_Money> findMoney(){
        return dms.findMoney();
    };
    @RequestMapping("findMoneyByNp.do")
    @ResponseBody
    public List<Distribute_Money> findMoneyByNp(String native_place){
        String a="%"+native_place+"%";
       // distribute_monery.setNative_place(a);
        return dms.findMoneyByNp(a);
    };
    @RequestMapping("addwork.do")
    @ResponseBody
    public int addwork(Distribute_Money distribute_money){
        dms.addwork(distribute_money);
        return 1;
    };
    @RequestMapping("editwork.do")
    @ResponseBody
    public int editwork(Distribute_Money distribute_money){
        dms.editwork(distribute_money);
        return 1;
    };
    @RequestMapping("removeMoneyById.do")
    @ResponseBody
    public int removeMoneyById(@RequestBody ArrayList<Integer> data){
        return dms.removeMoneyById(data);
    };
}
