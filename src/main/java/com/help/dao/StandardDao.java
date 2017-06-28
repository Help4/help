package com.help.dao;

import com.help.entity.Standard;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Created by Administrator on 2017/6/26 0026.
 */
@Repository
public interface StandardDao {
    public List<Standard> findSt();
}
