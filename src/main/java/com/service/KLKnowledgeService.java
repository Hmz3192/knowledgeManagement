package com.service;

import com.model.KlKnowledge;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/7.
 */
public interface KLKnowledgeService {


    Integer saveKl(KlKnowledge klKnowledge);

    Integer updateKl(KlKnowledge klKnowledge);

    KlKnowledge selectByPrimaryKey(Integer klId);

    List<KlKnowledge> getAll();

}
