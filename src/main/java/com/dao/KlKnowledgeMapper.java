package com.dao;

import com.model.KlKnowledge;
import com.model.KlKnowledgeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface KlKnowledgeMapper {
    long countByExample(KlKnowledgeExample example);

    int deleteByExample(KlKnowledgeExample example);

    int deleteByPrimaryKey(Integer klId);

    int insert(KlKnowledge record);

    int insertSelective(KlKnowledge record);

    List<KlKnowledge> selectByExample(KlKnowledgeExample example);

    KlKnowledge selectByPrimaryKey(Integer klId);

    int updateByExampleSelective(@Param("record") KlKnowledge record, @Param("example") KlKnowledgeExample example);

    int updateByExample(@Param("record") KlKnowledge record, @Param("example") KlKnowledgeExample example);

    int updateByPrimaryKeySelective(KlKnowledge record);

    int updateByPrimaryKey(KlKnowledge record);
}