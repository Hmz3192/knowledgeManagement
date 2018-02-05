package com.utils;

import com.pojo.TestPagemodel;
import org.apache.struts2.ServletActionContext;

import javax.xml.ws.spi.http.HttpContext;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FileUtil {

    //    public Map<String, String> nameUrl = new HashMap<>();
    public List<TestPagemodel> testPagemodels = new ArrayList<TestPagemodel>();
    public FileUtil(String inputPath) {
        getAllNames(inputPath);
    }

    //获取下载文件夹下所有文件
    public void getAllNames(String inputPath) {
        try {
            File file = new File(inputPath);
            File[] files = file.listFiles();
            for (File f : files) {
                if (f.isDirectory()) {
                    getAllNames(f.getAbsolutePath());//递归
                } else {
                    testPagemodels.add(new TestPagemodel(f.getName(), ConstantPara.ServerPath + "/uploadFile/inFile" + f.getName()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

}
