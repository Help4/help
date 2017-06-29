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

    public List<Organizations> findAllOrganization(Organizations organizations) {
        return od.findAllOrganization(organizations);
      };
    public List<Organizations> findParOrg(Organizations organizations){
        return od.findParOrg(organizations);
    };
    //删除资源
    public int removeOrg(List<Integer> data){
        return od.removeOrg(data);
    };
    //添加资源
    public void addOrg(Organizations organizations){
        od.addOrg(organizations);
    };
    //修改资源
    public void editOrg(Organizations organizations){
        od.editOrg(organizations);
    };
}

