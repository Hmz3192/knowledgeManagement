package com.controller;


import com.model.User;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.SuperAction;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Scope("prototype")
public class UserAction extends SuperAction implements ModelDriven<User> {

    private User user = new User();

    //登陆
    public String login() {
        System.out.println(user.getName() + user.getPassword()+"---------");
        return "error";
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
