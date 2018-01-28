package com.dao;

import com.model.KlUser;
import com.model.KlUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface KlUserMapper {
    long countByExample(KlUserExample example);

    int deleteByExample(KlUserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(KlUser record);

    int insertSelective(KlUser record);

    List<KlUser> selectByExample(KlUserExample example);

    KlUser selectByPrimaryKey(Integer userId);

    int updateByExampleSelective(@Param("record") KlUser record, @Param("example") KlUserExample example);

    int updateByExample(@Param("record") KlUser record, @Param("example") KlUserExample example);

    int updateByPrimaryKeySelective(KlUser record);

    int updateByPrimaryKey(KlUser record);
}