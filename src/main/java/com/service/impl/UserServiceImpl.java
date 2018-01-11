package com.service.impl;

import com.dao.UserMapper;
import com.model.User;
import com.model.UserExample;
import com.service.UserService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    /* value属性是必须指定的，其表示当前方法的返回值是会被缓存在哪个Cache上的，
    对应Cache的名称。其可以是一个Cache也可以是多个Cache，当需要指定多个Cache时其是一个数组。*/
    @Cacheable(value={"userInfoCache"},
            key="T(com.utils.Md5Util).stringByMD5(#p0+'findByUserid')")
    public void findByUserid(String userid){
    }


    @Cacheable(value={"userInfoCache"},
            key="T(com.utils.Md5Util).stringByMD5(#p0+'findByUserid')")
    @Override
    public List<User> selectUsers() {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        List<User> users = userMapper.selectByExample(userExample);
        return users;
    }

    //清除值空间下的所有key缓存
    @CacheEvict(value="userInfoCache",allEntries = true)
    @Override
    public void insertOne(User user) {
        userMapper.insert(user);
    }



}