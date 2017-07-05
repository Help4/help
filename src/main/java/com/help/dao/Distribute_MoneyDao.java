package com.help.dao;

import com.help.entity.Distribute_Money;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/7/1 0001.
 */
@Repository
public interface Distribute_MoneyDao {
    public List<Distribute_Money> findMoneyByNp(String native_place);
    public List<Distribute_Money> findMoney();
    public void editwork(Distribute_Money distribute_money);
    public void addwork(Distribute_Money distribute_money);
    public int removeMoneyById(List<Integer> data);
    public List<Distribute_Money> showxuqi();
}
