package com.utils;

import com.pojo.TestPagemodel;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;

import javax.xml.ws.spi.http.HttpContext;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FileUtil {


    //获取下载文件夹下所有文件
    public void getAllNames(String inputPath) {
        try {
            File file = new File(inputPath);
            File[] files = file.listFiles();
            for (File f : files) {
                if (f.isDirectory()) {
                    getAllNames(f.getAbsolutePath());//递归
                } else {
//                    testPagemodels.add(new TestPagemodel(f.getName(), ConstantPara.ServerPath + "/uploadFile/inFile" + f.getName()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    //获取下载文件夹下所有文件
    public static List<String> getCurrenFileNames(String inputPath) {
        List<String> names = new ArrayList<>();
        try {
            File file = new File(inputPath);
            File[] files = file.listFiles();
            for (File f : files) {
                if (f.isDirectory()) {
//                    getAllNames(f.getAbsolutePath());//递归
                    continue;
                } else {
                    names.add(f.getName());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return names;
    }

}
