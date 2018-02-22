package com.controller.mvc;

import com.model.KlKnowledge;
import com.pojo.SensitiveWordPojo;
import com.sensitivewdfilter.SensitivewordFilter;
import com.sensitivewdfilter.WordFilter;
import com.service.KLKnowledgeService;
import com.utils.ConvertSwfUtil;
import com.utils.StringUtil;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.Set;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/21.
 */
@Controller
public class KlKnowledgeController {

    @Resource
    private KLKnowledgeService klKnowledgeService;


    @RequestMapping("getByklId/{klId}")
    @ResponseBody
    public KlKnowledge getByklId(@PathVariable("klId") Integer klId) {
        KlKnowledge one = klKnowledgeService.selectByPrimaryKey(klId);
        return one;
    }

    /*在线浏览*/
    @RequestMapping("toReadOnline/{readOnlinePath}")
    public String toReadOnline(HttpServletRequest request, @PathVariable("readOnlinePath")String readOnlinePath, Model model) {
        String path = request.getServletContext().getRealPath("");
//        String readOnlinePath = "/attached/multFile/20180208/浙江网新恒天软件有限公司_针对资讯的用户建模和个性推荐系统.docx";
        String readOnlinePathNow = StringUtil.shu2xie(readOnlinePath);
        String wholePath = path + readOnlinePathNow;
        String fileName = StringUtil.getFileNameOnly(readOnlinePathNow);
        String outPutPath = request.getServletContext().getRealPath("/") + "attached/" ;
        String outPath = new ConvertSwfUtil().beginConvert(outPutPath,wholePath, fileName);
        System.out.println("生成swf文件:" + outPath);
        File swfFile = new File(outPath);
//        swfPath = swfFile.getName();
        System.out.println(swfFile.getName());
        model.addAttribute("swfPath", swfFile.getName());
        return "readFile";
    }

    //敏感词检测
    @RequestMapping("wordTest/{klId}")
    @ResponseBody
    public SensitiveWordPojo wordTest(@PathVariable("klId") Integer klId) {
        SensitivewordFilter filter = new SensitivewordFilter();
        SensitiveWordPojo sensitiveWordPojo = new SensitiveWordPojo();
        KlKnowledge one = klKnowledgeService.selectByPrimaryKey(klId);
        String sWord = "三级片";
        sWord += one.getKlTitle() + one.getKlIntroduction() + StringUtil.html2Text(one.getKlContent());
        long beginTime = System.currentTimeMillis();
        Set<String> set = filter.getSensitiveWord(sWord, 1);
        long endTime = System.currentTimeMillis();
        String time = String.valueOf(endTime - beginTime);
//        System.out.println("语句中包含敏感词的个数为：" + set.size() + "。包含：" + set);
        sensitiveWordPojo.setExcuteTime(time);
        sensitiveWordPojo.setWords(set);
        int len = sWord.length();
        sensitiveWordPojo.setWordSize(set.size());
        String percentage = StringUtil.calPercentage(set.size(), sWord.length());
        sensitiveWordPojo.setPassProb(percentage + "%");
        return sensitiveWordPojo;
    }
}
