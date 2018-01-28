package com.model;

import java.io.Serializable;

public class KlUser implements Serializable {
    private Integer userId;

    private String userName;

    private String userPassword;

    private String userAvatar;

    private String userPhone;

    private String userEmail;

    private Integer userVip;

    private Integer userPoint;

    public KlUser(Integer userId, String userName, String userPassword, String userAvatar, String userPhone, String userEmail, Integer userVip, Integer userPoint) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userAvatar = userAvatar;
        this.userPhone = userPhone;
        this.userEmail = userEmail;
        this.userVip = userVip;
        this.userPoint = userPoint;
    }

    public KlUser() {
        super();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar == null ? null : userAvatar.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public Integer getUserVip() {
        return userVip;
    }

    public void setUserVip(Integer userVip) {
        this.userVip = userVip;
    }

    public Integer getUserPoint() {
        return userPoint;
    }

    public void setUserPoint(Integer userPoint) {
        this.userPoint = userPoint;
    }
}