package com.dao;

import com.model.KlManager;
import com.model.KlUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dellpc on 2018/3/5.
 */
public interface KlUserManagerMapper {

    public KlManager findUserByNameAndPwd(@Param("m_name") String m_name, @Param("password") String password);

    public KlUser selectUser(@Param("u_name") String u_name);

    public List<KlUser> selectAll();

    public int addUser(KlUser klUser);

    public int delUser(int userId);

    public int updateUser(KlUser klUser);
}
