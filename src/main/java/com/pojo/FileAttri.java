package com.pojo;

import java.io.File;

public class FileAttri {
    private File myfile;// 与upload中文件选择器的名称保持一致
    private String myfileFileName;// 用于获取上传文件类型
    private String myfileContentType;//用于获取文件类型
    private String savePath = "inFile";// 文件保存路径,这里直接指定了文件的上传的地址
    private String newPath;//上传后的路径
    private String newFileName;//文件名
    private String swfPath;


    public String getNewPath() {
        return newPath;
    }
    public void setNewPath(String newPath) {
        this.newPath = newPath;
    }
    public String getNewFileName() {
        return newFileName;
    }
    public void setNewFileName(String newFileName) {
        this.newFileName = newFileName;
    }
    public File getMyfile() {
        return myfile;
    }
    public void setMyfile(File myfile) {
        this.myfile = myfile;
    }
    public String getMyfileFileName() {
        return myfileFileName;
    }
    public void setMyfileFileName(String myfileFileName) {
        this.myfileFileName = myfileFileName;
    }
    public String getMyfileContentType() {
        return myfileContentType;
    }
    public void setMyfileContentType(String myfileContentType) {
        this.myfileContentType = myfileContentType;
    }
    public String getSavePath() {
        return savePath;
    }
      public void setSwfPath(String swfPath) {
        this.swfPath = swfPath;
    }
    public String getSwfPath() {
        return swfPath;
    }
}
