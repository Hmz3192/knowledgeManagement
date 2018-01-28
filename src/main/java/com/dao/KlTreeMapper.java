package com.dao;

import com.model.KlTree;
import com.model.KlTreeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface KlTreeMapper {
    long countByExample(KlTreeExample example);

    int deleteByExample(KlTreeExample example);

    int deleteByPrimaryKey(Integer fileId);

    int insert(KlTree record);

    int insertSelective(KlTree record);

    List<KlTree> selectByExample(KlTreeExample example);

    KlTree selectByPrimaryKey(Integer fileId);

    int updateByExampleSelective(@Param("record") KlTree record, @Param("example") KlTreeExample example);

    int updateByExample(@Param("record") KlTree record, @Param("example") KlTreeExample example);

    int updateByPrimaryKeySelective(KlTree record);

    int updateByPrimaryKey(KlTree record);
}