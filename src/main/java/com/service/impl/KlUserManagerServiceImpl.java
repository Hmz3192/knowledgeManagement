package com.service.impl;

import com.dao.KlUserMapper;
import com.dao.ManagerMapper;
import com.model.KlUserExample;
import com.model.Manager;
import com.model.KlUser;
import com.model.ManagerExample;
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
    private ManagerMapper klUserManagerMapper;
    @Autowired
    private KlUserMapper klUserMapper;

//    @Override
//    public Manager managerLogin(String m_name, String password) {
//        Manager klManager = klUserManagerMapper.findUserByNameAndPwd(m_name,password);
//        if (klManager != null) {
//            return klManager;
//        }
//        return null;
//    }

    @Override
    public KlUser selectByPrimaryKey(Integer userId) {
        return klUserMapper.selectByPrimaryKey(userId);
    }

    @Override
    public List<KlUser> findAll() {
        KlUserExample example = new KlUserExample();
        KlUserExample.Criteria criteria = example.createCriteria();
        return klUserMapper.selectByExample(example);
    }

    @Override
    public int addUser(KlUser klUser) {
        int newUserId = klUserMapper.insert(klUser);
        return newUserId;
    }

    @Override
    public int delUser(int userId) {
        int result = klUserMapper.deleteByPrimaryKey(userId);
        return result;
    }

    @Override
    public int updateUser(KlUser klUser) {
        KlUserExample example = new KlUserExample();
        KlUserExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(klUser.getUserId());
        int result = klUserMapper.updateByExampleSelective(klUser,example);
        return result;
    }
}
