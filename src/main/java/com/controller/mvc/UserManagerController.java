package com.controller.mvc;

import com.model.KlUser;
import com.service.KlUserManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by dellpc on 2018/3/4.
 */
@Controller
@RequestMapping("/userManger")
public class UserManagerController {

    //注入Service
    @Autowired
    private KlUserManagerService klUserManagerService;

    @RequestMapping(value = "/managerLogin.do",method = RequestMethod.POST)
    @ResponseBody
    public KlUser login(@RequestBody KlUser requestUser) {
        String u_name = requestUser.getUserName();
        String password = requestUser.getUserPassword();
        System.out.println("u_name" + u_name);
        KlUser klUser = klUserManagerService.managerLogin(u_name,password);
        return klUser;
    }
}
