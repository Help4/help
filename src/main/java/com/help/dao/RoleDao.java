package com.help.dao;

import com.help.entity.Resource2;
import com.help.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/23 0023.
 */
@Repository
public interface RoleDao {
    public List<Role> findAllRole();
    public Role findRole(String account);
    public List<Resource2> findReByRole(int rid);
    public List<Resource2> findSubByPid(Map<String,Integer> map);
}
