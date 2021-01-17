package com.domain;

/**
 * @Auther 笙
 * @Date 2020/12/22
 **/
public class Traveller {
    //主键
    private Integer id;
    //姓名
    private String name;
    //性别
    private String sex;
    //电话号码
    private String  phoneNum;
    //证件类型0身份证 1护照 2军官证
    private int credentialsType;
    private String credentialsTypeStr;
    //证件号码
    private String credentialsNum;
    //旅客类型（人群）0成人 1儿童
    private Integer travellerType;
    private  String travellerTypeStr;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public int getCredentialsType() {
        return credentialsType;
    }

    public void setCredentialsType(int credentialsType) {
        this.credentialsType = credentialsType;
    }

    public String getCredentialsTypeStr() {
        if (credentialsType==0){
            credentialsTypeStr="身份证";
        }
        if (credentialsType==1){
            credentialsTypeStr="护照";
        }
        if (credentialsType==2){
            credentialsTypeStr="军官证";
        }
        return credentialsTypeStr;
    }

    public void setCredentialsTypeStr(String credentialsTypeStr) {
        this.credentialsTypeStr = credentialsTypeStr;
    }

    public String getCredentialsNum() {
        return credentialsNum;
    }

    public void setCredentialsNum(String credentialsNum) {
        this.credentialsNum = credentialsNum;
    }

    public Integer getTravellerType() {
        return travellerType;
    }

    public void setTravellerType(Integer travellerType) {
        this.travellerType = travellerType;
    }

    public String getTravellerTypeStr() {
        if (travellerType==0){
            travellerTypeStr ="成人";
        }
        if (travellerType==1){
            travellerTypeStr="儿童";
        }
        return travellerTypeStr;
    }

    public void setTravellerTypeStr(String travellerTypeStr) {
        this.travellerTypeStr = travellerTypeStr;
    }
}
