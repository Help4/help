package com.help.service;

import com.help.dao.StopDao;
import com.help.entity.Person;
import com.help.entity.Person_State_Reason;
import com.help.entity.Reason;
import com.help.entity.State;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/29 0029.
 */
@Service
public class StopService {
    @Resource
    private StopDao std;
    public List<State> findAllState(){
        return std.findAllState();
    };
    public List<Reason> findAllWhy(){
        return std.findAllWhy();
    };
    public void editState(Person_State_Reason psr){
         std.editState(psr);
    };
    public void addState(Person_State_Reason psr){

        std.addState(psr);
    };
}
