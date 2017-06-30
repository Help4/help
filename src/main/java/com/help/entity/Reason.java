package com.help.entity;

/**
 * Created by Administrator on 2017/6/30 0030.
 */
public class Reason {
    private int wid;
    private String why;

    public Reason() {
        super();
    }

    public Reason(int wid, String why) {
        this.wid = wid;
        this.why = why;
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getWhy() {
        return why;
    }

    public void setWhy(String why) {
        this.why = why;
    }
}
