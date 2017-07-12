package com.help.service;


import com.help.dao.Distribute_MoneyDao;
import com.help.entity.Distribute_Money;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/7/1 0001.
 */
@Service
public class Distribute_MoneyService {
    @Resource
    private Distribute_MoneyDao dmd;
    public List<Distribute_Money> findMoneyByNp(String native_place ){
        return dmd.findMoneyByNp(native_place);
    };
    public List<Distribute_Money> findMoney(){return dmd.findMoney();};
    public void editwork(Distribute_Money distribute_money){dmd.editwork(distribute_money);};
    public void addwork(Distribute_Money distribute_money){dmd.addwork(distribute_money);};
    public int removeMoneyById(List<Integer> data){return dmd.removeMoneyById(data);};
    public List<Distribute_Money> showxuqi(){return dmd.showxuqi();};
    public List<Distribute_Money> showcar(){return dmd.showcar();};
}
