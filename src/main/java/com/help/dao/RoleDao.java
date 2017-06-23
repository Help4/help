package com.help.dao;

import com.help.entity.Role;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/6/23 0023.
 */
@Repository
public interface RoleDao {

    public  Role find();

}
