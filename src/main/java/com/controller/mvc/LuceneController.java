package com.controller.mvc;

import com.lucene.ConstantParams;
import com.lucene.InitParams;
import com.lucene.api.*;
import com.lucene.index.IndexServer;
import com.lucene.spi.LuceneService;
import com.model.KlKnowledge;
import com.service.KLKnowledgeService;
import com.utils.FileUtil;
import com.utils.ReadFileUtils;
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

import static com.lucene.index.IndexServer.getService;

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
    public static FullTextService solrService = null;

    @RequestMapping("/readFile")
    public String readFile() {
        return "readFile";
    }

    @RequestMapping("/checkIndex")
    public String checkIndex(Model model) {
        List<KlKnowledge> all = klKnowledgeService.getAll();
        model.addAttribute("Knowledges", all);
        return "search/search";
    }

    //单个文件建立索引，同意建立索引
    @RequestMapping("/addIndex/{klId}")
    public String checkIndex(@PathVariable("klId") Integer klId, HttpServletRequest request, Model model) throws Exception {
        solrService = getService();
        KlKnowledge klKnowledge = klKnowledgeService.selectByPrimaryKey(klId);
        klKnowledge.setKlCheckState(1);
        klKnowledgeService.updateKl(klKnowledge);
        String path = request.getServletContext().getRealPath("");
        List<Map<String, Object>> indexData = prepareIndexData(klKnowledge, 1, path);
        FullTextIndexParams fullTextIndexParams = new FullTextIndexParams();
        fullTextIndexParams.setIndexData(indexData);
        solrService.doIndex(fullTextIndexParams);


     /*   KlKnowledge klKnowledge = klKnowledgeService.selectByPrimaryKey(klId);
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
        luceneService.doIndex(fullTextIndexParams);*/
        List<KlKnowledge> all = klKnowledgeService.getAll();
        model.addAttribute("Knowledges", all);
        return "search/search";
    }

    private List<Map<String, Object>> prepareIndexData(KlKnowledge klKnowledge, Integer klType, String path) throws Exception {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = new HashMap<>();
        map.put("id", String.valueOf(klKnowledge.getKlId()));
        map.put("userId", klKnowledge.getUserId());
        map.put("klKind", klKnowledge.getKlKind());
        map.put("klTitle", klKnowledge.getKlTitle());
        map.put("klIntro", klKnowledge.getKlIntroduction());
        map.put("klContent", StringUtil.html2Text(klKnowledge.getKlContent()));
        List<String> appendixs = StringUtil.ConvertStringToList(klKnowledge.getKlAppendix());
        int i = 0;
        for (String appendix : appendixs) {
            i++;
            ReadFileUtils readFileUtils = new ReadFileUtils();
            String appendixExt, content = "";
            int index = appendix.indexOf(".");
            appendixExt = appendix.substring(index).toLowerCase();//文件后缀
            if (appendixExt.equalsIgnoreCase(".pdf")) {
                content = readFileUtils.readPDF(path + appendix);
            } else if (appendixExt.equalsIgnoreCase(".docx")) {
                content = readFileUtils.readWORD2007(path + appendix);
            } else if(appendixExt.equalsIgnoreCase(".doc")){
                content = readFileUtils.readWORD(path + appendix);
            }else if(appendixExt.equalsIgnoreCase(".xls")){
                content = readFileUtils.readEXCEL(path + appendix);
            }
            else if(appendixExt.equalsIgnoreCase(".xlsx")){
                content = readFileUtils.readEXCEL2007(path + appendix);
            }
            else if(appendixExt.equalsIgnoreCase(".pptx")){
                content = readFileUtils.readPPT2007(path + appendix);
            }
            else if(appendixExt.equalsIgnoreCase(".txt")){
                content = readFileUtils.readTXT(path + appendix);
            }
            map.put("klAppendix" + i, StringUtil.deleteRNB(content));
        }
        list.add(map);
        return list;

    }


    @RequestMapping("/search")
    public String doQuery(String queryString, Model model) {
        beginService();
        FullTextSearchParams fullTextSearchParams = new FullTextSearchParams();
        fullTextSearchParams.setQueryWord(queryString);
        //sousuo yu
        List<String> assignmentFields = new ArrayList<String>();
        assignmentFields.add("klTitle");
        assignmentFields.add("klIntro");
        assignmentFields.add("klContent");
        assignmentFields.add("klAppendix1");
        assignmentFields.add("klAppendix2");
        assignmentFields.add("klAppendix3");
        assignmentFields.add("klAppendix4");
        assignmentFields.add("klAppendix5");
        fullTextSearchParams.setAssignmentFields(assignmentFields);
        //shitu yu
        String[] viewFields = new String[]{"id","klTitle","klIntro","klContent","klAppendix1","klAppendix2","klAppendix3","klAppendix4","klAppendix5"};
        fullTextSearchParams.setViewFields(viewFields);

        fullTextSearchParams.setViewNums(30);
        fullTextSearchParams.setIsHighlight(true);
        String[] highlightFields = {"klTitle","klIntro","klContent","klAppendix1","klAppendix2","klAppendix3","klAppendix4","klAppendix5"};
        fullTextSearchParams.setHighlightFields(highlightFields);
        fullTextSearchParams.setPreHighlight("<font color='red'>");
        fullTextSearchParams.setPostHighlight("</font>");

        //guolv
        /*Map<String,String> filterField = new HashMap<String,String>();
        filterField.put("columnId", columnId+"");
        fullTextSearchParams.setFilterField(filterField);*/

        FullTextResult result = searchService.doQuery(fullTextSearchParams);
        long numFound = result.getNumFound();
        List tempList = result.getResultList();

        int pageRow = tempList.size();
        int pageSize = 10;

        model.addAttribute("searchList", tempList);
        List<KlKnowledge> all = klKnowledgeService.getAll();
        model.addAttribute("Knowledges", all);
        model.addAttribute("queryString", queryString);

//        lucene
        /*String indexPath = ConstantParams.INDEXPATH;
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
        }*/

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


    public void beginService(){
        Map<String,String> params = new HashMap<String,String>();
        String type = StringUtil.getConfigParam(InitParams.SERVERTYPE, "", InitParams.SEARCH_PROPERTIES);
        params.put("type", type);
        String serverName = StringUtil.getConfigParam(InitParams.SERVERNAME, "", InitParams.SEARCH_PROPERTIES);
        params.put("serverName", serverName);
        String url = StringUtil.getConfigParam(InitParams.SOLR_URL, "", InitParams.SEARCH_PROPERTIES);
        params.put("url", url);
        params.put("className", IndexServer.class.getName());
        ServerFactory serverFactory = new ServerFactory();
        searchService = serverFactory.beginService(params);
        searchService.setServerName(serverName);
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
