package com.help.dao;

import com.help.entity.Person;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/6/27 0027.
 */
@Repository
public interface PersonDao {
    public List<Person> findPersonByName(Person person);
    public List<Person> findPerson(Person person);
}
