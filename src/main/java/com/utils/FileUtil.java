package com.utils;

import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.rtf.RtfWriter2;
import org.junit.Test;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

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


    public static String EnterContent2Word(String title, String intro, String content) {
        String finalUrl = "";
        return finalUrl;
    }


    @Test
    public void test() {
        deleteDir(new File("E:\\WorkSpace\\Idea\\knowledgeManagement\\src\\main\\webapp\\index"));
    }
    public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            //递归删除目录中的子目录下
            for (int i=0; i<children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }




    public static void exportDoc(String myTitle,String myIntro,String myContent,String path) throws DocumentException, IOException {

        // 设置纸张大小
        Document document = new Document(PageSize.A4);

        // 建立一个书写器(Writer)与document对象关联，通过书写器(Writer)可以将文档写入到磁盘中
        // ByteArrayOutputStream baos = new ByteArrayOutputStream();
        String filePath = path + "/introduction.doc";
        File file = new File(filePath);
        RtfWriter2.getInstance(document, new FileOutputStream(file));
        document.open();
        // 设置中文字体
        BaseFont bfChinese = BaseFont.createFont(BaseFont.HELVETICA,
                BaseFont.WINANSI, BaseFont.NOT_EMBEDDED);
        // 标题字体风格
        Font titleFont = new Font(bfChinese, 12, Font.BOLD);
        // // 正文字体风格
        Font contextFont = new Font(bfChinese, 10, Font.NORMAL);
        Paragraph title = new Paragraph(myTitle);
        // 设置标题格式对齐方式
        title.setAlignment(Element.ALIGN_CENTER);
        title.setFont(titleFont);
        document.add(title);
        //介绍
        Paragraph intro = new Paragraph(myIntro);
        // 正文格式左对齐
        intro.setAlignment(Element.ALIGN_LEFT);
        intro.setFont(contextFont);
        // 离上一段落（标题）空的行数
        intro.setSpacingBefore(5);
        // 设置第一行空的列数
        intro.setFirstLineIndent(20);
        document.add(intro);

        //正文
        Paragraph context = new Paragraph(myContent);


        // // 利用类FontFactory结合Font和Color可以设置各种各样字体样式
       /*  Paragraph underline = new Paragraph("下划线的实现", FontFactory.getFont(
         FontFactory.HELVETICA_BOLDOBLIQUE, 18, Font.UNDERLINE,
         new Color(0, 0, 255)));*/
        //
//         document.add(underline);
        // // 添加图片 Image.getInstance即可以放路径又可以放二进制字节流

//        Image img = Image.getInstance("E:\\WorkSpace\\Idea\\knowledgeManagement\\src\\main\\webapp\\attached\\kindEditor\\image\\20180208\\20180208095326_474.jpg");

//        img.setAbsolutePosition(0, 0);

//        img.setAlignment(Image.LEFT);// 设置图片显示位置

        //
        // img.scaleAbsolute(60, 60);// 直接设定显示尺寸
        //
        // // img.scalePercent(50);//表示显示的大小为原尺寸的50%
        //
        // // img.scalePercent(25, 12);//图像高宽的显示比例
        //
        // // img.setRotation(30);//图像旋转一定角度
        //
//        document.add(img);

        document.close();

        // 得到输入流
//         wordFile = new ByteArrayInputStream(baos.toByteArray());
//         baos.close();

    }





}
