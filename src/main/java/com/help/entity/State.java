package com.help.entity;

/**
 * Created by Administrator on 2017/6/29 0029.
 */
public class State {
    private int sta_id;
    private String sta_name;
    private String sta_why;

    public State() {
        super();
    }

    public State(int sta_id, String sta_name, String sta_why) {
        this.sta_id = sta_id;
        this.sta_name = sta_name;
        this.sta_why = sta_why;
    }

    public int getSta_id() {
        return sta_id;
    }

    public void setSta_id(int sta_id) {
        this.sta_id = sta_id;
    }

    public String getSta_name() {
        return sta_name;
    }

    public void setSta_name(String sta_name) {
        this.sta_name = sta_name;
    }

    public String getSta_why() {
        return sta_why;
    }

    public void setSta_why(String sta_why) {
        this.sta_why = sta_why;
    }
}
