package com.controller;


import com.model.User;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.SuperAction;
import net.sf.json.JSONObject;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import javax.servlet.ServletException;

@Scope("prototype")
@Namespace("/")
@ParentPackage("struts-default")
public class UserAction extends SuperAction implements ModelDriven<User> {

    private User user = new User();
    //登陆
    @Action(value="login", results={
            @Result(name="success", location="/jsp/success.jsp")})
    public String login() {
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
