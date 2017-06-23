package com.help.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.help.entity.Resource2;
/**
 * Created by Administrator on 2017/6/23 0023.
 */
@Repository("resourcedao")
public interface ResourceDao {
    public List<Resource2> findRs();
}