package com.help.dao;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.help.entity.Resource2;

import javax.annotation.Resource;

@Repository
public interface ResourceDao {
    public List<Resource2> findRs();
    //查找资源
    public List<Resource2> findAllResource();
    //删除资源
    public int removeResourceById(List<Integer> data);
    //添加资源
    public void addRes(Resource2 res);
    //查找一级资源
    public List<Resource2> findFirstRes();
    //修改资源
    public void editRes(Resource2 res);
}
