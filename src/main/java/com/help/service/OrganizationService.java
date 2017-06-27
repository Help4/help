package com.help.service;

import com.help.dao.OrganizationDao;
import com.help.entity.Organizations;
import com.help.entity.Resource2;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrganizationService {
    @Resource
    private OrganizationDao od;

    public List<Organizations> search() {
        return od.search();
    }



    public List<Organizations> find() {
        List<Organizations> list= od.find();
        List<Organizations> data=new ArrayList<Organizations>();
        for (Organizations a : list) {
            if (a.getOrg_parentId()==0) {
                data.add(a);
            }
            for (Organizations b : list) {
                if (a.getOrgid()==b.getOrg_parentId()) {
                    a.getChildren().add(b);
                }
            }

        }
        return data;
    }
}

