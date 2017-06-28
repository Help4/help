package com.help.entity;

/**
 * Created by Administrator on 2017/6/27 0027.
 */
public class Person {
    private int pid;
    private int identify;
    private int p_age;
    private String p_name;
    private String p_gender;
    private String p_race;
    private String p_hukou;
    private int p_homesum;
    private String p_workable;
    private String p_state;
    private String p_marry;
    private String p_first;
    private String p_ill;
    private String p_trade;
    private int p_phone;
    private String p_adress;
    private float p_monery;
    private String p_shenheren;
    private String p_shenpiren;
    private String p_agree;
    private String p_towm_monery;
    private String p_xian_monery;
    private String p_person_monery;
    private String p_shifaqianren;
    private String p_issendmonery;

    public Person() {
        super();
    }

    public Person(int pid, int identify, int p_age, String p_name, String p_gender, String p_race, String p_hukou, int p_homesum, String p_workable, String p_marry, String p_first, String p_ill, String p_trade, int p_phone, String p_adress, float p_monery, String p_shenheren, String p_shenpiren, String p_agree, String p_towm_monery, String p_xian_monery, String p_person_monery, String p_shifaqianren, String p_issendmonery) {
        this.pid = pid;
        this.identify = identify;
        this.p_age = p_age;
        this.p_name = p_name;
        this.p_gender = p_gender;
        this.p_race = p_race;
        this.p_hukou = p_hukou;
        this.p_homesum = p_homesum;
        this.p_workable = p_workable;
        this.p_marry = p_marry;
        this.p_first = p_first;
        this.p_ill = p_ill;
        this.p_trade = p_trade;
        this.p_phone = p_phone;
        this.p_adress = p_adress;
        this.p_monery = p_monery;
        this.p_shenheren = p_shenheren;
        this.p_shenpiren = p_shenpiren;
        this.p_agree = p_agree;
        this.p_towm_monery = p_towm_monery;
        this.p_xian_monery = p_xian_monery;
        this.p_person_monery = p_person_monery;
        this.p_shifaqianren = p_shifaqianren;
        this.p_issendmonery = p_issendmonery;
    }

    public Person(int pid, int identify, int p_age, String p_name, String p_gender, String p_race, String p_hukou, int p_homesum, String p_workable, String p_state, String p_marry, String p_first, String p_ill, String p_trade, int p_phone, String p_adress, float p_monery, String p_shenheren, String p_shenpiren, String p_agree, String p_towm_monery, String p_xian_monery, String p_person_monery, String p_shifaqianren, String p_issendmonery) {
        this.pid = pid;
        this.identify = identify;
        this.p_age = p_age;
        this.p_name = p_name;
        this.p_gender = p_gender;
        this.p_race = p_race;
        this.p_hukou = p_hukou;
        this.p_homesum = p_homesum;
        this.p_workable = p_workable;
        this.p_state = p_state;
        this.p_marry = p_marry;
        this.p_first = p_first;
        this.p_ill = p_ill;
        this.p_trade = p_trade;
        this.p_phone = p_phone;
        this.p_adress = p_adress;
        this.p_monery = p_monery;
        this.p_shenheren = p_shenheren;
        this.p_shenpiren = p_shenpiren;
        this.p_agree = p_agree;
        this.p_towm_monery = p_towm_monery;
        this.p_xian_monery = p_xian_monery;
        this.p_person_monery = p_person_monery;
        this.p_shifaqianren = p_shifaqianren;
        this.p_issendmonery = p_issendmonery;
    }

    public String getP_state() {
        return p_state;
    }

    public void setP_state(String p_state) {
        this.p_state = p_state;
    }

    public int getP_age() {
        return p_age;
    }

    public void setP_age(int p_age) {
        this.p_age = p_age;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getIdentify() {
        return identify;
    }

    public void setIdentify(int identify) {
        this.identify = identify;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_gender() {
        return p_gender;
    }

    public void setP_gender(String p_gender) {
        this.p_gender = p_gender;
    }

    public String getP_race() {
        return p_race;
    }

    public void setP_race(String p_race) {
        this.p_race = p_race;
    }

    public String getP_hukou() {
        return p_hukou;
    }

    public void setP_hukou(String p_hukou) {
        this.p_hukou = p_hukou;
    }

    public int getP_homesum() {
        return p_homesum;
    }

    public void setP_homesum(int p_homesum) {
        this.p_homesum = p_homesum;
    }

    public String getP_workable() {
        return p_workable;
    }

    public void setP_workable(String p_workable) {
        this.p_workable = p_workable;
    }

    public String getP_marry() {
        return p_marry;
    }

    public void setP_marry(String p_marry) {
        this.p_marry = p_marry;
    }

    public String getP_first() {
        return p_first;
    }

    public void setP_first(String p_first) {
        this.p_first = p_first;
    }

    public String getP_ill() {
        return p_ill;
    }

    public void setP_ill(String p_ill) {
        this.p_ill = p_ill;
    }

    public String getP_trade() {
        return p_trade;
    }

    public void setP_trade(String p_trade) {
        this.p_trade = p_trade;
    }

    public int getP_phone() {
        return p_phone;
    }

    public void setP_phone(int p_phone) {
        this.p_phone = p_phone;
    }

    public String getP_adress() {
        return p_adress;
    }

    public void setP_adress(String p_adress) {
        this.p_adress = p_adress;
    }

    public float getP_monery() {
        return p_monery;
    }

    public void setP_monery(float p_monery) {
        this.p_monery = p_monery;
    }

    public String getP_shenheren() {
        return p_shenheren;
    }

    public void setP_shenheren(String p_shenheren) {
        this.p_shenheren = p_shenheren;
    }

    public String getP_shenpiren() {
        return p_shenpiren;
    }

    public void setP_shenpiren(String p_shenpiren) {
        this.p_shenpiren = p_shenpiren;
    }

    public String getP_agree() {
        return p_agree;
    }

    public void setP_agree(String p_agree) {
        this.p_agree = p_agree;
    }

    public String getP_towm_monery() {
        return p_towm_monery;
    }

    public void setP_towm_monery(String p_towm_monery) {
        this.p_towm_monery = p_towm_monery;
    }

    public String getP_xian_monery() {
        return p_xian_monery;
    }

    public void setP_xian_monery(String p_xian_monery) {
        this.p_xian_monery = p_xian_monery;
    }

    public String getP_person_monery() {
        return p_person_monery;
    }

    public void setP_person_monery(String p_person_monery) {
        this.p_person_monery = p_person_monery;
    }

    public String getP_shifaqianren() {
        return p_shifaqianren;
    }

    public void setP_shifaqianren(String p_shifaqianren) {
        this.p_shifaqianren = p_shifaqianren;
    }

    public String getP_issendmonery() {
        return p_issendmonery;
    }

    public void setP_issendmonery(String p_issendmonery) {
        this.p_issendmonery = p_issendmonery;
    }
}
