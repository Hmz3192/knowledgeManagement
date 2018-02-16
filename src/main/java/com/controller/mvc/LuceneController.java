package com.controller.mvc;

import com.beifeng.retrieve.api.FullTextIndexParams;
import com.beifeng.retrieve.api.ServerFactory;
import com.beifeng.retrieve.spi.LuceneService;
import com.beifeng.util.DateUtils;
import com.beifeng.util.StringUtils;
import com.model.KlKnowledge;
import com.service.KLKnowledgeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    private LuceneService luceneService = null;
    @Resource
    private KLKnowledgeService klKnowledgeService;

    @RequestMapping("/checkIndex")
    public String checkIndex(Model model) {
        List<KlKnowledge> all = klKnowledgeService.getAll();
        model.addAttribute("Knowledges", all);
        return "search/search";
    }


    @RequestMapping("/createIndex")
    public String createIndex() {
        int indexId = 0;
        String indexPath = "";
        String sourcePath = "";
        if (indexId != 0) {
            //启动服务
            beginService("writer", indexPath);

            FullTextIndexParams fullTextIndexParams = new FullTextIndexParams();
            List<Map<String, Object>> indexData = new ArrayList<Map<String, Object>>();

            //获取所有下面的文件路径
            StringUtils su = new StringUtils(sourcePath);
            List<String> pathList = su.allPathResult;
            Map<String, Object> map = null;
            for (String path : pathList) {
                map = new HashMap<String, Object>();
                String fileName = StringUtils.getFileNameFromPath(path);
                //读取文档内容
                String content = StringUtils.getContent(path);
                map.put("fileName", fileName);
                map.put("content", content);
                indexData.add(map);
            }
            fullTextIndexParams.setIndexData(indexData);
            luceneService.doIndex(fullTextIndexParams);
        }
        return "forward:/checkIndex";
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

}
