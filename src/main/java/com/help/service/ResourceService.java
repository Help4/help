package com.help.service;
import java.util.ArrayList;
import java.util.List;

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
        System.out.println("2222");
        return rd.findAllResource();
    }

}
