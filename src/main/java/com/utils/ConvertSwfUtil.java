package com.utils;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;
import java.net.ConnectException;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;

//文件转换为swf格式
public class ConvertSwfUtil {

    public ResourceBundle rb = ResourceBundle.getBundle("OpenOfficeService");
    public String OpenOffice_HOME = rb.getString("OO_HOME");
    public String host_Str = rb.getString("OO_host");
    public String port_Str = rb.getString("OO_port");
//    public String SWF_tool = rb.getString("SWF_tool");

        public String SWF_tool = System.getProperty("webapp.root") + "Resource";

    /**
     * 入口方法-通过此方法转换文件至swf格式
     *
     * @param outPutPath
     * @param filePath    上传文件所在文件夹的绝对路径
     * @param fileName    文件名称
     * @return			生成swf文件名
     */
    public String beginConvert(String outPutPath, String filePath, String fileName) {
        int tempPdf = 0;
        final String DOC = ".doc";
        final String DOCX = ".docx";
        final String XLS = ".xls";
        final String XLSX = ".xlsx";
        final String PDF = ".pdf";
        final String SWF = ".swf";
        final String TOOL = "pdf2swf.exe";//转换工具
        String outFile = "outSWFFile";
        String fileNameOnly = "";
        String fileExt = "";
        String newFileName = "";
        if (null != fileName && fileName.indexOf(".") > 0) {
            int index = fileName.indexOf(".");
            fileNameOnly = fileName.substring(0, index);//文件名
            fileExt = fileName.substring(index).toLowerCase();//文件后缀

            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
//            newFileName = sdf.format(new Date()) + fileExt;//源文件名称  =日期+后缀
            newFileName = sdf.format(new Date());//源文件名称  =日期

        }
        String inputFile = filePath;//上传文件的全路径
        String outputFile = "";
        File dir = new File(outPutPath + outFile);
        //如果目录不存在，则创建它
        if (!dir.exists()) {
            dir.mkdirs();
        }
        //如果是office文档，先转为pdf文件
        if (fileExt.equals(DOC) || fileExt.equals(DOCX) || fileExt.equals(XLS)
                || fileExt.equals(XLSX)) {
            outputFile = outPutPath + outFile + "/" + newFileName + PDF;
            System.out.println("转换时源文件路径"+inputFile + "\nout的路径" + outputFile);
            office2PDF(inputFile, outputFile);//源文件，pdf文件
            inputFile = outputFile;
            fileExt = PDF;
            tempPdf = 1;
        }

        if (fileExt.equals(PDF)) {
            String toolFile = SWF_tool + "/" + TOOL;//转化工具
            outputFile = outPutPath + outFile + "/" + newFileName + SWF;
            convertPdf2Swf(inputFile, outputFile, toolFile);
            outFile = outputFile;
            if (tempPdf == 1) {
                File file = new File(inputFile);
                file.delete();
                tempPdf = 0;
            }
        }
        return outFile;//返回一个文件路径
    }

    /**
     * 将pdf文件转换成swf文件
     * @param sourceFile pdf文件绝对路径
     * @param outFile	 swf文件绝对路径
     * @param toolFile	 转换工具绝对路径
     */
    private void convertPdf2Swf(String sourceFile, String outFile,
                                String toolFile) {
        //String command="C:/Program Files (x86)/SWFTools/pdf2swf.exe "+" -o "+swfFile.getPath()+ " -s flashversion=9 "+pdfFile.getPath()+"";
        String command = toolFile + " -t \"" + sourceFile + "\" -s flashversion=9  -o \"" + outFile +"\"";
        try {
            Process process = Runtime.getRuntime().exec(command);
            //process.waitFor();//导致当前线程等待，如有必要，一直要等到由该 Process 对象表示的进程已经终止。

            //查看是否转换成功
            //File swfFile=new File(outFile);
            //swfFile.createNewFile();

            System.out.println(loadStream(process.getInputStream()));
            System.err.println(loadStream(process.getErrorStream()));
            System.out.println(loadStream(process.getInputStream()));
            System.out.println("###--Msg: swf 转换成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * office文档转pdf文件
     * @param sourceFile	office文档绝对路径
     * @param destFile		pdf文件绝对路径
     * @return
     */
    private int office2PDF(String sourceFile, String destFile) {
        try {
            File inputFile = new File(sourceFile);
            if (!inputFile.exists()) {
                return -1; // 找不到源文件
            }
            // 如果目标路径不存在, 则新建该路径
            File outputFile = new File(destFile);
            if (!outputFile.getParentFile().exists()) {
                outputFile.getParentFile().mkdirs();
            }
            // 启动OpenOffice的服务
            String command = OpenOffice_HOME
                    + "/program/soffice.exe -headless -accept=\"socket,host="
                    + host_Str + ",port=" + port_Str + ";urp;\"" + " -nofirststartwizard ";
            //启动OpenOffice服务命令：
            //soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard

            System.out.println("###\n" + command);
            Process pro = Runtime.getRuntime().exec(command);
            // 连接openoffice服务
            OpenOfficeConnection connection = new SocketOpenOfficeConnection(
                    host_Str, Integer.parseInt(port_Str));
            connection.connect();
            // 转换
            DocumentConverter converter = new OpenOfficeDocumentConverter(
                    connection);
            converter.convert(inputFile, outputFile);//(officeFile, pdfFile);

            //查看是否pdf创建成功
//            outputFile.createNewFile();

            // 关闭连接和服务
            connection.disconnect();
            pro.destroy();

            return 0;
        } catch (FileNotFoundException e) {
            System.out.println("文件未找到！");
            e.printStackTrace();
            return -1;
        } catch (ConnectException e) {
            System.out.println("OpenOffice服务监听异常！");
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return 1;
        //0转换成功 -1找不到office源文件
    }
    static String loadStream(InputStream in) throws IOException{
        int ptr = 0;
        in = new BufferedInputStream(in);
        StringBuffer buffer = new StringBuffer();

        while ((ptr=in.read())!= -1){
            buffer.append((char)ptr);
        }
        return buffer.toString();
    }

    /**
     * 获取文件的后缀
     * @param file 附件地址
     * @return
     */
    public static String getExtname(File file) {//读取文件后缀
        String filename = file.getName();
        int pos = filename.lastIndexOf(".");//获取.之后的文件类型
        return filename.substring(pos);
    }
}
