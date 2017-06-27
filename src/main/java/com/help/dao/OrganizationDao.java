package com.help.dao;

import com.help.entity.Organizations;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrganizationDao {

    public List<Organizations> search();
    public List<Organizations> find();
}

