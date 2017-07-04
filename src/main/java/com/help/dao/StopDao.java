package com.help.dao;

import com.help.entity.Person;
import com.help.entity.Person_State_Reason;
import com.help.entity.Reason;
import com.help.entity.State;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/29 0029.
 */
@Repository
public interface StopDao {
    public List<State> findAllState();
    public List<Reason> findAllWhy();
    public void editState(Person_State_Reason psr);
    public void addState(Person_State_Reason psr);
}
