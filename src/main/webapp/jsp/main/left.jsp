<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/2/9
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${path}/Resource/common/css/normalize.min.css">
    <link rel="stylesheet" href="${path}/Resource/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/Resource/common/css/main.css">
    <style>
        .klbt {
            background-color: transparent;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            border: 2px dashed #4e4845;
            display: inline-block;
            cursor: pointer;
            color: #010304;
            background-color: #fff;
            font-family: Arial;
            font-size: 22px;
            font-weight: bold;
            padding: 6px 29px;
            text-decoration: none;
            font-size: 20px;
            align-items: center;
            width: 33%;
            height: 30vw;
        }

        .klbt:hover {
            background-color: #ff9966;
            color: #fff;
            border: 1px solid #fff;
        }

        .klbt:active {
            position: relative;
            top: 1px;
        }
    </style>
</head>
<body>
<div class="col-sm-2" style="padding: 0px;height: 100vw">
    <div class="nav-function">
        <ul class="nav nav-pills nav-stacked">
            <li class="dropdown">
                <a href="#">新建知识
                    <div><span class="glyphicon glyphicon-chevron-right"></span></div>
                </a>
                <ul class="dropdown-content dropdown-menu">
                    <li>
                        <a href="#ThreeKind" data-toggle="modal">新建博客</a>
                    </li>
                    <li>
                        <a href="#">新建视频</a>
                    </li>
                    <li>
                        <a href="#">新建文件</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#">知识树
                    <div><span class="glyphicon glyphicon-chevron-right"></span></div>
                </a>
                <ul class="dropdown-content dropdown-menu">
                    <li>
                        <a href="${path}/Page_totree.action">查看知识树</a>
                    </li>
                    <li>
                        <a href="#">修改知识树</a>
                    </li>
                </ul>
            </li>

        </ul>
    </div>
</div>

<div class="modal fade" id="ThreeKind" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 70vw">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新建知识
                </h4>
            </div>
            <div class="modal-body">
                <div id="button1" class="klbt" style="margin: 0 auto">
                    <p >知识类型一</p>
                    <h4 style="margin-top: 25px">适用于上传多附件以及说明文档的知识</h4>
                    <div style="margin: auto 0;height: 70%; text-align: center;" >
                        <i class="glyphicon glyphicon-file" style="top: 50%;float: left;font-size: 400%"></i>
                        <i class=" glyphicon glyphicon-plus" style="top: 50%;float: none;font-size: 200%"></i>
                        <i class="glyphicon glyphicon-folder-open" style="top: 50%;float: right;font-size: 400%"></i>
                    </div>

                </div>
                <div id="button2" class="klbt">
                    <p>知识类型二</p>
                    <h4 style="margin-top: 25px">适用于上传多视频以及说明文档的知识</h4>
                    <div style="margin: auto 0;height: 70%; text-align: center;" >
                        <i class="glyphicon glyphicon-file" style="top: 50%;float: left;font-size: 400%"></i>
                        <i class=" glyphicon glyphicon-plus" style="top: 50%;float: none;font-size: 200%"></i>
                        <i class="glyphicon glyphicon-facetime-video" style="top: 50%;float: right;font-size: 400%"></i>
                    </div>
                </div>
                <div id="button3" class="klbt">
                    <p>知识类型三</p>
                    <h4 style="margin-top: 25px">适用于上传多视频以及多附件的知识</h4>
                    <div style="margin: auto 0;height: 70%; text-align: center;" >
                        <i class="glyphicon glyphicon-folder-open" style="top: 50%;float: left;font-size: 400%"></i>
                        <i class=" glyphicon glyphicon-plus" style="top: 50%;float: none;font-size: 200%"></i>
                        <i class="glyphicon glyphicon-facetime-video" style="top: 50%;float: right;font-size: 400%"></i>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script src="${path}/Resource/common/js/jquery-3.2.1.min.js"></script>
<script src="${path}/Resource/common/js/bootstrap.min.js"></script>
<script src="${path}/Resource/common/js/index.js"></script>
<script type="text/javascript">
    $(function () {
        var bt1 = document.getElementById('button1');
        var bt2 = document.getElementById('button2');
        var bt3 = document.getElementById('button3');

        bt1.onclick = function (e) {
//            alert("1");
            window.location.href = "${path}/Page_tocreate1.action";
        };
        bt2.onclick = function (e) {
//            alert("2");
            window.location.href = "${path}/Page_tocreate2.action";

        };
        bt3.onclick = function (e) {
//            alert("31");
            window.location.href = "${path}/Page_tocreate3.action";

        }

    });

</script>
</body>
</html>
