package com.help.service;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.help.dao.ResourceDao;
import com.help.entity.Resource2;
/**
 * Created by Administrator on 2017/6/23 0023.
 */
@Service
public class ResourceService {
    @Resource
    private ResourceDao rd;
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
}
