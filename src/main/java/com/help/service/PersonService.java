package com.help.service;

import com.help.dao.PersonDao;
import com.help.entity.Person;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/6/27 0027.
 */
@Service
public class PersonService {
    @Resource
    private PersonDao ped;
    public List<Person> findPersonNull(Person person){return ped.findPersonNull(person);};
    public List<Person> findPersonBySta1(Person person){return ped.findPersonBySta1(person);};
    public List<Person> findPersonBySta2(Person person){return ped.findPersonBySta2(person);};
    public List<Person> findPersonByName(Person person){
        return  ped.findPersonByName(person);
    }
    public List<Person> findPerson(Person person){
        return  ped.findPerson(person);
    }
    public void addDangan(Person person){ped.addDangan(person);}
    public void editDangan(Person person){ped.editDangan(person);}
    public void removeDanganId(@RequestBody ArrayList<Integer> data){ped.removeDanganId(data);};
    }
