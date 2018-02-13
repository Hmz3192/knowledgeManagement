package com.dao;

import com.model.KlRatingComment;
import com.model.KlRatingCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface KlRatingCommentMapper {
    long countByExample(KlRatingCommentExample example);

    int deleteByExample(KlRatingCommentExample example);

    int insert(KlRatingComment record);

    int insertSelective(KlRatingComment record);

    List<KlRatingComment> selectByExample(KlRatingCommentExample example);

    int updateByExampleSelective(@Param("record") KlRatingComment record, @Param("example") KlRatingCommentExample example);

    int updateByExample(@Param("record") KlRatingComment record, @Param("example") KlRatingCommentExample example);

    /**
     *
     * @param KlId
     * @return
     * 需要检查一下在KlRatingCommentMapper.xml中配置一下sql语句
     */
    List<KlRatingComment> selectByKlId(Integer KlId);
}