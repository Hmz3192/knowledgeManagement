package com.dao;

import com.model.KlUser;
import org.apache.ibatis.annotations.Param;

/**
 * Created by dellpc on 2018/3/5.
 */
public interface KlUserManagerMapper {

    public KlUser findUserByNameAndPwd(@Param("u_name") String u_name, @Param("password") String password);

}
