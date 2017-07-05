package com.help.entity;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/7/5 0005.
 */
public class Car implements Serializable {
    private int id;
    private int carid;
    private String brand;
    private int holder;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCarid() {
        return carid;
    }

    public void setCarid(int carid) {
        this.carid = carid;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getHolder() {
        return holder;
    }

    public void setHolder(int holder) {
        this.holder = holder;
    }

    public Car() {

    }

    public Car(int id, int carid, String brand, int holder) {
        this.id = id;
        this.carid = carid;
        this.brand = brand;
        this.holder = holder;
    }
}
