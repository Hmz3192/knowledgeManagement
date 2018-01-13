package com.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.model.User;
import com.pojo.PageResult;
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
@Namespace("/json")
@Scope("prototype")
public class JsonAction extends SuperAction {

    private static Logger logger = LogManager.getLogger(JsonAction.class.getName());
    private User user;
    private List<User> users;
    private String mes;
    private Integer currentPage;
    private Integer rows;
    private PageResult pageResult;
    @Resource
    private UserService userService;

    @Action(value = "selectUser", results = {@Result(name = "jsonUser",type = "json", params = {"root", "users"})})
    public String selectUser() {
        users = new ArrayList<>();
        users = userService.selectUsers();
        return "jsonUser";
    }


    @Action(value = "clearReadis", results = {@Result(name = "jsonUser",type = "json", params = {"root", "mes"})})
    public String clearReadis() {
        mes = new String();
        //清除redis缓存
        JedisUtil.getJedis().flushDB();
        mes = "清除成功";
        return "jsonUser";
    }


    @Action(value = "insertOne", results = {@Result(name = "jsonUser",type = "json", params = {"root", "mes"})})
    public String insertOne() {
        user = new User();
        mes = new String();
        userService.insertOne(user);
        mes = "添加成功";
        return "jsonUser";
    }
    @Action(value = "page", results = {@Result(name = "page",type = "json", params = {"root", "pageResult"})})
    public String page() {
        PageHelper.startPage(currentPage, rows);
        List<User> users = userService.selectAll();
        PageInfo<User> info = new PageInfo<User>(users);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        }else
            total = info.getTotal() / rows + 1;
        pageResult = new PageResult(total, users, currentPage);
        return "page";
    }


    /*---------------------------------get/Set---------------------------------------------*/

    public PageResult getPageResult() {
        return pageResult;
    }

    public void setPageResult(PageResult pageResult) {
        this.pageResult = pageResult;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

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
