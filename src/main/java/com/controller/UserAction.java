package com.controller;


import com.model.User;
import com.model.UserExample;
import com.opensymphony.xwork2.ModelDriven;
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





    public User getModel() {
        return user;
    }
}
