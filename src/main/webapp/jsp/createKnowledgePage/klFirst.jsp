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

    </style>
    <script>
        $(function () {
            var editor1;
            $('input[data-role="tagsinput"]').tagsinput({
                maxTags: 5
            });

            KindEditor.ready(function (K) {
                editor1 = K.create('textarea[name="content1"]', {
                    cssPath: '${path}/kindeditor/plugins/code/prettify.css',
                    uploadJson: '${path}/editor/image_upload',
                    fileManagerJson: '${path}/editor/image_manage',
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
                    }
                });
                prettyPrint();
            });
        });

    </script>


</head>
<body>
<%=htmlData%>
<div style="width: 90%;margin: 0px auto">
    <div style="float:left;width: 65%!important; margin: 3% auto;border-radius:10px;">

        <div class="row-fluid">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left" style="font-size: 30px;color: #000">新建知识</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <form name="example" method="post" action="${path}/method/User_tocreate1">
                            <fieldset>
                                <legend>标题</legend>
                                <div class="controls">
                                    <input type="text"
                                           id="title"
                                           name="title"
                                           style="width:30%;border-radius:5px;border: 1px solid #000; outline:none;"
                                           maxlength="30"
                                           placeholder="请输入标题，1-30个字">
                                </div>
                            </fieldset>
                            <br>
                            <fieldset>
                                <legend>简介</legend>
                                <div class="controls">
                                    <c:if test="${articlePO.article.articleSummary != null}">
                                       <textarea class="span8" id="summary" name="summary" cols="10" rows="4"
                                                 style="resize:none;width:100%;height:50px;border-radius:5px;border: 1px solid #000; outline:none;"
                                                 placeholder="请输入简介，1-60个字">${articlePO.article.articleSummary}</textarea>
                                    </c:if>
                                    <c:if test="${articlePO.article.articleSummary == null}">
                                       <textarea class="span8" id="summary" name="summary" cols="10" rows="4"
                                                 style="resize:none;width:100%;height:50px;border-radius:5px;border: 1px solid #000; outline:none;"
                                                 placeholder="请输入简介，1-60个字"></textarea>
                                    </c:if>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>内容</legend>
                                <textarea name="content1"
                                          style="width:100%;height:700px;visibility:hidden;margin: 5px"><%=htmlspecialchars(htmlData)%></textarea>
                            </fieldset>
                            <br>
                            <fieldset>
                                <legend>标签</legend>
                                <input type="text" class="form-control" style="width: 100px;" name="tags" id="tags"
                                       data-role="tagsinput" placeholder="请输入标签"/>
                            </fieldset>
                            <!--<input type="submit" name="butto
                            <fieldset>
                                <input type="button" id="finish" class="myButton" name="finish" value="发布"/>
                                <input type="button" id="save" class="myButton" value="保存" name="getHtml"/>
                                <!--<input type="button"  id="saveCover" class="myButton" value="保存封面" />-->

                            </fieldset>
                        </form>
                    </div>
                </div>

            </div>
            n" value="提交内容"/> (提交快捷键: Ctrl + Enter)-->
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
                    <form action="" enctype="multipart/form-data">
                        <input type="file" id="file1" name="file" /><a id="add" href="javascript:void();" onclick="addFile();">添加</a>
                        <span>
				<table id="down">
				</table>
			</span>
                        </br>
                        <input type="button" onclick="fileUpload();" value="上传">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--kindeditor--%>
<script charset="utf-8" src="${path}/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${path}/kindeditor/lang/zh-CN.js"></script>

<%--uploadFile--%>
<script type="text/javascript" src="${path}/Resource/uploadify/js/ajaxfileupload.js"></script>
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
                for(var i=0;i<data.fileFileName.length;i++){
                    $("#down").after("<tr><td height='25'>"+fileNames[i]+"</td><td><a href='downloadFile?downloadFilePath="+filePaths[i]+"'>下载</a></td></tr>")
                }
            }
        })
    }
    $(function() {

    })
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
