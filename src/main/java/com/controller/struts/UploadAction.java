package com.controller.struts;

import com.opensymphony.xwork2.ModelDriven;
import com.pojo.FileAttri;
import com.utils.ConstantPara;
import com.utils.FileUtil;
import com.utils.SuperAction;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import com.utils.ConvertSwfUtil;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

public class UploadAction extends SuperAction implements ModelDriven<FileAttri> {
    private FileAttri fileModel = new FileAttri();

    public String toUpload() {
        return "forwardToUpload";
    }

    /*预览用的上传文件*/
/*
    public String upload() {
        */
/*获得绝对路径 *//*

        String path = request.getServletContext().getRealPath("/") + "uploadFile";
        File dir = new File(path + File.separator + fileModel.getSavePath());
        System.out.println(path);
        //如果目录不存在，则创建它
        if (!dir.exists()) {
            dir.mkdirs();
        }
        //给上传的文件重命名
        String newFileName;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String extname = ConvertSwfUtil.getExtname(new File(fileModel.getMyfileFileName()));

        newFileName = sdf.format(new Date()) + extname;//源文件名称  =日期+后缀

//        newPath=path+File.separator+newFileName;//源文件路径
        fileModel.setNewPath(path + File.separator + fileModel.getSavePath() + File.separator + newFileName);

        System.out.println("\n文件名:" + newFileName + "\n新路径:" + fileModel.getNewPath());

        //创建输入流
        FileInputStream fins = null;//读取文件
        try {
            fins = new FileInputStream(fileModel.getMyfile());
            //创建输出流
            FileOutputStream fous = new FileOutputStream(new File(path + File.separator + fileModel.getSavePath(), newFileName));
            //设置缓冲区
            byte[] buffer = new byte[4096];
            int len = -1;
            while ((len = fins.read(buffer)) != -1) {
                fous.write(buffer, 0, len);
            }
            fous.flush();//刷新缓冲区
            fous.close();
            fins.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String outPath = new ConvertSwfUtil().beginConvert(path, fileModel.getSavePath(), newFileName);
        System.out.println("生成swf文件:" + outPath);
        File swfFile = new File(outPath);
//        swfPath = swfFile.getName();
        fileModel.setSwfPath(swfFile.getName());
        session.setAttribute("swfPath", fileModel.getSwfPath());
//		swfPath=outPath;
        return "forwardToLook";
    }
*/


    public FileAttri getModel() {
        return fileModel;
    }

}
