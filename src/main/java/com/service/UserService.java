package com.service;

import com.github.pagehelper.PageInfo;
import com.model.User;
import com.pojo.PageResult;

import java.util.List;

public interface UserService {
    void findByUserid(String userid);

    List<User> selectUsers();

    void insertOne(User user);

    List<User> selectAll();
}
