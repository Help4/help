package com.help.service;

import com.help.dao.StandardDao;
import com.help.entity.Standard;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by Administrator on 2017/6/26 0026.
 */
@Service
public class StandardService {
    @Resource
    private StandardDao sd;
    public List<Standard> findSt(){
        return sd.findSt();
    }
}
