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
<!doctype html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>KindEditor JSP</title>
    <%--tags--%>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">

    <link href="${path}/Resource/uploadify/css/iconfont.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/Resource/uploadify/css/fileUpload.css" rel="stylesheet" type="text/css">
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

        .a-upload input {
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
    <script>

    </script>


</head>
<body>
<%--<%=htmlData%>--%>
<jsp:include page="${path}/jsp/main/top.jsp"/>

<div class="block">
    <div class="box row">
        <jsp:include page="${path}/jsp/main/left.jsp"/>
        <div class="col-sm-10" style="padding: 0px">
            <div class="home">
                <div style="width: 100%;margin: 0px auto">
                    <div style="float:left;width: 64%!important; margin: 1% auto;border-radius:10px;">
                        <div class="row-fluid">
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left" style="font-size: 30px;color: #000">新建知识--(类型三)</div>
                                </div>
                                <div class="block-content collapse in">
                                    <div class="span12">
                                        <form name="example" id="finishForm" method="post"
                                              action="${path}/BlogEdit_Kl3Submit.action">
                                            <input type="hidden" id="hiddenId" name="klKnowledge.klId">
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
                                                        style="border-radius:3px;border: 1px solid #c4bab5; outline:none;">
                                                    <option value="">请选择...</option>
                                                </select>
                                                &nbsp;&nbsp;
                                                <span>二级目录</span>
                                                <select class="span2 m-wrap"
                                                        style="border-radius:3px;border: 1px solid #c4bab5; outline:none;">
                                                    <option value="">请选择...</option>
                                                </select>
                                                &nbsp;&nbsp;
                                                <span>三级目录</span>
                                                <select class="span2 m-wrap"
                                                        style="border-radius:3px;border: 1px solid #c4bab5; outline:none;">
                                                    <option value="">请选择...</option>
                                                </select>
                                            </fieldset>
                                            <br>
                                            <fieldset>
                                                <legend>简介</legend>
                                                <div class="controls">
                                       <textarea class="span8" id="summary" name="klKnowledge.klIntroduction" cols="10"
                                                 rows="4"
                                                 style="resize:none;width:100%;height:50px;border-radius:5px;border: 1px solid #000; outline:none;"
                                                 placeholder="请输入简介，1-60个字"></textarea>
                                                </div>
                                            </fieldset>
                                            <br>
                                            <fieldset>
                                                <legend>标签</legend>
                                                <input type="text" class="form-control" style="width: 100px;"
                                                       name="tags" id="tags"
                                                       data-role="tagsinput" placeholder="请输入标签"/>
                                            </fieldset>
                                            <br>
                                            <!--<input type="button"  id="saveCover" class="myButton" value="保存封面" />-->
                                        </form>

                                        <div class="row-fluid">
                                            <div class="block">
                                                <div class="navbar navbar-inner block-header">
                                                    <div class="muted pull-left" style="font-size: 30px;color: #000">
                                                        视屏上传
                                                    </div>
                                                </div>
                                                <div class="collapse in">
                                                    <!--start -->
                                                    <div id="uploader">
                                                        <!--用来存放文件信息-->
                                                        <div id="thelist">
                                                            <div class="panel panel-primary">
                                                                <table class="table table-striped table-bordered"
                                                                       id="uploadTable">
                                                                    <thead>
                                                                    <tr>
                                                                        <th style="width: 5%">序号</th>
                                                                        <th style="width: 35%">文件名称</th>
                                                                        <th style="width: 10%">文件大小</th>
                                                                        <th style="width: 10%">上传状态</th>
                                                                        <th style="width: 20%">上传进度</th>
                                                                        <th style="width: 17%">操作</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody></tbody>
                                                                </table>
                                                                <div class="panel-footer">
                                                            <span style="width: 100px">
                                                            <div id="picker">选择文件</div>
                                                                </span>
                                                                    <span style="width: 100px">

                                                            <button id="btn" class="btn btn-default">开始上传</button>
                                                                </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
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
                    <div style="float:right;width: 35%!important;margin: 1% 0 0 2px;border-radius:10px;">
                        <div class="row-fluid">
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left" style="font-size: 30px;color: #000">附件上传</div>
                                </div>
                                <div class="collapse in" style="border:1px solid black">

                                    <div id="fileUploadContent" class="fileUploadContent"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${path}/Resource/tags/js/jquery-2.1.3.min.js"></script>

<script type="text/javascript" src="${path}/Resource/uploadify/js/fileUpload.js"></script>
<script type="text/javascript" src="${path}/Resource/vediouploader/webuploader.js"></script>
<script type="text/javascript" src="${path}/Resource/vediouploader/hashmap.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.min.js"></script>
<script src="http://cdn.bootcss.com/typeahead.js/0.11.1/typeahead.bundle.js"></script>
<script type="text/javascript">

    $(function () {

        var finishState = 0;
        $('input[data-role="tagsinput"]').tagsinput({
            maxTags: 5
        });

        var finishForm = document.getElementById('finishForm');
        var finish = document.getElementById('finish');
        finish.onclick = function () {
            if (finishState > 1) {
                $(window).unbind('beforeunload');
                var tags = $('input[data-role="tagsinput"]').val();
                document.getElementById("tags").value = tags;
                //验证通过，提交表单数据
                finishForm.submit();
            } else {
                alert("请先上传文件！");
                return false;
            }

        }


        $("#fileUploadContent").initUpload({
            "uploadUrl": "${path}/upload/fileUploadAction.action",//上传文件信息地址
            "progressUrl": "#",//获取进度信息地址，可选，注意需要返回的data格式如下（{bytesRead: 102516060, contentLength: 102516060, items: 1, percent: 100, startTime: 1489223136317, useTime: 2767}）
            "selfUploadBtId": "selfUploadBt",//自定义文件上传按钮id
            "isHiddenUploadBt": false,//是否隐藏上传按钮
            "isHiddenCleanBt": false,//是否隐藏清除按钮
//        "isAutoClean":true,//是否上传完成后自动清除
            "velocity": 10,//模拟进度上传数据
            //"showSummerProgress":false,//总进度条，默认限制
            //"scheduleStandard":true,//模拟进度的方式，设置为true是按总进度，用于控制上传时间，如果设置为false,按照文件数据的总量,默认为false
            //"size":350,//文件大小限制，单位kb,默认不限制
            //"maxFileNumber":3,//文件个数限制，为整数
            //"filelSavePath":"",//文件上传地址，后台设置的根目录
            //"beforeUpload":beforeUploadFun,//在上传前执行的函数
            "onUpload": onUploadFun,//在上传后执行的函数
            // autoCommit:true,//文件是否自动上传
            //"fileType":['png','jpg','docx','doc']，//文件类型限制，默认不限制，注意写的是文件后缀

        });

        function beforeUploadFun(opt) {
            opt.otherData = [{"name": "你要上传的参数", "value": "你要上传的值"}];
        }

        function onUploadFun(opt, data) {
//        alert(data);
//        uploadTools.uploadError(opt);//显示上传错误
            finishState += 1;
            var id = data.klId;
            document.getElementById("hiddenId").value = id;
        }

        function testUpload() {
            var opt = uploadTools.getOpt("fileUploadContent");
            console.info(opt);
            uploadEvent.uploadFileEvent(opt);
        }

        function getFormData1() {
            var formData = formTake.getData("myform");
            alert(JSON.stringify(formData));
        }

        function getFormData2() {
            var formData = formTake.getDataWithUploadFile("myform");
            alert(JSON.stringify(formData));
        }

        var fileMd5;
        var fileSuffix;
        var $list = $("#thelist table>tbody");
        var state = 'pending';//初始按钮状态
        var $btn = $("#btn");
        var count = 0;
        var map = new HashMap();
        //监听分块上传过程中的三个时间点
        WebUploader.Uploader.register({
            "before-send-file": "beforeSendFile",
            "before-send": "beforeSend",
            "after-send-file": "afterSendFile",
        }, {
            //时间点1：所有分块进行上传之前调用此函数
            beforeSendFile: function (file) {
                var deferred = WebUploader.Deferred();
                //1、计算文件的唯一标记，用于断点续传
                (new WebUploader.Uploader()).md5File(file, 0, 1000 * 1024 * 1024)
                    .progress(function (percentage) {
                        $('#' + file.id).find("td.state").text("正在读取文件信息...");
                    }).then(function (val) {
                    fileMd5 = val;
                    $('#' + file.id).find("td.state").text("成功获取文件信息...");
                    //获取文件信息后进入下一步
                    deferred.resolve();
                });
                return deferred.promise();
            },
            //时间点2：如果有分块上传，则每个分块上传之前调用此函数
            beforeSend: function (block) {
                var deferred = WebUploader.Deferred();

                $.ajax({
                    type: "POST",
                    url: "${path}/video?action=checkChunk",
                    data: {
                        //文件唯一标记
                        fileMd5: fileMd5,
                        //当前分块下标
                        chunk: block.chunk,
                        //当前分块大小
                        chunkSize: block.end - block.start
                    },
                    dataType: "json",
                    success: function (response) {
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
            afterSendFile: function () {
                //如果分块上传成功，则通知后台合并分块
                $.ajax({
                    type: "POST",
                    url: "${path}/video?action=mergeChunks",
                    data: {
                        fileMd5: fileMd5,
                        fileSuffix: fileSuffix,
                    },
                    success: function (response) {
//                    alert("上传成功");
                        finishState += 1;
                    }
                });
            }
        });

        var uploader = WebUploader
            .create({
                // swf文件路径
                swf: '${path}/Resource/vediouploader/Uploader.swf',
                // 文件接收服务端。
                server: '${path}/uploadvedio',
                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: {
                    id: '#picker',//这个id是你要点击上传文件的id
                    multiple: true
                },
                // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                resize: true,
                auto: false,
                //开启分片上传
                chunked: true,
                chunkSize: 1000 * 1024 * 1024,

                accept: {
                    extensions: "rm,rmvb,wmv,avi,mp4,3gp,mkv,flv",
                    mimeTypes: '.rm,.rmvb,wmv,.avi,.mp4,.3gp,.mkv,.flv'
                }
            });

        // 当有文件被添加进队列的时候
        uploader.on('fileQueued', function (file) {
            //保存文件扩展名
            fileSuffix = file.ext;
            var fileSize = file.size;
            var fileSizeStr = "";
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
            fileSizeStr = WebUploader.Base.formatSize(fileSize);
            count++;
            $list.append(
                '<tr id="' + file.id + '" class="item" flag=0>' +
                '<td class="index">' + count + '</td>' +
                '<td class="info">' + file.name + '</td>' +
                '<td class="size">' + fileSizeStr + '</td>' +
                '<td class="state">等待上传...</td>' +
                '<td class="percentage"></td>' +
                '<td class="operate"><button name="upload" class="btn btn-warning">开始</button><button name="delete" class="btn btn-error">删除</button></td></tr>');
            map.put(file.id + "", file);
        });

        // 文件上传过程中创建进度条实时显示。
        uploader.on('uploadProgress', function (file, percentage) {
            $('#' + file.id).find('td.percentage').text(
                '上传中 ' + Math.round(percentage * 100) + '%');
        });

        uploader.on('uploadSuccess', function (file) {
            $('#' + file.id).find('td.state').text('已上传');
        });

        uploader.on('uploadError', function (file) {
            $('#' + file.id).find('td.state').text('上传出错');
        });

        uploader.on('uploadComplete', function (file) {
            uploader.removeFile(file);
        });


        uploader.on('all', function (type) {
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

        $btn.on('click', function () {
            if (state === 'uploading') {
                uploader.stop(true);
            } else {
                uploader.upload();
            }
        });

        $("body").on("click", "#uploadTable button[name='upload']", function () {
            flag = $(this).parents("tr.item").attr("flag") ^ 1;
            $(this).parents("tr.item").attr("flag", flag);
            var id = $(this).parents("tr.item").attr("id");
            if (flag == 1) {
                $(this).text("暂停");
                uploader.upload(uploader.getFile(id, true));

            } else {
                $(this).text("开始");
                //uploader.stop(true);
                uploader.stop(uploader.getFile(id, true));
                //uploader.skipFile(file);
                //uploader.removeFile(file);
                //uploader.getFile(id,true);
            }
        });

        $("body").on("click", "#uploadTable button[name='delete']", function () {
            var id = $(this).parents("tr.item").attr("id");
            $(this).parents("tr.item").remove();
            uploader.removeFile(uploader.getFile(id, true));
            map.remove(id);
        });

    });
    $(window).bind('beforeunload', function () {
            return '您输入的内容尚未保存，确定离开此页面吗？';
        }
    );
</script>
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
