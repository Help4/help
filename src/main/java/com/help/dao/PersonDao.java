package com.help.dao;

import com.help.entity.Person;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/27 0027.
 */
@Repository
public interface PersonDao {
    public List<Person> findPersonByName(Person person);
    public List<Person> findPersonNull(Person person);
    public List<Person> findPersonBySta1(Person person);
    public List<Person> findPersonBySta2(Person person);
    public List<Person> findPerson(Person person);
    public void addDangan(Person person);
    public void editDangan(Person person);
    public void removeDanganId(@RequestBody ArrayList<Integer> data);
}
