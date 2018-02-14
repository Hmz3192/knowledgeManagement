package com.utils;

import com.model.KlKnowledge;
import com.model.KlRatingComment;
import com.service.KLKnowledgeService;
import com.service.KlRatingCommentService;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
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


    public List<KlKnowledge> recommendByUser(Integer userId) throws TasteException {
        List<KlKnowledge> klKnowledgeList = null;
        List<KlRatingComment> klRatingCommentList;
        klRatingCommentList = klRatingCommentService.selectByRecommend();
        //获取模型
        DataModel model = (DataModel) klRatingCommentList;
        //计算相似度
        UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
        //计算阈值,选择邻近的2个用户
        UserNeighborhood neighborhood = new NearestNUserNeighborhood(2 ,similarity,model);
        //推荐集合
        Recommender recommender = new GenericUserBasedRecommender(model,neighborhood,similarity);
        //推荐数量 为3的一个合集,这里数量可以修改
        List<RecommendedItem> recommendedItems = recommender.recommend(userId,3);
        int kl_idArray[] = new int[recommendedItems.size()];
        for (int i=0;i<recommendedItems.size();i++){
            kl_idArray[i] = (int) recommendedItems.get(i).getItemID();
        }
        KlKnowledge klKnowledge;
        for (int i=0;i<recommendedItems.size();i++){
            klKnowledge = klKnowledgeService.selectByPrimaryKey(kl_idArray[i]);
            klKnowledgeList.add(klKnowledge);
        }
        return klKnowledgeList;
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
