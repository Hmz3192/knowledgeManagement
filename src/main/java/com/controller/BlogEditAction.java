package com.controller;

import com.model.KlKnowledge;
import com.service.KLKnowledgeService;
import com.utils.ConvertSwfUtil;
import com.utils.IDUtils;
import com.utils.StringUtil;
import com.utils.SuperAction;

import javax.annotation.Resource;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/5.
 */
public class BlogEditAction extends SuperAction{

    private File[] file;    //文件
    private String[] fileFileName;
    private String filelSavePath;
    private String[] fileContentType;

    private KlKnowledge klKnowledge;
    private String content1;
    private String tags;
    @Resource
    private KLKnowledgeService klKnowledgeService;


    /*在线浏览*/
    public String toReadOnline() {
        String path = request.getServletContext().getRealPath("");
        String filePath = "/attached/multFile/20180208/浙江网新恒天软件有限公司_针对资讯的用户建模和个性推荐系统.docx";
        String wholePath = path + filePath;
        String fileName = StringUtil.getFileNameOnly(filePath);
        String outPutPath = request.getServletContext().getRealPath("/") + "uploadFile/" ;
        String outPath = new ConvertSwfUtil().beginConvert(outPutPath,wholePath, fileName);
        System.out.println("生成swf文件:" + outPath);
        File swfFile = new File(outPath);
//        swfPath = swfFile.getName();
        System.out.println(swfFile.getName());
        session.setAttribute("swfPath", swfFile.getName());
        return "forwardToLook";
    }
    /*知识1提交*/
    public String klSubmit() {
        KlKnowledge klKnowledge1 = klKnowledge;
        klKnowledge1.setKlTags(tags);
        klKnowledge1.setKlContent(StringUtil.deleteRNB(content1));
        klKnowledge1.setKlKind(1);
        klKnowledge1.setKlHints(0);
        klKnowledge1.setKlCollectionNumber(0);
        klKnowledge1.setKlVideoNumber(0);
        klKnowledgeService.updateKl(klKnowledge1);
        return "success";
    }

    /*知识2提交*/
    public String Kl2Submit() {
        KlKnowledge klKnowledge1 = klKnowledge;
        klKnowledge1.setKlTags(tags);
        klKnowledge1.setKlContent(StringUtil.deleteRNB(content1));
        klKnowledge1.setKlKind(2);
        klKnowledge1.setKlHints(0);
        klKnowledge1.setKlCollectionNumber(0);
        klKnowledge1.setKlAppendixNumber(0);
        Integer klId = (Integer) session.getAttribute("KlId");
        klKnowledge1.setKlId(klId);
        String urls = (String) session.getAttribute("urls");
        klKnowledge1.setKlVideoNumber(StringUtil.CountNumber(urls));
        klKnowledge1.setKlVideo(urls);
        klKnowledgeService.saveKl(klKnowledge1);
        session.removeAttribute("urls");
        session.removeAttribute("KlId");
        return "success";
    }

    /*知识3提交*/
    public String Kl3Submit() {
        KlKnowledge klKnowledge1 = klKnowledge;
        klKnowledge1.setKlTags(tags);
        klKnowledge1.setKlKind(3);
        klKnowledge1.setKlHints(0);
        klKnowledge1.setKlCollectionNumber(0);
        session.removeAttribute("KlId");

        String urls = (String) session.getAttribute("urls");
        klKnowledge1.setKlVideoNumber(StringUtil.CountNumber(urls));
        klKnowledge1.setKlVideo(urls);
        klKnowledgeService.updateKl(klKnowledge1);
        return "success";
    }




    /**
     * 附件上传
     * @return
     */
    public String fileUpload() throws Exception{
        KlKnowledge klKnowledge1 = new KlKnowledge();
        String path = request.getServletContext().getRealPath("/")+"attached/multFile/";
        String saveUrl  = request.getContextPath() + "/attached/multFile/";
        List<String> Urls = new ArrayList<String>();

        File fileUrl = new File(path); // 判断文件夹是否存在,如果不存在则创建文件夹
        if (!fileUrl.exists()) {
            fileUrl.mkdir();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        path += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(path);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }

        if(file!=null&&file.length>0){
            //循环获取file数组中得文件
            for(int i = 0;i<file.length;i++){
                File singleFile = file[i];
                FileInputStream inputStream = new FileInputStream(singleFile);
                FileOutputStream outputStream = new FileOutputStream(path  + fileFileName[i]);
                byte[] buf = new byte[1024];
                int length = 0;
                while ((length = inputStream.read(buf)) != -1) {
                    outputStream.write(buf, 0, length);
                }
                Urls.add(saveUrl + fileFileName[i]);
                inputStream.close();
                outputStream.flush();
            }
        }

        String urls = StringUtil.ConvertListToString(Urls);
        klKnowledge1.setKlAppendix(urls);
        klKnowledge1.setKlAppendixNumber(StringUtil.CountNumber(urls));
        Integer KlId = IDUtils.genIntegerId();
        klKnowledge1.setKlId(KlId);
        klKnowledgeService.saveKl(klKnowledge1);
        klKnowledge = new KlKnowledge();
        klKnowledge.setKlId(KlId);
        return "success";
    }

    public File[] getFile() {
        return file;
    }

    public void setFile(File[] file) {
        this.file = file;
    }

    public String[] getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String[] fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFilelSavePath() {
        return filelSavePath;
    }

    public void setFilelSavePath(String filelSavePath) {
        this.filelSavePath = filelSavePath;
    }

    public String[] getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String[] fileContentType) {
        this.fileContentType = fileContentType;
    }

    public KlKnowledge getKlKnowledge() {
        return klKnowledge;
    }

    public void setKlKnowledge(KlKnowledge klKnowledge) {
        this.klKnowledge = klKnowledge;
    }

    public String getContent1() {
        return content1;
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public String getTags() {

        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

}
