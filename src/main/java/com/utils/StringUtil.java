package com.utils;

import com.lucene.ConstantParams;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.junit.Test;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
public class StringUtil {
    public List<String> allPathResult = new ArrayList<String>();

    public StringUtil(String inputPath) {
        getAllPath(inputPath);
    }

    /**
     * 递归获取文件夹下所有的文件绝对路径
     *
     * @param inputPath
     * @return
     */
    public void getAllPath(String inputPath) {

        try {
            File file = new File(inputPath);
            File[] files = file.listFiles();
            for (File f : files) {
                if (f.isDirectory()) {
                    getAllPath(f.getAbsolutePath());//递归
                } else {
//					System.out.println(f.getAbsolutePath());
                    allPathResult.add(f.getAbsolutePath());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 从文件的完整路径中，抽取其文件名称
     *
     * @param path
     * @return
     */
    public static String getFileNameFromPath(String path) {
        String result = "";
        if (isEmpty(path)) {
            return result;
        }
        if (path.contains("/")) {
            result = path.substring(path.lastIndexOf("/") + 1, path.lastIndexOf("."));
        } else if (path.contains("\\")) {
            result = path.substring(path.lastIndexOf("\\") + 1, path.lastIndexOf("."));
        } else {
            result = path;
        }
        return result;
    }

    /**
     * 读取文件内容（读到内存里面）
     *
     * @param inputPath
     * @return
     */
    public static String getContent(String inputPath) {
        String result = "";
        if (isEmpty(inputPath)) {
            return result;
        }
        try {
//            File file = new File(inputPath);
//            FileReader fr = new FileReader(file);
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(inputPath), "UTF-8"));
            String temp = "";
            while ((temp = br.readLine()) != null) {
                result += (temp + ConstantParams.CHENG_LINE);
            }
            br.close();
//            fr.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    //把逗号的string分割，如 1，2，3 --》 List(1)(2)(3)
    public static List<String> ConvertStringToList(String s1) {
        List<String> ls = new ArrayList<String>();
        String[] s2 = s1.split(",");
        ls.addAll(Arrays.asList(s2));
        return ls;
    }

    public static Integer CountNumber(String s1) {
        String[] s2 = s1.split(",");
        return s2.length;
    }

    public static String ConvertListToString(List<String> s1) {
        String ls = "";
        for (int i = 0; i < s1.size(); i++) {
            ls += "," + s1.get(i);
        }
        ls = ls.substring(1, ls.length());
        System.out.println(ls);
        return ls;
    }
    public static String shu2xie( String s1) {
        String[] s2 = s1.split("-");
        int len = s2.length;
        String s3 = "";
        for (int i = 1; i < len; i++) {
            if (i != len - 1) {
                s3 = s3 + "/" + s2[i];
            }else
                s3 = s3 + "." + s2[i];
        }
        return s3;
    }
    public static String getFileNameOnly(String s1) {
        String[] s2 = s1.split("/");
        String fileNameOnly = s2[s2.length - 1];
        return fileNameOnly;
    }




    /*public static String readDoc(String path) {
        File file = new File(path);
        String str = "";
        try {
            InputStream is = new FileInputStream(file);
            WordExtractor ex = new WordExtractor(is);
            String text = ex.getText();
//            System.out.println(text);
            str = text;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }*/
    /*public static String readDocx(String path) {
        File file = new File(path);
        String str = "";
        try {
            FileInputStream fis = new FileInputStream(file);
            XWPFDocument xdoc = new XWPFDocument(fis);
            XWPFWordExtractor extractor = new XWPFWordExtractor(xdoc);
            String doc1 = extractor.getText();
            str = doc1;
//            System.out.println(doc1);
            fis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }*/
    @Test
    public void test() {
        List<String> a = new ArrayList<String>();
        for (int i = 0; i < 5; i++) {
            a.add("//ad/fsf/" + i + ".txt");
        }
        ConvertListToString(a);
    }

    @Test
    public void test2() {
        String fileName = "/attached/multFile/20180208/浙江网新恒天软件有限公司_针对资讯的用户建模和个性推荐系统.docx";
        String[] s2 = fileName.split("/");
        String fileNameOnly = s2[s2.length - 1];
        System.out.println(fileNameOnly);
        System.out.println(fileName.substring(0, 10));
    }

    /**
     * 判断字符为空
     *
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        boolean b = false;
        if (null == str || "".equals(str)) {
            b = true;
        }
        return b;
    }

    /**
     * 判断字符不为空
     *
     * @param str
     * @return
     */
    public static boolean isNotEmpty(String str) {
        boolean b = false;
        if (null != str && !"".equals(str)) {
            b = true;
        }
        return b;
    }
    /*public static String getTextFromPdf(String filename) throws Exception {
        PDDocument document = null;
        String content = "";
        File pdfFile = new File(filename);
        try {
            document = PDDocument.load(pdfFile);

            // 获取页码
            int pages = document.getNumberOfPages();

            // 读文本内容
            PDFTextStripper stripper = new PDFTextStripper();
            // 设置按顺序输出
            stripper.setSortByPosition(true);
            stripper.setStartPage(1);
            stripper.setEndPage(pages);
            content = stripper.getText(document);
            System.out.println(content);
            document.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return content;
    }*/

    //替换掉回车，换行
    public static String deleteRNB(String s1) {
        String reg = "\r|\n|\t";
        return s1.replaceAll(reg, "");
    }

    public static String html2Text(String s1) {
        String reg = "<[^>]+>";
        String s2 = s1.replaceAll(reg, "");
        String reg2 = "\r|\n|\t";
        String s3 = s2.replaceAll(reg2, "");

        return s3.replaceAll(" ", "");
    }

    @Test
    public void test3() {
        System.out.println(html2Text("<p style=\"text-align:center;\">\n" +
                "\t我啊谁家的<strong>撒吉萨多久啊的</strong>\n" +
                "</p>\n" +
                "<p style=\"text-align:center;\">\n" +
                "\t<strong><span style=\"font-size:18px;\">撒大苏打上阿斯顿阿迪斯</span></strong>\n" +
                "</p>\n" +
                "<p style=\"text-align:center;\">\n" +
                "\t<strong><span style=\"font-size:18px;\"><img src=\"/attached/image/20180125/20180125165158_376.png\" alt=\"\" /></span><br />\n" +
                "</strong>\n" +
                "</p>\n" +
                "<p style=\"text-align:center;\">\n" +
                "\t<strong><span style=\"font-size:18px;\">阿<em><u>斯顿打撒大厦</u></em></span></strong>\n" +
                "</p>"));
    }

    public static void main(String[] args) {
        System.out.println(deleteRNB("<p style=\"text-align:center;\">\n" +
                "\t我啊谁家的<strong>撒吉萨多久啊的</strong>\n" +
                "</p>\n" +
                "<p style=\"text-align:center;\">\n" +
                "\t<strong><span style=\"font-size:18px;\">撒大苏打上阿斯顿阿迪斯</span></strong>\n" +
                "</p>\n" +
                "<p style=\"text-align:center;\">\n" +
                "\t<strong><span style=\"font-size:18px;\"><img src=\"/attached/image/20180125/20180125165158_376.png\" alt=\"\" /></span><br />\n" +
                "</strong>\n" +
                "</p>\n" +
                "<p style=\"text-align:center;\">\n" +
                "\t<strong><span style=\"font-size:18px;\">阿<em><u>斯顿打撒大厦</u></em></span></strong>\n" +
                "</p>"));
    }


    public static String getConfigParam(String params, String defaultValue, String fileName) {
        String result = "";
        if (isEmpty(fileName) || isEmpty(params)) {
            return result;
        }
        try {
            Properties properties = loadConfig(fileName);
            result = properties.getProperty(params);
            if (isEmpty(result)) {
                result = defaultValue;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 内部方法，获取Properties对象
     *
     * @param fileName
     * @return
     */
    public static Properties loadConfig(String fileName) {
        Properties properties = new Properties();
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            if (classLoader == null) {
                classLoader = StringUtil.class.getClassLoader();
            }
            InputStream is = classLoader.getResourceAsStream(fileName);
            properties.load(is);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return properties;
    }
}
