package com.help.dao;

import com.help.entity.Organizations;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrganizationDao {

    public List<Organizations> search();
    public List<Organizations> findAllOrganization(Organizations organizations);
    public List<Organizations> findParOrg(Organizations organizations);
    //删除组织
    public int removeOrg(List<Integer> data);
    //添加组织
    public void addOrg(Organizations organizations);
    //修改组织
    public void editOrg(Organizations organizations);
}

