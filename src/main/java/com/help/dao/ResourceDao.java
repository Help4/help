package com.help.dao;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.help.entity.Resource2;

import javax.annotation.Resource;

@Repository
public interface ResourceDao {
    public List<Resource2> findAllResource();

}