<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/2/5
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>KindEditor JSP</title>
    <link rel="stylesheet" href="${path}/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${path}/kindeditor/plugins/code/prettify.css"/>

    <script charset="utf-8" src="${path}/kindeditor/plugins/code/prettify.js"></script>


    <%--tags--%>
    <script type="text/javascript" src="${path}/Resource/tags/js/jquery.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.min.js"></script>
    <script src="http://cdn.bootcss.com/typeahead.js/0.11.1/typeahead.bundle.js"></script>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${path}/Resource/vediouploader/webuploader.css">

    <style type="text/css">
        .icon-github {
            width: 16px;
            height: 16px;
        }

        .bootstrap-tagsinput {
            width: 100%;
        }

        .accordion {
            margin-bottom: -3px;
        }

        .accordion-group {
            border: none;
        }

        .twitter-typeahead .tt-query,
        .twitter-typeahead .tt-hint {
            margin-bottom: 0;
        }

        .twitter-typeahead .tt-hint {
            display: none;
        }

        .tt-menu {
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 1000;
            display: none;
            float: left;
            min-width: 160px;
            padding: 5px 0;
            margin: 2px 0 0;
            list-style: none;
            font-size: 14px;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border: 1px solid rgba(0, 0, 0, 0.15);
            border-radius: 4px;
            -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
            background-clip: padding-box;
            cursor: pointer;
        }

        .tt-suggestion {
            display: block;
            padding: 3px 20px;
            clear: both;
            font-weight: normal;
            line-height: 1.428571429;
            color: #333333;
            white-space: nowrap;
        }

        .tt-suggestion:hover,
        .tt-suggestion:focus {
            color: #ffffff;
            text-decoration: none;
            outline: 0;
            background-color: #428bca;
        }

        .row-fluid {
            width: 100%;
            *zoom: 1
        }

        .row-fluid:before, .row-fluid:after {
            display: table;
            line-height: 0;
            content: ""
        }

        .row-fluid:after {
            clear: both
        }

        .navbar {
            *position: relative;
            *z-index: 2;
            margin-bottom: 20px;
            overflow: visible
        }

        .navbar-inner {
            min-height: 40px;
            padding-right: 20px;
            padding-left: 20px;
            background-color: #fafafa;
            background-image: -moz-linear-gradient(top, #fff, #f2f2f2);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fff), to(#f2f2f2));
            background-image: -webkit-linear-gradient(top, #fff, #f2f2f2);
            background-image: -o-linear-gradient(top, #fff, #f2f2f2);
            background-image: linear-gradient(to bottom, #fff, #f2f2f2);
            background-repeat: repeat-x;
            border: 1px solid #d4d4d4;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#fff2f2f2', GradientType=0);
            *zoom: 1;
            -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
            -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065)
        }

        .navbar-inner:before, .navbar-inner:after {
            display: table;
            line-height: 0;
            content: ""
        }

        .navbar-inner:after {
            clear: both
        }

        .muted {
            color: #999
        }

        .collapse {
            position: relative;
            height: 0;
            overflow: hidden;
            -webkit-transition: height .35s ease;
            -moz-transition: height .35s ease;
            -o-transition: height .35s ease;
            transition: height .35s ease
        }

        .collapse.in {
            height: auto
        }

        /*bootstrap-tagsinput 样式*/
        .bootstrap-tagsinput {
            background-color: #fff;
            border: 1px solid #ccc;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            display: inline-block;
            padding: 5px 6px;
            color: #555;
            vertical-align: middle;
            border-radius: 4px;
            width: 100%;
            line-height: 22px;
            cursor: text;
        }

        .bootstrap-tagsinput input {
            border: none;
            box-shadow: none;
            outline: none;
            background-color: transparent;
            padding: 0;
            margin: 0;
            width: auto !important;
            max-width: inherit;
        }

        .bootstrap-tagsinput input:focus {
            border: none;
            box-shadow: none;
        }

        .bootstrap-tagsinput .tag {
            margin-right: 2px;
            color: white;
            font-size: 100%;
        }

        .bootstrap-tagsinput .tag [data-role="remove"] {
            margin-left: 8px;
            cursor: pointer;
        }

        .bootstrap-tagsinput .tag [data-role="remove"]:after {
            content: "x";
            padding: 0px 2px;
        }

        .bootstrap-tagsinput .tag [data-role="remove"]:hover {
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .bootstrap-tagsinput .tag [data-role="remove"]:hover:active {
            box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        }

        .myButton {
            background-color: transparent;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            border: 1px solid #eb675e;
            display: inline-block;
            cursor: pointer;
            color: #eb675e;
            background-color: #fff;
            font-family: Arial;
            font-size: 22px;
            font-weight: bold;
            padding: 6px 29px;
            text-decoration: none;
            font-size: 20px;
            align-items: center;
            margin-left: 15px;
            margin-right: 20px;
        }

        .myButton:hover {
            background-color: #eb675e;
            color: #fff;
            border: 1px solid #fff;
        }

        .myButton:active {
            position: relative;
            top: 1px;
        }
        /*a  upload */
        .a-upload {
            padding: 4px 10px;
            height: 20px;
            line-height: 20px;
            position: relative;
            cursor: pointer;
            color: #888;
            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            display: inline-block;
            *display: inline;
            *zoom: 1
        }

        .a-upload  input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            cursor: pointer
        }

        .a-upload:hover {
            color: #444;
            background: #eee;
            border-color: #ccc;
            text-decoration: none
        }
        #picker {
            display: inline-block;
            line-height: 1.428571429;
            vertical-align: middle;
            margin: 0 12px 0 0;
        }
    </style>
</head>
<body>
<%--<%=htmlData%>--%>
<div style="width: 90%;margin: 0px auto">
    <div style="width: 70%!important; margin: 3% auto;border-radius:10px;">

        <div class="row-fluid">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left" style="font-size: 30px;color: #000">新建知识--(类型二)</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <form name="example"  id="finishForm" method="post" action="${path}/method/BlogEdit_Kl2Submit.action">
                            <fieldset>
                                <legend>标题</legend>
                                <div class="controls">
                                    <input type="text"
                                           id="title"
                                           name="klKnowledge.klTitle"
                                           style="width:30%;border-radius:5px;border: 1px solid #000; outline:none;"
                                           maxlength="30"
                                           placeholder="请输入标题，1-30个字">
                                </div>
                            </fieldset>
                            <br>
                            <fieldset>
                                <legend>存放目录</legend>
                                <span>一级目录</span>
                                <select class="span2 m-wrap"
                                        style="border-radius:3px;border: 1px solid #c4bab5; outline:none;" >
                                    <option value="">请选择...</option>
                                </select>
                                &nbsp;&nbsp;
                                <span>二级目录</span>
                                <select class="span2 m-wrap"
                                        style="border-radius:3px;border: 1px solid #c4bab5; outline:none;" >
                                    <option value="">请选择...</option>
                                </select>
                                &nbsp;&nbsp;
                                <span>三级目录</span>
                                <select class="span2 m-wrap"
                                        style="border-radius:3px;border: 1px solid #c4bab5; outline:none;" >
                                    <option value="">请选择...</option>
                                </select>
                            </fieldset>
                            <br>
                            <fieldset>
                                <legend>简介</legend>
                                <div class="controls">
                                       <textarea class="span8" id="summary" name="klKnowledge.klIntroduction" cols="10" rows="4"
                                                 style="resize:none;width:100%;height:50px;border-radius:5px;border: 1px solid #000; outline:none;"
                                                 placeholder="请输入简介，1-60个字"></textarea>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>内容</legend>
                                <textarea name="content1" id="content1"
                                          style="width:100%;height:700px;visibility:hidden;margin: 5px"><%=htmlspecialchars(htmlData)%></textarea>
                            </fieldset>
                            <br>
                            <fieldset>
                                <legend>标签</legend>
                                <input type="text" class="form-control" style="width: 100px;" name="tags" id="tags"
                                       data-role="tagsinput" placeholder="请输入标签"/>
                            </fieldset>
                            <br>
                            <!--<input type="button"  id="saveCover" class="myButton" value="保存封面" />-->
                        </form>
                        <div class="row-fluid">
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left" style="font-size: 30px;color: #000">视屏上传</div>
                                </div>
                                <div class="collapse in" >
                                    <!--start -->
                                    <div id="uploader" >
                                        <!--用来存放文件信息-->
                                        <div id="thelist" >
                                            <div class="panel panel-primary">
                                                <table class="table table-striped table-bordered" id="uploadTable">
                                                    <thead>
                                                    <tr>
                                                        <th style="width: 5%">序号</th>
                                                        <th style="width: 40%">文件名称</th>
                                                        <th style="width: 8%">文件大小</th>
                                                        <th style="width: 10%">上传状态</th>
                                                        <th style="width: 20%">上传进度</th>
                                                        <th style="width: 17%">操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody></tbody>
                                                </table>
                                                <div class="panel-footer">
                                                            <span style="width: 100px">
                                                            <div id="picker" >选择文件</div>
                                                                </span>
                                                    <span style="width: 100px">

                                                            <button  id="btn" class="btn btn-default">开始上传</button>
                                                                </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- <form action="" enctype="multipart/form-data">
                                                            <input type="file" id="file1"  name="file" />
                                                            <a id="add" href="javascript:void(0);" onclick="addFile();">添加</a>
                                                            <span>
                                                    <table id="down">
                                                    </table>
                                                </span>
                                                            </br>


                                                            <input type="button" onclick="fileUpload();" value="上传">
                                                        </form>--%>
                                </div>
                            </div>
                        </div>
                        <fieldset>
                            <input type="button" id="finish" class="myButton" name="finish" value="发布"/>
                            <%--<input type="button" id="save" class="myButton" value="保存" name="getHtml"/>--%>
                        </fieldset>
                    </div>
                </div>

            </div>

            <br>
        </div>
    </div>


</div>
<%--kindeditor--%>
<script charset="utf-8" src="${path}/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${path}/kindeditor/lang/zh-CN.js"></script>


<script type="text/javascript" src="${path}/Resource/vediouploader/webuploader.js"></script>
<script type="text/javascript" src="${path}/Resource/vediouploader/hashmap.js"></script>
<script type="text/javascript">

    $(function () {
        var editor1,finishState = 0;
        $('input[data-role="tagsinput"]').tagsinput({
            maxTags: 5
        });

        KindEditor.ready(function (K) {
            editor1 = K.create('textarea[name="content1"]', {
                cssPath: '${path}/kindeditor/plugins/code/prettify.css',
                uploadJson: '${path}/editor/image_upload.action',
                fileManagerJson: '${path}/editor/image_manage.action',
                allowFileManager: true,
                resizeType: 0,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        document.forms['example'].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        document.forms['example'].submit();
                    });

                    var finishForm = document.getElementById('finishForm');
                    var finish = document.getElementById('finish');
                    finish.onclick = function(){
                        if(finishState == 1) {
                            $(window).unbind('beforeunload');
                            var  content1 = editor1.html(),
                                tags = $('input[data-role="tagsinput"]').val();
                            document.getElementById("content1").value=content1;
                            document.getElementById("tags").value=tags;
                            //验证通过，提交表单数据
                            finishForm.submit();
                        }else
                        {
                            alert("请先上传文件！");
                            return false;
                        }

                    }

                }
            });
            prettyPrint();
        });


        var fileMd5;
        var fileSuffix;
        var $list=$("#thelist table>tbody");
        var state = 'pending';//初始按钮状态
        var $btn=$("#btn");
        var count=0;
        var map=new HashMap();
        //监听分块上传过程中的三个时间点
        WebUploader.Uploader.register({
            "before-send-file" : "beforeSendFile",
            "before-send" : "beforeSend",
            "after-send-file" : "afterSendFile",
        }, {
            //时间点1：所有分块进行上传之前调用此函数
            beforeSendFile : function(file) {
                var deferred = WebUploader.Deferred();
                //1、计算文件的唯一标记，用于断点续传
                (new WebUploader.Uploader()).md5File(file, 0, 1000 * 1024 * 1024)
                    .progress(function(percentage) {
                        $('#' + file.id).find("td.state").text("正在读取文件信息...");
                    }).then(function(val) {
                    fileMd5 = val;
                    $('#' + file.id).find("td.state").text("成功获取文件信息...");
                    //获取文件信息后进入下一步
                    deferred.resolve();
                });
                return deferred.promise();
            },
            //时间点2：如果有分块上传，则每个分块上传之前调用此函数
            beforeSend : function(block) {
                var deferred = WebUploader.Deferred();

                $.ajax({
                    type : "POST",
                    url : "${path}/video?action=checkChunk",
                    data : {
                        //文件唯一标记
                        fileMd5 : fileMd5,
                        //当前分块下标
                        chunk : block.chunk,
                        //当前分块大小
                        chunkSize : block.end - block.start
                    },
                    dataType : "json",
                    success : function(response) {
                        if (response.ifExist) {
                            //分块存在，跳过
                            deferred.reject();
                        } else {
                            //分块不存在或不完整，重新发送该分块内容
                            deferred.resolve();

                        }
                    }
                });

                this.owner.options.formData.fileMd5 = fileMd5;
                deferred.resolve();
                return deferred.promise();
            },
            //时间点3：所有分块上传成功后调用此函数
            afterSendFile : function() {
                //如果分块上传成功，则通知后台合并分块
                $.ajax({
                    type : "POST",
                    url : "${path}/video?action=mergeChunks",
                    data : {
                        fileMd5 : fileMd5,
                        fileSuffix:fileSuffix,
                    },
                    success : function(response) {
                        finishState = 1;
                    }
                });
            }
        });

        var uploader = WebUploader
            .create({
                // swf文件路径
                swf : '${path}/Resource/vediouploader/Uploader.swf',
                // 文件接收服务端。
                server : '${path}/uploadvedio',
                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick : {
                    id : '#picker',//这个id是你要点击上传文件的id
                    multiple : true
                },
                // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                resize : true,
                auto : false,
                //开启分片上传
                chunked : true,
                chunkSize : 1000 * 1024 * 1024,

                accept : {
                    extensions : "rm,rmvb,wmv,avi,mp4,3gp,mkv,flv",
                    mimeTypes : '.rm,.rmvb,wmv,.avi,.mp4,.3gp,.mkv,.flv'
                }
            });

        // 当有文件被添加进队列的时候
        uploader.on('fileQueued', function(file) {
            //保存文件扩展名
            fileSuffix=file.ext;
            var fileSize=file.size;
            var fileSizeStr="";
            /* if(fileSize/1024<1024){
             fileSize=fileSize/1024;
             fileSizeStr=fileSize.toFixed(2)+"KB";
             }else if(fileSize/1024/1024<1024){
             fileSize=fileSize/1024/1024;
             fileSizeStr=fileSize.toFixed(2)+"MB";
             }else if(fileSize/1024/1024/1024<1024){
             fileSize=fileSize/1024/1024/1024;
             fileSizeStr=fileSize.toFixed(2)+"GB";
             }else{
             fileSize=fileSize/1024/1024/1024/1024;
             fileSizeStr=fileSize.toFixed(2)+"T";
             } */
            fileSizeStr=WebUploader.Base.formatSize(fileSize);
            count++;
            $list.append(
                '<tr id="' + file.id + '" class="item" flag=0>'+
                '<td class="index">' + count + '</td>'+
                '<td class="info">' + file.name + '</td>'+
                '<td class="size">' + fileSizeStr + '</td>'+
                '<td class="state">等待上传...</td>'+
                '<td class="percentage"></td>'+
                '<td class="operate"><button name="upload" class="btn btn-warning">开始</button><button name="delete" class="btn btn-error">删除</button></td></tr>');
            map.put(file.id+"",file);
        });

        // 文件上传过程中创建进度条实时显示。
        uploader.on('uploadProgress', function(file, percentage) {
            $('#' + file.id).find('td.percentage').text(
                '上传中 ' + Math.round(percentage * 100) + '%');
        });

        uploader.on('uploadSuccess', function(file) {
            $('#' + file.id).find('td.state').text('已上传');
        });

        uploader.on('uploadError', function(file) {
            $('#' + file.id).find('td.state').text('上传出错');
        });

        uploader.on('uploadComplete', function(file) {
            uploader.removeFile(file);
        });


        uploader.on('all', function(type) {
            if (type === 'startUpload') {
                state = 'uploading';
            } else if (type === 'stopUpload') {
                state = 'paused';
            } else if (type === 'uploadFinished') {
                state = 'done';
            }

            if (state === 'uploading') {
                $btn.text('暂停上传');
            } else {
                $btn.text('开始上传');
            }
        });

        $btn.on('click', function(){
            if (state === 'uploading'){
                uploader.stop(true);
            } else {
                uploader.upload();
            }
        });

        $("body").on("click","#uploadTable button[name='upload']",function(){
            flag=$(this).parents("tr.item").attr("flag")^1;
            $(this).parents("tr.item").attr("flag",flag);
            var id=$(this).parents("tr.item").attr("id");
            if(flag==1){
                $(this).text("暂停");
                uploader.upload(uploader.getFile(id,true));

            }else{
                $(this).text("开始");
                //uploader.stop(true);
                uploader.stop(uploader.getFile(id,true));
                //uploader.skipFile(file);
                //uploader.removeFile(file);
                //uploader.getFile(id,true);
            }
        });

        $("body").on("click","#uploadTable button[name='delete']",function(){
            var id=$(this).parents("tr.item").attr("id");
            $(this).parents("tr.item").remove();
            uploader.removeFile(uploader.getFile(id,true));
            map.remove(id);
        });
    });

    $(window).bind('beforeunload',function(){
            return '您输入的内容尚未保存，确定离开此页面吗？';
        }
    );
</script>
<%--uploadFile--%>
<%--<script type="text/javascript" src="${path}/Resource/uploadify/js/ajaxfileupload.js"></script>
<script type="text/javascript">
    //添加附件
    function addFile(){
        var fileLength = $("input[name=file]").length+1;
        var inputFile = "<div id='addFile"+fileLength+"'><input type='file' id='file"+fileLength+"' name='file' />"
            +"<a href='javascript:void();' onclick='delFile("+fileLength+");'>删除</a></div>";
        $("#add").after(inputFile);
    }
    //删除附件
    function delFile(id){
        $("#addFile"+id).remove();
    }
    function fileUpload() {
        var files = "";
        //获取所有 <input type="file" id="file1" name="file" /> 的ID属性值
        $("input[name=file]").each(function(){
            files = files + $(this).attr("id")+",";
        })
        files = files.substring(0,files.length-1);
        console.info(typeof(files));
        $.ajaxFileUpload( {
            url : '${path}/upload/fileUploadAction',     //用于文件上传的服务器端请求地址
            secureuri : false,            //一般设置为false
            fileElementId : files,        //文件上传空间的id属性  <input type="file" id="file" name="file" />
            dataType : 'json',            //返回值类型 一般设置为json
            success : function(data, status) {
                var fileNames = data.fileFileName; //返回的文件名
                var filePaths = data.filePath;     //返回的文件地址
                /*for(var i=0;i<data.fileFileName.length;i++){
                    $("#down").after("<tr><td height='25'>"+fileNames[i]+"</td><td><a href='downloadFile?downloadFilePath="+filePaths[i]+"'>下载</a></td></tr>")
                }*/
            }
        })
    }
</script>--%>
</body>
</html>
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>
