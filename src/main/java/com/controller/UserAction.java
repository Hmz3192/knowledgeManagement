package com.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.model.User;
import com.model.UserExample;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.PageResult;
import com.service.UserService;
import com.utils.SuperAction;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import java.util.List;


public class UserAction extends SuperAction implements ModelDriven<User> {


    @Resource
    private UserService userService;
    private User user = new User();
    private Integer currentPage;
    private Integer rows;
    //登陆
    public String login() {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(user.getId() + user.getUser()+"---------");
        return SUCCESS;
    }


    //退出
    public String out() {
        //清除Struts的session和request
        session.invalidate();
        try {
            request.logout();
        } catch (ServletException e) {
            e.printStackTrace();
        }
        return "out_success";
    }


    public String page() {
        //因为redis的存在，如果在service里面分页，当下次上一页，下一页查询的时候，缓存的数据仍然时第一查询的单个页面的数据，会报错
        PageHelper.startPage(currentPage, rows);
        List<User> users = userService.selectAll();
        PageInfo<User> info = new PageInfo<User>(users);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        }else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, users, currentPage);
        SuperAction.getServletContext().put("pageResult", pageResult);
        return "page";
    }

    public String toLoad() {
        return "toLoad";
    }

    /*--------------------------get/set-----------------------------------*/

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

    public User getModel() {
        return user;
    }
}
