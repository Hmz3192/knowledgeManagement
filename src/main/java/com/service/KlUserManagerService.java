package com.service;

import com.model.Manager;
import com.model.KlUser;

import java.util.List;

/**
 * Created by dellpc on 2018/3/5.
 */
public interface KlUserManagerService {

    //public Manager managerLogin(String m_name, String password);
    public KlUser selectByPrimaryKey(Integer userId);
    public List<KlUser> findAll();
    public int addUser(KlUser klUser);
    public int delUser(int userId);
    public int updateUser(KlUser klUser);
}
