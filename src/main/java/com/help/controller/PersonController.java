package com.help.controller;

import com.help.entity.Person;
import com.help.service.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
}
