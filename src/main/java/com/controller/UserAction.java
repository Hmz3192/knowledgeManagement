package com.controller;


import com.model.User;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.SuperAction;

import javax.servlet.ServletException;

public class UserAction extends SuperAction implements ModelDriven<User> {


    private User user = new User();
    //登陆
    public String login() {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(user.getName() + user.getPassword()+"---------");
        return SUCCESS;
    }


    //退出
    public String out() {
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
