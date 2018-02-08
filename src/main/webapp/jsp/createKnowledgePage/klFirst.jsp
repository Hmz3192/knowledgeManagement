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

    <link href="${path}/Resource/uploadify/css/iconfont.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/Resource/uploadify/css/fileUpload.css" rel="stylesheet" type="text/css">
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
    </style>
</head>
<body>
<%--<%=htmlData%>--%>
<div style="width: 90%;margin: 0px auto">
    <div style="float:left;width: 65%!important; margin: 3% auto;border-radius:10px;">

        <div class="row-fluid">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left" style="font-size: 30px;color: #000">新建知识--(类型一)</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <form name="example" id="finishForm" method="post" action="${path}/method/BlogEdit_klSubmit.action">
                            <input type="hidden" id="hiddenId" name="klKnowledge.klId" >
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
                            <br>
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
                            <fieldset>
                                <input type="button" id="finish" class="myButton" name="finish" value="发布"/>
                                <%--<input type="button" id="save" class="myButton" value="保存" name="getHtml"/>--%>
                            </fieldset>
                                <!--<input type="button"  id="saveCover" class="myButton" value="保存封面" />-->
                        </form>
                    </div>
                </div>

            </div>

            <br>
        </div>
        <%--      <form name="example" method="post" action="${path}/method/User_tocreate1">
                  <textarea name="content1"
                            style="width:50%;height:700px;visibility:hidden;margin: 5px"><%=htmlspecialchars(htmlData)%></textarea>
                  <br/>
                  <input type="submit" name="button" value="提交内容"/> (提交快捷键: Ctrl + Enter)
              </form>--%>
    </div>

    <div style="float:right;width: 35%!important;margin: 3% auto;border-radius:10px;">
        <div class="row-fluid">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left" style="font-size: 30px;color: #000">附件上传</div>
                </div>
                <div class="collapse in" style="border:1px solid black">

                    <div id="fileUploadContent" class="fileUploadContent"></div>

                    <%--<button onclick="testUpload()">提交</button>--%>
                    <%--<form action="" enctype="multipart/form-data">
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
    </div>
</div>
<%--kindeditor--%>
<script charset="utf-8" src="${path}/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${path}/kindeditor/lang/zh-CN.js"></script>

<script type="text/javascript" src="${path}/Resource/uploadify/js/fileUpload.js"></script>



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
                    K('input[name=getHtml]').click(function (e) {
                        var tags = $('input[data-role="tagsinput"]').val();
                        alert(tags);
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


        $("#fileUploadContent").initUpload({
            "uploadUrl":"${path}/upload/fileUploadAction.action",//上传文件信息地址
            "progressUrl":"#",//获取进度信息地址，可选，注意需要返回的data格式如下（{bytesRead: 102516060, contentLength: 102516060, items: 1, percent: 100, startTime: 1489223136317, useTime: 2767}）
            "selfUploadBtId":"selfUploadBt",//自定义文件上传按钮id
            "isHiddenUploadBt":false,//是否隐藏上传按钮
            "isHiddenCleanBt":false,//是否隐藏清除按钮
//            "isAutoClean":false,//是否上传完成后自动清除
            "velocity":10,//模拟进度上传数据
            //"showSummerProgress":false,//总进度条，默认限制
            //"scheduleStandard":true,//模拟进度的方式，设置为true是按总进度，用于控制上传时间，如果设置为false,按照文件数据的总量,默认为false
            //"size":350,//文件大小限制，单位kb,默认不限制
            //"maxFileNumber":3,//文件个数限制，为整数
            //"filelSavePath":"",//文件上传地址，后台设置的根目录
            //"beforeUpload":beforeUploadFun,//在上传前执行的函数
            "onUpload":onUploadFun,//在上传后执行的函数
//         autoCommit:true,//文件是否自动上传
            "fileType":['png','jpg','docx','doc'],//文件类型限制，默认不限制，注意写的是文件后缀

        });

        function beforeUploadFun(opt){
            opt.otherData =[{"name":"你要上传的参数","value":"你要上传的值"}];
        }
        function onUploadFun(opt,data){
//        alert(data.klId);
//        uploadTools.uploadError(opt);//显示上传错误
            finishState = 1;
            var id = data.klId;
            document.getElementById("hiddenId").value = id;
//        alert(document.getElementById("hiddenId").value);
        }
        function testUpload(){
            var opt = uploadTools.getOpt("fileUploadContent");
            console.info(opt);
            uploadEvent.uploadFileEvent(opt);
        }

        function getFormData1(){
            var formData = formTake.getData("myform");
            alert(JSON.stringify(formData));
        }
        function getFormData2(){
            var formData = formTake.getDataWithUploadFile("myform");
            alert(JSON.stringify(formData));
        }
    });
    $(window).bind('beforeunload',function(){
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
