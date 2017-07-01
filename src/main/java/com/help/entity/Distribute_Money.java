package com.help.entity;

import java.util.Date;

/**
 * Created by Administrator on 2017/7/1 0001.
 */
public class Distribute_Money {
    private int money_id;
    private String native_place;
    private String money_shiDistribute;
    private String shi;
    private String money_xianDistribute;
    private String xian;
    private String money_xiangDistribute;
    private String xiang;
    private String money_personGet;
    private int money_Getsum;
    private String dissribute_DATE;

    public Distribute_Money() {
        super();
    }

    public int getMoney_id() {
        return money_id;
    }

    public void setMoney_id(int money_id) {
        this.money_id = money_id;
    }

    public String getNative_place() {
        return native_place;
    }

    public void setNative_place(String native_place) {
        this.native_place = native_place;
    }

    public String getMoney_shiDistribute() {
        return money_shiDistribute;
    }

    public void setMoney_shiDistribute(String money_shiDistribute) {
        this.money_shiDistribute = money_shiDistribute;
    }

    public String getShi() {
        return shi;
    }

    public void setShi(String shi) {
        this.shi = shi;
    }

    public String getMoney_xianDistribute() {
        return money_xianDistribute;
    }

    public void setMoney_xianDistribute(String money_xianDistribute) {
        this.money_xianDistribute = money_xianDistribute;
    }

    public String getXian() {
        return xian;
    }

    public void setXian(String xian) {
        this.xian = xian;
    }

    public String getMoney_xiangDistribute() {
        return money_xiangDistribute;
    }

    public void setMoney_xiangDistribute(String money_xiangDistribute) {
        this.money_xiangDistribute = money_xiangDistribute;
    }

    public String getXiang() {
        return xiang;
    }

    public void setXiang(String xiang) {
        this.xiang = xiang;
    }

    public String getMoney_personGet() {
        return money_personGet;
    }

    public void setMoney_personGet(String money_personGet) {
        this.money_personGet = money_personGet;
    }

    public int getMoney_Getsum() {
        return money_Getsum;
    }

    public void setMoney_Getsum(int money_Getsum) {
        this.money_Getsum = money_Getsum;
    }

    public String getDissribute_DATE() {
        return dissribute_DATE;
    }

    public void setDissribute_DATE(String dissribute_DATE) {
        this.dissribute_DATE = dissribute_DATE;
    }


    public Distribute_Money(int money_id, String native_place, String money_shiDistribute, String shi, String money_xianDistribute, String xian, String money_xiangDistribute, String xiang, String money_personGet, int money_Getsum, String dissribute_DATE) {
        this.money_id = money_id;
        this.native_place = native_place;
        this.money_shiDistribute = money_shiDistribute;
        this.shi = shi;
        this.money_xianDistribute = money_xianDistribute;
        this.xian = xian;
        this.money_xiangDistribute = money_xiangDistribute;
        this.xiang = xiang;
        this.money_personGet = money_personGet;
        this.money_Getsum = money_Getsum;
        this.dissribute_DATE = dissribute_DATE;

    }
}
