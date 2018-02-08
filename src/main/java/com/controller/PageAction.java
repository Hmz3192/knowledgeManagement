package com.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.model.User;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.PageResult;
import com.service.UserService;
import com.utils.IDUtils;
import com.utils.SuperAction;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import java.util.List;


public class PageAction extends SuperAction implements ModelDriven<User> {


    @Resource
    private UserService userService;
    private User user = new User();
    private Integer currentPage;
    private Integer rows;
    private PageResult pageResult;


    //去create1
    public String tocreate1() {
        return "tocreate1";
    }

    //去create2
    public String tocreate2() {
        return "tocreate2";
    }

    //去create3
    public String tocreate3() {
        return "tocreate3";
    }

    //查看页面引用资源文件
    public String resource() {
        return "resource";
    }

    /*文章详情页*/
    public String toKlDetail() {
        return "klDetail";
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
        this.pageResult = new PageResult(total, users, currentPage);
        application.setAttribute("pageResult", pageResult);
        application.setAttribute("rows", rows);

        return "page";
    }

    public String toLoad() {
        return "toLoad";
    }

    /*--------------------------get/set-----------------------------------*/

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

    public User getModel() {
        return user;
    }
}
