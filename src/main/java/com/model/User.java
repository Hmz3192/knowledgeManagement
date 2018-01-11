package com.model;

import java.io.Serializable;

public class User implements Serializable{
    private Integer id;

    private String user;

    public User(Integer id, String user) {
        this.id = id;
        this.user = user;
    }

    public User() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user == null ? null : user.trim();
    }
}