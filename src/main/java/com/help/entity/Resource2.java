package com.help.entity;

import java.io.Serializable;
import java.util.Set;
import java.util.HashSet;
/**
 * Created by Administrator on 2017/6/23 0023.
 */
public class Resource2 implements Serializable{
    private Set<Resource2>  children=new HashSet<Resource2>();

    private int re_id;
    private String text;
    private String url;
    private int re_pid;
    private String ptext;




    public Resource2(int re_id, String text, String url, int re_pid, String ptext) {
        this.re_id = re_id;
        this.text = text;
        this.url = url;
        this.re_pid = re_pid;
        this.ptext = ptext;
    }



    public String getPtext() {
        return ptext;
    }

    public void setPtext(String ptext) {
        this.ptext = ptext;
    }



    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Set<Resource2> getChildren() {
        return children;
    }

    public void setChildren(Set<Resource2> children) {
        this.children = children;
    }

    public int getRe_id() {
        return re_id;
    }

    public void setRe_id(int re_id) {
        this.re_id = re_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getRe_pid() {
        return re_pid;
    }

    public void setRe_pid(int re_pid) {
        this.re_pid = re_pid;
    }
}
