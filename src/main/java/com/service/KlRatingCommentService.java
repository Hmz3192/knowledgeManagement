package com.service;

import com.model.KlRatingComment;

import java.util.List;

/**
 * Created by 锴 on 2018/2/13.
 */
public interface KlRatingCommentService {
    List<KlRatingComment> selectByKlId(Integer KlId);
}
