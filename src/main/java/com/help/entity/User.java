package com.help.entity;

import java.io.Serializable;

public class User implements Serializable {
    private int uid;
    private String name;
    private String gender;
    private int age;
    private String email;
    private int phone;
    private String responsidle;

    private String  org_name;



    public User() {
    }



    public User(int uid, String name, String gender, int age, String email, int phone, String responsidle, String org_name) {
        this.uid = uid;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.email = email;
        this.phone = phone;
        this.responsidle = responsidle;
        this.org_name = org_name;
    }

    public int getUid() {

        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getResponsidle() {
        return responsidle;
    }

    public void setResponsidle(String responsidle) {
        this.responsidle = responsidle;
    }

    public String getOrg_name() {
        return org_name;
    }

    public void setOrg_name(String org_name) {
        this.org_name = org_name;
    }
}
