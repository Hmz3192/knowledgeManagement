package com.controller;


import com.model.User;
import com.redis.JedisUtil;
import com.service.UserService;
import com.utils.SuperAction;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@ParentPackage("json-default")
@Result(name = "jsonUser", type = "json")
@Namespace("/json")
@Scope("prototype")
public class JsonAction extends SuperAction {

    private static Logger logger = LogManager.getLogger(JsonAction.class.getName());
    private User user;
    private List<User> users;
    private String mes;
    @Resource
    private UserService userService;

    @Action(value = "selectUser", results = {@Result(type = "json", params = {"root", "users"})})
    public String selectUser() {
        users = new ArrayList<>();
        users = userService.selectUsers();
        return "jsonUser";
    }


    @Action(value = "clearReadis", results = {@Result(type = "json", params = {"root", "mes"})})
    public String clearReadis() {
        mes = new String();
        //清除redis缓存
        JedisUtil.getJedis().flushDB();
        mes = "清除成功";
        return "jsonUser";
    }


    @Action(value = "insertOne", results = {@Result(type = "json", params = {"root", "mes"})})
    public String insertOne() {
        user = new User();
        mes = new String();
        userService.insertOne(user);
        mes = "添加成功";
        return "jsonUser";
    }


    /*---------------------------------get/Set---------------------------------------------*/


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }
}
