package com.utils;

import java.io.File;

public class ConstantPara {

    //flexPaper
    public static final String ServerPath = "http://localhost:8111";

    //absoultPath
    public static final String absoultPath = System.getProperty("webapp.root");

    //敏感词路径
    public static final String WordPath = "E:\\WorkSpace\\Idea\\knowledgeManagement\\src\\main\\resources\\CensorWords.txt";


    //Tree
    public static final String UPLOAD_FOLDER = System.getProperty("webapp.root") +  File.separator +"uploadFiles";

}
