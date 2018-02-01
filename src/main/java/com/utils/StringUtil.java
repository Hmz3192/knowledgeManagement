package com.utils;

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


    //替换掉回车，换行
    public static String deleteRNB(String s1) {
        String reg = "\r|\n";
        return s1.replaceAll(reg, "");
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
