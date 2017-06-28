package com.help.entity;

/**
 * Created by Administrator on 2017/6/26 0026.
 */
public class Standard {
    private int st_id;
    private Double st_base;
    private Double st_percent;

    public Standard() {
        super();
    }

    public Standard(Double st_base, Double st_percent) {
        this.st_base = st_base;
        this.st_percent = st_percent;
    }

    public Standard(int st_id, Double st_base, Double st_percent) {
        this.st_id = st_id;
        this.st_base = st_base;
        this.st_percent = st_percent;
    }

    public int getSt_id() {

        return st_id;
    }

    public void setSt_id(int st_id) {
        this.st_id = st_id;
    }

    public Double getSt_base() {
        return st_base;
    }

    public void setSt_base(Double st_base) {
        this.st_base = st_base;
    }

    public Double getSt_percent() {
        return st_percent;
    }

    public void setSt_percent(Double st_percent) {
        this.st_percent = st_percent;
    }
}
