package com.help.controller;

import com.help.entity.Person;
import com.help.service.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/6/27 0027.
 */
@Controller
public class PersonController {
    @Resource
    private PersonService ps;
    @RequestMapping("findPersonByName.do")
    @ResponseBody
    public List<Person> findPersonByName(Person person){
        return  ps.findPersonByName(person);
    }
    @RequestMapping("findPerson.do")
    @ResponseBody
    public List<Person> findPerson(Person person){
        return  ps.findPerson(person);
    }
    @RequestMapping("addDangan.do")
    @ResponseBody
    public int addDangan(Person person){ps.addDangan(person);return 1;};
    @RequestMapping("editDangan.do")
    @ResponseBody
    public int editDangan(Person person){ps.editDangan(person);return 1;};
    @RequestMapping("removeDanganId.do")
    @ResponseBody
    public int removeDanganId(@RequestBody ArrayList<Integer> data){ps.removeDanganId(data);return 1;};
}
