package com.help.controller;

import com.help.entity.Person;
import com.help.service.PersonService;
import com.help.service.StopService;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/27 0027.
 */
@Controller
public class PersonController {
    @Resource
    private PersonService ps;
    @Resource
    private StopService sc;
    @RequestMapping("findPersonByName.do")
    @ResponseBody
    public List<Person> findPersonByName(Person person){
        return  ps.findPersonByName(person);
    }
    @RequestMapping("findPersonNull.do")
    @ResponseBody
    public List<Person> findPersonNull(Person person){return ps.findPersonNull(person);};
    @RequestMapping("findPersonBySta1.do")
    @ResponseBody
    public List<Person> findPersonBySta1(Person person){return ps.findPersonBySta1(person);};
    @RequestMapping("findPersonBySta2.do")
    @ResponseBody
    public List<Person> findPersonBySta2(Person person){return ps.findPersonBySta2(person);};
    @RequestMapping("findPerson.do")
    @ResponseBody
    public List<Person> findPerson(Person person){
        return ps.findPerson(person);
    }


    @RequestMapping("addDangan.do")
    @ResponseBody
    public int addDangan(Person person){
        ps.addDangan(person);
        return 1;
    };
    @RequestMapping("editDangan.do")
    @ResponseBody
    public int editDangan(Person person){ps.editDangan(person);return 1;};
    @RequestMapping("removeDanganId.do")
    @ResponseBody
    public int removeDanganId(@RequestBody ArrayList<Integer> data){ps.removeDanganId(data);return 1;};
}
