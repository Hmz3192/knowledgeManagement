import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/16.
 */
public class PdfBox {

    public PdfBox() {
// TODO Auto-generated constructor stub

    }

    public void geText(String file) throws Exception {
//是否排序
        boolean sort = false;

//pdf名称
        String pdfFile = file;

//输入文本文件名称
        String textFile = null;


//设置编码方式
        String encoding = "UTF-8";

//开始提取页数
        int startPage = 1;

//结束提取页数
        int endPage = Integer.MAX_VALUE;

//文件输入流，生成文本文件
        Writer output = null;

//内存中存储的PDF Document
        PDDocument document = null;

        try {
            try {
//首先当做一个URL来装载文件，
//如果得到异常再从本地文件系统去装载文件
                URL url = new URL(pdfFile);
                document = PDDocument.load(url);

//获取PDF的文件名
                String fileName = url.getFile();

//原来的PDF名称来命名新产生的txt文件
                if (fileName.length() > 4) {
                    File outputFile = new File(fileName.substring(0, fileName.length() - 4) + ".txt");
                    textFile = outputFile.getName();
                }
            } catch (MalformedURLException r) {

//如果作为URl装载到异常则从文件系统装载
                document = PDDocument.load(pdfFile);
                if (pdfFile.length() > 4) {
                    textFile = pdfFile.substring(0, pdfFile.length() - 4) + ".txt";
                }

            }
//文件输入流，写入文件到textFile
            output = new OutputStreamWriter(new FileOutputStream(textFile), encoding);

//PDFTextStripprt来提取文件
            PDFTextStripper stripper = null;
            stripper = new PDFTextStripper();

//设置是否排序
            stripper.setSortByPosition(sort);

//设置起始页
            stripper.setStartPage(startPage);

//设置结束页
            stripper.setEndPage(endPage);

//调用PDFTextStripper的writerText提取并输出
            stripper.writeText(document, output);


        } finally {
//关闭输出流
            if (output != null)
                output.close();
        }
//关闭PDF Document
        if (document != null) {
            document.close();
        }


    }


    public static void main(String[] args) {
// TODO Auto-generated method stub
        PdfBox test = new PdfBox();
        try {
//获取E:\Lucene项目下的C语言代码.pdf的内容
            test.geText("E:/LearnIngFile/过程分析/第二组-团队作业以及学期总结/201532120120-胡明志-过程分析每周任务/第二周/work.pdf");

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

}
