package com.service;

import com.model.KlUser;

/**
 * Created by dellpc on 2018/3/5.
 */
public interface KlUserManagerService {

    KlUser managerLogin(String u_name, String password);
}
