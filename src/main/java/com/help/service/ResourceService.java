package com.help.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.help.dao.ResourceDao;
import com.help.entity.Resource2;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class ResourceService {
    @Resource
    private ResourceDao rd;
    public List<Resource2> findAllResource() {
        return rd.findAllResource();
    }
    public List<Resource2> findRs() {
        List<Resource2> rs = rd.findRs();
        List<Resource2> data=new ArrayList<Resource2>();
        for (Resource2 a : rs) {
            if (a.getRe_pid()==0) {
                data.add(a);
            }
            for (Resource2 b : rs) {
                if (a.getRe_id()==b.getRe_pid()) {
                    a.getChildren().add(b);
                }
            }

        }
        return data;
    }
    public int removeResourceById(List<Integer> data){
        return  rd.removeResourceById(data);
    }
    public void addRes(Resource2 res){
        rd.addRes(res);
    }
    public List<Resource2> findFirstRes(){
        return rd.findFirstRes();
    }
    public void editRes(Resource2 res){
        rd.editRes(res);
    };
    //分配权限
    public int fenpei(ArrayList<Map> data){
        Map map=data.get(0);
        Integer i=(Integer)map.get("rid");
        int s=(int)i;
        System.out.println( s );
        //清除老权限
         rd.removeOldRes(s);
        //分配新权限
        int x=rd.fenpei(data);
        return	x;
    };
}
