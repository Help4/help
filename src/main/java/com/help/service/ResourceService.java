package com.help.service;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.help.dao.ResourceDao;
import com.help.entity.Resource2;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/6/23 0023.
 */
@Service
public class ResourceService {
//    @Resource
//    private ResourceDao rd;
//
//    // 所有资源节点
//    public List<Resource2> findAllResource() {
//        return rd.findAllResource();
//    }
//
//    // 子节点
//    public List<Resource2> findChild(int pid) {
//        return rd.findChild(pid);
//    }
//
//    public List<Resource2> findRs() {
//        List<Resource2> rs =rd.findRs();
//        List<Resource2> data=new ArrayList<Resource2>();
//        for (Resource2 a : rs) {
//            if (a.getPid()==0) {
//                data.add(a);
//            }
//            for (Resource2 b : rs) {
//                if (a.getId()==b.getPid()) {
//                    a.getChildren().add(b);
//                }
//            }
//
//        }
//        return data;
//    }
//
//    public void saveRes(Resource2 resource2) {
//        rd.saveRes(resource2);
//
//    }
//
//    public void removeRes(int id) {
//        rd.removeRes(id);
//
//    }
//
//    public int fenpei(ArrayList<Map> data) {
//        int userid=(int) data.get(0).get("userid");
//        //清除老权限
//        rd.removeOldRes(userid);
//        //分配新权限
//        int x=rd.fenpei(data);
//        return	x;
//
//    }
//
//    public List<Resource2> findRs(int userid) {
//        List<Resource2> myrs=rd.findResByUser(userid);
//        List<Resource2> rs = rd.findRs();
//        List<Resource2> data=new ArrayList<Resource2>();
//
//        for (Resource2 a : rs) {
//            for(Resource2 x:myrs){
//                if(a.getId()==x.getId()){
//                    a.setChecked(true);
//                    break;
//                }
//            }
//            if (a.getPid()==0) {
//                data.add(a);
//            }
//            for (Resource2 b : rs) {
//                if (a.getId()==b.getPid()) {
//                    a.getChildren().add(b);
//                }
//            }
//
//        }
//        return data;
//    }
//
//


}
