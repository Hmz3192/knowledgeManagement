package com.utils;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
public class StringUtil {

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
        for(int i = 0 ;i<s1.size();i++) {
            ls += "," + s1.get(i);
        }
        ls = ls.substring(1,ls.length());
        System.out.println(ls);
        return ls;
    }

    public static String getFileNameOnly(String s1) {
        String[] s2 = s1.split("/");
        String fileNameOnly = s2[s2.length-1];
        return fileNameOnly;
    }

    @Test
    public void test() {
        List<String> a = new ArrayList<String>();
        for(int i = 0 ;i<5;i++) {
            a.add("//ad/fsf/" + i + ".txt");
        }
        ConvertListToString(a);
    }

    @Test
    public void test2() {
        String fileName = "/attached/multFile/20180208/浙江网新恒天软件有限公司_针对资讯的用户建模和个性推荐系统.docx";
        String[] s2 = fileName.split("/");
        String fileNameOnly = s2[s2.length-1];
        System.out.println(fileNameOnly);

    }

    //替换掉回车，换行
    public static String deleteRNB(String s1) {
        String reg = "\r|\n";
        return s1.replaceAll(reg, "");
    }

    public static String html2Text(String s1) {
        String reg = "<[^>]+>";
        return s1.replaceAll(reg, "");
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
}
