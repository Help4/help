package com.help.entity;

/**
 * Created by Administrator on 2017/6/30 0030.
 */
public class Person_State_Reason {
    private int pid;
    private int sta_id;
    private int wid;
    private int sta_name;
    private int why;

    public Person_State_Reason() {
        super();
    }

    public Person_State_Reason(int pid, int sta_id, int wid, int sta_name, int why) {
        this.pid = pid;
        this.sta_id = sta_id;
        this.wid = wid;
        this.sta_name = sta_name;
        this.why = why;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getSta_id() {
        return sta_id;
    }

    public void setSta_id(int sta_id) {
        this.sta_id = sta_id;
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public int getSta_name() {
        return sta_name;
    }

    public void setSta_name(int sta_name) {
        this.sta_name = sta_name;
    }

    public int getWhy() {
        return why;
    }

    public void setWhy(int why) {
        this.why = why;
    }
}
