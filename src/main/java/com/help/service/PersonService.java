package com.help.service;

import com.help.dao.PersonDao;
import com.help.entity.Person;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/6/27 0027.
 */
@Service
public class PersonService {
    @Resource
    private PersonDao ped;
    public List<Person> findPersonByName(Person person){
        return  ped.findPersonByName(person);
    }
    public List<Person> findPerson(Person person){
        return  ped.findPerson(person);
    }
}
