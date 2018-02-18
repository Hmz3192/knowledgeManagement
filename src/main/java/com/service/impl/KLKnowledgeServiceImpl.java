package com.service.impl;

import com.dao.KlKnowledgeMapper;
import com.model.KlKnowledge;
import com.model.KlKnowledgeExample;
import com.service.KLKnowledgeService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;
import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/7.
 */
@Service
@Transactional
public class KLKnowledgeServiceImpl implements KLKnowledgeService {


    @Resource
    private KlKnowledgeMapper klKnowledgeMapper;

    @CachePut(value="klKnow")
    public Integer saveKl(KlKnowledge klKnowledge) {
        return klKnowledgeMapper.insertSelective(klKnowledge);
    }



    @CacheEvict(value="klKnow",allEntries = true)
    public Integer updateKl(KlKnowledge klKnowledge) {
        KlKnowledgeExample example = new KlKnowledgeExample();
        KlKnowledgeExample.Criteria criteria = example.createCriteria();
        criteria.andKlIdEqualTo(klKnowledge.getKlId());
        int i = klKnowledgeMapper.updateByExampleSelective(klKnowledge, example);
        return i;
    }

    @Cacheable(value={"klKnow"})
    public KlKnowledge selectByPrimaryKey(Integer klId) {
        return klKnowledgeMapper.selectByPrimaryKey(klId);
    }

    @Cacheable(value={"klKnow"})
    public List<KlKnowledge> getAll() {
        KlKnowledgeExample example = new KlKnowledgeExample();
        KlKnowledgeExample.Criteria criteria = example.createCriteria();
        return klKnowledgeMapper.selectByExample(example);
    }

    @Cacheable(value={"klKnow"})
    public List<KlKnowledge> getIndexed() {
        KlKnowledgeExample example = new KlKnowledgeExample();
        KlKnowledgeExample.Criteria criteria = example.createCriteria();
        criteria.andKlCheckStateEqualTo(1);
        return klKnowledgeMapper.selectByExample(example);
    }


}
