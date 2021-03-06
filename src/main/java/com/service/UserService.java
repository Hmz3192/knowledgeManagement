package com.service;

import com.model.User;

import java.util.List;

public interface UserService {
    void findByUserid(String userid);

    List<User> selectUsers();

    void insertOne(User user);

    List<User> selectAll();
}
