package com.service;

import com.model.KlManager;
import com.model.KlUser;

import java.util.List;

/**
 * Created by dellpc on 2018/3/5.
 */
public interface KlUserManagerService {

    public KlManager managerLogin(String m_name, String password);
    public KlUser findUserByName(String userName);
    public List<KlUser> findAll();
    public int addUser(KlUser klUser);
    public int delUser(int userId);
    public int updateUser(KlUser klUser);
}
