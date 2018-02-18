package com.controller.mvc;

import com.lucene.ConstantParams;
import com.lucene.api.*;
import com.lucene.spi.LuceneService;
import com.model.KlKnowledge;
import com.service.KLKnowledgeService;
import com.utils.FileUtil;
import com.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
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

    //单个文件建立索引，同意建立索引
    @RequestMapping("/addIndex/{klId}")
    public String checkIndex(@PathVariable("klId") Integer klId,HttpServletRequest request,Model model) {
        KlKnowledge klKnowledge = klKnowledgeService.selectByPrimaryKey(klId);
        klKnowledge.setKlCheckState(1);

        String indexPath = ConstantParams.INDEXPATH;
        //清除原有索引
        String realPath = request.getServletContext().getRealPath("/") + "index";
        FileUtil.deleteDir(new File(realPath));
        klKnowledgeService.updateKl(klKnowledge);
        //获取所有state=1
        List<KlKnowledge> indexed = klKnowledgeService.getIndexed();
        //重新放入
        //启动服务
        beginService("writer",indexPath);
        FullTextIndexParams fullTextIndexParams = new FullTextIndexParams();
        List<Map<String,Object>> indexData = new ArrayList<Map<String,Object>>();
        Map<String,Object> map = null;
        for (KlKnowledge klKnowledge1 : indexed) {
            map = new HashMap<String,Object>();
            map.put("klTitle", klKnowledge1.getKlTitle());
            map.put("klIntro", klKnowledge1.getKlIntroduction());
            map.put("klContent", StringUtil.html2Text(klKnowledge1.getKlContent()));
            indexData.add(map);
        }
        fullTextIndexParams.setIndexData(indexData);
        luceneService.doIndex(fullTextIndexParams);
        List<KlKnowledge> all = klKnowledgeService.getAll();
        model.addAttribute("Knowledges", all);
        return "search/search";
    }




    @RequestMapping("/search")
    public String doQuery(String queryString, Model model) {
        String indexPath = ConstantParams.INDEXPATH;
        if (StringUtil.isNotEmpty(queryString)) {
            beginService("search", indexPath);
            FullTextSearchParams fullTextSearchParams = new FullTextSearchParams();
            fullTextSearchParams.setQueryWord(queryString);
            fullTextSearchParams.setReturnNums(1000);

            List<String> assignmentFields = new ArrayList<String>();
            assignmentFields.add("klTitle");
            assignmentFields.add("klIntro");
            assignmentFields.add("klContent");

            fullTextSearchParams.setAssignmentFields(assignmentFields);

            String[] viewFields = new String[]{"klTitle", "klIntro","klContent"};
            fullTextSearchParams.setViewFields(viewFields);

            fullTextSearchParams.setViewNums(150);
            fullTextSearchParams.setIsHighlight(true);
            fullTextSearchParams.setPreHighlight("<font color='red'>");
            fullTextSearchParams.setPostHighlight("</font>");
            FullTextResult result = luceneService.doQuery(fullTextSearchParams);
            long numFound = result.getNumFound();
            List tempList = result.getResultList();

            int pageRow = tempList.size();
            int pageSize = 10;

            model.addAttribute("searchList", tempList);
            List<KlKnowledge> all = klKnowledgeService.getAll();
            model.addAttribute("Knowledges", all);
        }

        return "search/search";
    }


    //lucene
    public void beginService(String flag,String indexPath){
        File file = new File(indexPath);
        if (!file.exists()) {
            file.mkdir();
        }
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
        return "createIndex";
    }



}
