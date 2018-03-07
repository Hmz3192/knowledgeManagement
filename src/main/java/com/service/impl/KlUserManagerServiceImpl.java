package com.service.impl;

import com.dao.KlUserManagerMapper;
import com.model.KlManager;
import com.model.KlUser;
import com.service.KlUserManagerService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dellpc on 2018/3/5.
 */
@Service
@Transactional
public class KlUserManagerServiceImpl implements KlUserManagerService{

    private static Logger log = Logger.getLogger(KlUserManagerServiceImpl.class);

    @Autowired
    private KlUserManagerMapper klUserManagerMapper;

    @Override
    public KlManager managerLogin(String m_name, String password) {
        KlManager klManager = klUserManagerMapper.findUserByNameAndPwd(m_name,password);
        if (klManager != null) {
            return klManager;
        }
        return null;
    }

    @Override
    public KlUser findUserByName(String u_name) {
        KlUser klUser = klUserManagerMapper.selectUser(u_name);

        log.info("userName:"+klUser.getUserName());
        if (klUser != null) {
            return klUser;
        }
        return null;
    }

    @Override
    public List<KlUser> findAll() {
        List<KlUser> klUserList = klUserManagerMapper.selectAll();
        return klUserList;
    }

    @Override
    public int addUser(KlUser klUser) {
        int newUserId = klUserManagerMapper.addUser(klUser);
        return newUserId;
    }

    @Override
    public int delUser(int userId) {
        int result = klUserManagerMapper.delUser(userId);
        return result;
    }

    @Override
    public int updateUser(KlUser klUser) {
        int result = klUserManagerMapper.updateUser(klUser);
        return result;
    }
}
