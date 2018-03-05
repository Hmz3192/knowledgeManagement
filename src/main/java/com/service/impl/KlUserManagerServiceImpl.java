package com.service.impl;

import com.dao.KlUserManagerMapper;
import com.model.KlUser;
import com.service.KlUserManagerService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by dellpc on 2018/3/5.
 */
public class KlUserManagerServiceImpl implements KlUserManagerService{

    @Autowired
    private KlUserManagerMapper klUserManagerMapper;

    @Override
    public KlUser managerLogin(String u_name, String password) {
        KlUser klUser = klUserManagerMapper.findUserByNameAndPwd(u_name,password);
        if (klUser != null) {
            return klUser;
        }
        return null;
    }
}
