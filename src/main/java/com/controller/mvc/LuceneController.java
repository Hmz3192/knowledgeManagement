package com.controller.mvc;

import com.lucene.ConstantParams;
import com.lucene.api.FullTextIndexParams;
import com.lucene.api.FullTextService;
import com.lucene.api.ServerFactory;
import com.lucene.spi.LuceneService;
import com.model.KlKnowledge;
import com.service.KLKnowledgeService;
import com.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/16.
 */
@Controller
public class LuceneController {
    @Resource
    private KLKnowledgeService klKnowledgeService;

    private LuceneService luceneService = null;
    private FullTextService searchService = null;
    @RequestMapping("/checkIndex")
    public String checkIndex(Model model) {
        List<KlKnowledge> all = klKnowledgeService.getAll();
        model.addAttribute("Knowledges", all);
        return "search/search";
    }

    public void beginService(String flag,String indexPath){
        Map<String,String> params = new HashMap<String,String>();
        params.put("type", "lucene");
        params.put("serverName", "test");
        params.put("flag", flag);
        params.put("className", LuceneService.class.getName());
        params.put("indexPath", indexPath);
        ServerFactory serverFactory = new ServerFactory();
        luceneService = (LuceneService)serverFactory.beginService(params);
        luceneService.setServerName("test");
    }

    @RequestMapping("/createIndex")
    @ResponseBody
    public String createIndex(){
        int indexId = 1;
        if(indexId != 0){
            String indexPath = ConstantParams.INDEXPATH;
            String sourcePath = "E:\\WorkSpace\\Idea\\knowledgeManagement\\src\\main\\webapp\\attached\\multFile\\20180209\\test";

            //启动服务
            beginService("writer",indexPath);

            FullTextIndexParams fullTextIndexParams = new FullTextIndexParams();
            List<Map<String,Object>> indexData = new ArrayList<Map<String,Object>>();

            StringUtil su = new StringUtil(sourcePath);
            List<String> pathList = su.allPathResult;
            Map<String,Object> map = null;
            for(String path : pathList){
                map = new HashMap<String,Object>();
                String fileName = StringUtil.getFileNameFromPath(path);
                String content = StringUtil.getContent(path);
                map.put("fileName", fileName);
                map.put("content", content);
                indexData.add(map);
            }
            fullTextIndexParams.setIndexData(indexData);
            luceneService.doIndex(fullTextIndexParams);
        }
        return "createIndex";
    }




}
