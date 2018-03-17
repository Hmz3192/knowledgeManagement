package com.model;

import java.io.Serializable;

public class Manager implements Serializable{
    private Integer id;

    private String mName;

    private String password;

    public Manager(Integer id, String mName, String password) {
        this.id = id;
        this.mName = mName;
        this.password = password;
    }

    public Manager() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName == null ? null : mName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}