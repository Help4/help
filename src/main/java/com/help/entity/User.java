package com.help.entity;

public class User {
    private String u_name;
    private String email;
    private int phone;

    public User() {
    }

    public User(String u_name, String email, int phone) {
        this.u_name = u_name;
        this.email = email;
        this.phone = phone;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getU_name() {
        return u_name;
    }

    public String getEmail() {
        return email;
    }

    public int getPhone() {
        return phone;
    }
}
