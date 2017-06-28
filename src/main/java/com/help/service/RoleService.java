package com.help.service;

import com.help.dao.RoleDao;
import com.help.entity.Resource2;
import com.help.entity.Role;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class RoleService {
    @Resource
    private RoleDao rd;
    public Role findRole(String account) {
        return rd.findRole(account);
    }
  public List<Resource2> findReByRole(int rid){
    return rd.findReByRole(rid);
  }
  public List<Resource2>  findSubByPid( Map<String,Integer> map){
       return rd.findSubByPid(map);
  }
  public List<Role> findAllRole(){
      return rd.findAllRole();
  };
    //添加角色
    public void addRole(Role role){
        rd.addRole(role);
    };
    //修改角色
    public void editRole(Role role){rd.editRole(role);};
    //删除角色
    public int removeRoleById(List<Integer> data){return rd.removeRoleById(data);};
}
