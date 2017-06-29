package com.help.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Organizations implements Serializable {
    private int orgid;
    private String org_name;
    private String org_description;
    private int org_parentId;
    private Set<Organizations> children=new HashSet<Organizations>();

    public Organizations() {
        super();
    }

    public Organizations(int orgid, String org_name, String org_description, int org_parentId) {
        this.orgid = orgid;
        this.org_name = org_name;
        this.org_description = org_description;
        this.org_parentId = org_parentId;

    }


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

    public String getOrg_description() {
        return org_description;
    }

    public void setOrg_description(String org_description) {
        this.org_description = org_description;
    }

    public int getOrg_parentId() {
        return org_parentId;
    }

    public void setOrg_parentId(int org_parentId) {
        this.org_parentId = org_parentId;
    }

    public Set<Organizations> getChildren() {
        return children;
    }

    public void setChildren(Set<Organizations> children) {
        this.children = children;
    }
}
