package com.utils;

import com.model.KlKnowledge;
import com.model.KlRatingComment;
import com.service.KLKnowledgeService;
import com.service.KlRatingCommentService;
import org.junit.Test;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 锴 on 2018/2/12.
 */
@Component
public class RecommendUtil {
        @Resource
        private KLKnowledgeService klKnowledgeService;
        @Resource
        private KlRatingCommentService klRatingCommentService;


    /**
     * 得到相关的id
     * @param connectIds 数据库中取出相关id的字符串
     * @return list  知识对象list
     */
    public List<KlKnowledge> getConnectByIds(String connectIds){
        String[] args = connectIds.trim().split(",");
        List<KlKnowledge> list = null;
        KlKnowledge klKnowledge = null;
        for (int i = 0;i<args.length;i++){
            klKnowledge= klKnowledgeService.selectByPrimaryKey(Integer.parseInt(args[i]));
            list.add(klKnowledge);
        }
        return list;
    }

    /**
     *
     * @param list 知识list对象
     * @return newList根据评分由高到低排列好的对象
     */
    public List<KlKnowledge> recommendByRating(List<KlKnowledge> list){
        List<KlKnowledge> newList = null;
        List<KlRatingComment> ratingList = null;
        Integer kl_id;
        int[] ratingArray = new int[list.size()];
        int[] klIdArray = new int[list.size()];
        int rating=0;
        for (int i = 0;i < list.size();i++){
            kl_id = list.get(i).getKlId();
            klIdArray[i] = kl_id;
            ratingList = klRatingCommentService.selectByKlId(kl_id);
            for (int j = 0;j < ratingList.size();j++){
                rating=0;
                rating += ratingList.get(j).getKlRating();
                rating = rating/ratingList.size();
            }
            ratingArray[i] =  rating;
        }
        for (int i = 0;i<list.size()-1;i++){
            for (int j = 0;j<list.size()-1;j++){
                if (ratingArray[j]<ratingArray[j+1]){
                    int a;
                    //交换rating
                    a = ratingArray[j+1];
                    ratingArray[j+1]=ratingArray[j];
                    ratingArray[j]=a;
                    //交换id
                    a = klIdArray[j+1];
                    klIdArray[j+1]=klIdArray[j];
                    klIdArray[j]=a;
                }
            }
        }
        for (int i=0;i<list.size();i++){
            newList.add(klKnowledgeService.selectByPrimaryKey(klIdArray[i]));
        }
        return newList;
    }





    @Test
    public void main() {
        String str = "1,2,3,4,5,6";
        String[] args=str.trim().split(",");
        int[] ids = new int[args.length];
        for (int i = 0;i<args.length;i++){
            ids[i] = Integer.parseInt(args[i]);
        }
        for (int i = 0;i<ids.length;i++){
            System.out.println(ids[i]);
        }
    }

}
