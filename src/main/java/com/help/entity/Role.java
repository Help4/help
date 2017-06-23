package com.help.entity;

import java.io.Serializable;

public class Role implements Serializable{
    private int rid;
    private String account;
    private String pwd;


    public Role() {
    }

    public Role(int rid, String account, String pwd) {
        this.rid = rid;
        this.account = account;
        this.pwd = pwd;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getRid() {
        return rid;
    }

    public String getAccount() {
        return account;
    }

    public String getPwd() {
        return pwd;
    }
}
