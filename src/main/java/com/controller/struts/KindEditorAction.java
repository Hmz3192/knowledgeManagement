package com.controller.struts;

import com.opensymphony.xwork2.ActionContext;
import com.utils.EditorUtils;
import com.utils.SuperAction;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.expression.TypeComparator;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.utils.EditorUtils.getError;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/5.
 * 这是kindeditor插件保存图片的方法，里面最好不要再新加别的内容了
 */


@ParentPackage("json-default")
@Namespace("/editor")
@Controller
@Scope("prototype")
public class KindEditorAction extends SuperAction {
    private File imgFile;
    private String imgFileFileName;
    private String imgFileContentType;
    private Map<String, Object> result;




    @Action(value = "image_upload", results = { @Result(name = "success", type = "json",params = {"root", "result"}) })
    public String imageUpload() {
        System.out.println("文件：" + imgFile);
        System.out.println("文件名：" + imgFileFileName);
        System.out.println("文件类型：" + imgFileContentType);

        String savePath = request.getServletContext().getRealPath("/") + "attached/kindEditor/";
        String saveUrl  = request.getContextPath() + "/attached/kindEditor/";

        //定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

        if(!ServletFileUpload.isMultipartContent(request)){
            result = getError("请选择文件。");
            context.getContext().getValueStack().push(result);
            return SUCCESS;
        }
        //检查目录
        File uploadDir = new File(savePath);
        if(!uploadDir.isDirectory()){
            result = getError("上传目录不存在。");
            context.getContext().getValueStack().push(result);
            return SUCCESS;
        }
        //检查目录写权限
        if(!uploadDir.canWrite()){
            result = getError("上传目录没有写权限。");
            context.getContext().getValueStack().push(result);
            return SUCCESS;
        }


        String dirName = request.getParameter("dir");
        if (dirName == null) {
            dirName = "image";
        }


        if(!extMap.containsKey(dirName)){
            result = getError("目录名不正确。");
            context.getContext().getValueStack().push(result);
            return SUCCESS;
        }

        //创建文件夹
        savePath += dirName + "\\";
        saveUrl += dirName + "\\";
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        savePath += ymd + "\\";
        saveUrl += ymd + "\\";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        //检查扩展名
        String fileExt = imgFileFileName.substring(imgFileFileName.lastIndexOf(".") + 1).toLowerCase();
        if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
            result = getError("上传文件扩展名是不允许的扩展名。只允许" + extMap.get(dirName) + "格式。");
            context.getContext().getValueStack().push(result);
            return SUCCESS;
        }


        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
        try{
            File uploadedFile = new File(savePath + "/" + newFileName);
            FileUtils.copyFile(imgFile, uploadedFile);
        }catch(Exception e){
            result = getError("上传文件失败。");
            context.getContext().getValueStack().push(result);
            return SUCCESS;
        }

        // 通知浏览器文件上传成功
        result= new HashMap<String, Object>();
        result.put("error", 0);
        result.put("url", saveUrl + newFileName); // 返回相对路径
        context.getContext().getValueStack().push(result);
        return SUCCESS;
    }

    @Action(value = "image_manage", results = { @Result(name = "success", type = "json",params = {"root", "result"}) })
    public String imageManage() {
        //根目录路径，可以指定绝对路径，比如 /var/www/attached/
        String rootPath = request.getServletContext().getRealPath("/") + "attached/kindEditor/";
        //根目录URL，可以指定绝对路径，比如 http://www.yoursite.com/attached/
        String rootUrl  = request.getContextPath() + "/attached/kindEditor/";
        //图片扩展名
        String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};

        String dirName = request.getParameter("dir");
        if (dirName != null) {
            if(!Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dirName)){
                return "Invalid Directory name.";
            }
            rootPath += dirName + "/";
            rootUrl += dirName + "/";
            File saveDirFile = new File(rootPath);
            if (!saveDirFile.exists()) {
                saveDirFile.mkdirs();
            }
        }
        //根据path参数，设置各路径和URL
        String path = request.getParameter("path") != null ? request.getParameter("path") : "";
        String currentPath = rootPath + path;
        String currentUrl = rootUrl + path;
        String currentDirPath = path;
        String moveupDirPath = "";
        if (!"".equals(path)) {
            String str = currentDirPath.substring(0, currentDirPath.length() - 1);
            moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
        }

        //排序形式，name or size or type
        String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

        //不允许使用..移动到上一级目录
        if (path.indexOf("..") >= 0) {
            return "Access is not allowed.";
        }
        //最后一个字符不是/
        if (!"".equals(path) && !path.endsWith("/")) {
            return "Parameter is not valid.";
        }
        //目录不存在或不是目录
        File currentPathFile = new File(currentPath);
        if(!currentPathFile.isDirectory()){
            return "Directory does not exist.";
        }

        //遍历目录取的文件信息
        List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
        if(currentPathFile.listFiles() != null) {
            for (File file : currentPathFile.listFiles()) {
                Hashtable<String, Object> hash = new Hashtable<String, Object>();
                String fileName = file.getName();
                if(file.isDirectory()) {
                    hash.put("is_dir", true);
                    hash.put("has_file", (file.listFiles() != null));
                    hash.put("filesize", 0L);
                    hash.put("is_photo", false);
                    hash.put("filetype", "");
                } else if(file.isFile()){
                    String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                    hash.put("is_dir", false);
                    hash.put("has_file", false);
                    hash.put("filesize", file.length());
                    hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
                    hash.put("filetype", fileExt);
                }
                hash.put("filename", fileName);
                hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
                fileList.add(hash);
            }
        }

        if ("size".equals(order)) {
            Collections.sort(fileList, new EditorUtils.SizeComparator());
        } else if ("type".equals(order)) {
            Collections.sort(fileList, new EditorUtils.TypeComparator());
        } else {
            Collections.sort(fileList, new EditorUtils.NameComparator());
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("moveup_dir_path", moveupDirPath);
        result.put("current_dir_path", currentDirPath);
        result.put("current_url", currentUrl);
        result.put("total_count", fileList.size());
        result.put("file_list", fileList);
        context.getContext().getValueStack().push(result);

        return SUCCESS;
    }


    public Map<String, Object> getResult() {
        return result;
    }

    public void setResult(Map<String, Object> result) {
        this.result = result;
    }

    public void setImgFile(File imgFile) {
        this.imgFile = imgFile;
    }

    public void setImgFileFileName(String imgFileFileName) {
        this.imgFileFileName = imgFileFileName;
    }

    public void setImgFileContentType(String imgFileContentType) {
        this.imgFileContentType = imgFileContentType;
    }

    public File getImgFile() {
        return imgFile;
    }

    public String getImgFileFileName() {
        return imgFileFileName;
    }

    public String getImgFileContentType() {
        return imgFileContentType;
    }


}
