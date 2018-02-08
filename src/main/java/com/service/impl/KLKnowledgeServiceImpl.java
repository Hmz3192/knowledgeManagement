package com.service.impl;

import com.dao.KlKnowledgeMapper;
import com.model.KlKnowledge;
import com.model.KlKnowledgeExample;
import com.service.KLKnowledgeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/7.
 */
@Service
@Transactional
public class KLKnowledgeServiceImpl implements KLKnowledgeService {


    @Resource
    private KlKnowledgeMapper klKnowledgeMapper;

    public Integer saveKl(KlKnowledge klKnowledge) {
        return klKnowledgeMapper.insertSelective(klKnowledge);
    }

    public Integer updateKl(KlKnowledge klKnowledge) {
        KlKnowledgeExample example = new KlKnowledgeExample();
        KlKnowledgeExample.Criteria criteria = example.createCriteria();
        criteria.andKlIdEqualTo(klKnowledge.getKlId());
        int i = klKnowledgeMapper.updateByExampleSelective(klKnowledge, example);
        return i;
    }
}
