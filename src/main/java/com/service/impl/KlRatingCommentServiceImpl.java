package com.service.impl;

import com.model.KlRatingComment;
import com.service.KlRatingCommentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 锴 on 2018/2/13.
 */

@Service
@Transactional
public class KlRatingCommentServiceImpl  implements KlRatingCommentService{
    @Resource
    private KlRatingCommentService klRatingCommentService;

    @Override
    public List<KlRatingComment> selectByKlId(Integer KlId) {
        return klRatingCommentService.selectByKlId(KlId);
    }
}
