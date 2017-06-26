package com.help.service;

import com.help.dao.OrganizationDao;
import com.help.entity.Organizations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrganizationService {
    @Resource
    private OrganizationDao od;

    public List<Organizations> search() {
        return od.search();
    }
}

