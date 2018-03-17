package com.controller.mvc;

import com.model.Manager;
import com.model.KlUser;
import com.service.KlUserManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by dellpc on 2018/3/4.
 */
@Controller
@RequestMapping("/userManager")
public class KlUserManagerController {

    //注入Service
    @Autowired
    private KlUserManagerService klUserManagerService;

//    @RequestMapping(value = "/mLogin.mvc",method = RequestMethod.POST)
//    @ResponseBody
//    public Manager login(@RequestBody KlUser requestUser) {
//        String m_name = requestUser.getUserName();
//        String password = requestUser.getUserPassword();
//        System.out.println("m_name" + m_name);
//        Manager klManager = klUserManagerService.managerLogin(m_name,password);
//        return klManager;
//    }

    //根据用户名查找用户
    @RequestMapping(value = "/findUserByName.mvc", method = RequestMethod.POST)
    @ResponseBody
    public KlUser findUserByName(@RequestBody KlUser klUser) {
        Integer userId = klUser.getUserId();

        KlUser resultUser = klUserManagerService.selectByPrimaryKey(userId);
        return resultUser;
    }

    //列出所有用户
    @RequestMapping(value = "/findAll.mvc", method = RequestMethod.POST)
    @ResponseBody
    public List<KlUser> findAll() {
        List klUserList = klUserManagerService.findAll();
        return klUserList;
    }

    //增加新用户
    @RequestMapping(value = "/addUser.mvc", method = RequestMethod.POST)
    @ResponseBody
    public int addUser(@RequestBody KlUser klUser) {
        int newUserId = klUserManagerService.addUser(klUser);
        return newUserId;
    }

    @RequestMapping(value = "/delUser.mvc", method = RequestMethod.POST)
    @ResponseBody
    public int delUser(@RequestBody KlUser klUser) {
        int userId = klUser.getUserId();
        int result = klUserManagerService.delUser(userId);
        if (result > 0) {
            return result;
        }
        return -100;
    }

    @RequestMapping(value = "/updateUser.mvc", method = RequestMethod.POST)
    @ResponseBody
    public int updateUser(@RequestBody KlUser klUser) {
        int result = klUserManagerService.updateUser(klUser);
        if (result > 0) {
            return result;
        }
        return -100;
    }


}
