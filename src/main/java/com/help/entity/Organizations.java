package com.help.entity;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/6/23 0023.
 */
public class Organizations implements Serializable {
    private int orgid;
    private String org_name;
    private String description;
    private int parentid;

    public int getOrgid() {
        return orgid;
    }

    public void setOrgid(int orgid) {
        this.orgid = orgid;
    }

    public String getOrg_name() {
        return org_name;
    }

    public void setOrg_name(String org_name) {
        this.org_name = org_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getParentid() {
        return parentid;
    }

    public void setParentid(int parentid) {
        this.parentid = parentid;
    }

    public Organizations() {
        super();
    }

    public Organizations(int orgid, String org_name, String description, int parentid) {
        this.orgid = orgid;
        this.org_name = org_name;
        this.description = description;
        this.parentid = parentid;
    }
}