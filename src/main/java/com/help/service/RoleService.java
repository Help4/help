package com.help.service;

import com.help.dao.RoleDao;
import com.help.entity.Role;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RoleService {
   @Resource
    private RoleDao rd;

    public Role find(){
        System.out.print("test2");

        return   rd.find();
    }

}
