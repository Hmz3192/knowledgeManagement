package com.controller;

import com.utils.SuperAction;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/5.
 */
public class BlogEditController extends SuperAction{

    private File[] file;            //文件
    private String[] fileFileName;  //文件名
    private String[] filePath;        //文件路径
    private String downloadFilePath;  //文件下载路径
    private InputStream inputStream;


    /**
     * 文件上传
     * @return
     */
    public String fileUpload() {
        String path = request.getServletContext().getRealPath("/")+"attached/multFile/";
        File file = new File(path); // 判断文件夹是否存在,如果不存在则创建文件夹
        if (!file.exists()) {
            file.mkdir();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        path += ymd + "\\";
        File dirFile = new File(path);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        try {
            if (this.file != null) {
                File f[] = this.getFile();
                filePath = new String[f.length];
                for (int i = 0; i < f.length; i++) {
                    String name =  fileFileName[i]; // 保存在硬盘中的文件名

                    FileInputStream inputStream = new FileInputStream(f[i]);
                    FileOutputStream outputStream = new FileOutputStream(path
                            + "/" + name);
                    byte[] buf = new byte[1024];
                    int length = 0;
                    while ((length = inputStream.read(buf)) != -1) {
                        outputStream.write(buf, 0, length);
                    }
                    inputStream.close();
                    outputStream.flush();
                    // 文件保存的完整路径
                    // 比如：D:\tomcat6\webapps\struts_ajaxfileupload\\upload\a0be14a1-f99e-4239-b54c-b37c3083134a.png
                    filePath[i] = path + "/" + name;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }
    /**
     * 附件下载
     * @return
     */
    public String downloadFile(){
        String path = downloadFilePath;
        HttpServletResponse response = ServletActionContext.getResponse();
        try {
            // path是指欲下载的文件的路径。
            File file = new File(path);
            // 取得文件名。
            String filename = file.getName();
            // 取得文件的后缀名。
            String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
            // 以流的形式下载文件。
            InputStream fis = new BufferedInputStream(new FileInputStream(path));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            //清空response
            response.reset();
            //设置response的Header
            String filenameString = new String(filename.getBytes("gbk"),"iso-8859-1");
            response.addHeader("Content-Disposition", "attachment;filename=" + filenameString);
            response.addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return null;
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

    public String[] getFilePath() {
        return filePath;
    }

    public void setFilePath(String[] filePath) {
        this.filePath = filePath;
    }

    public String getDownloadFilePath() {
        return downloadFilePath;
    }

    public void setDownloadFilePath(String downloadFilePath) {
        this.downloadFilePath = downloadFilePath;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
