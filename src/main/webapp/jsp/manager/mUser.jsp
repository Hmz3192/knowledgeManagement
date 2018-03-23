<%--
  Created by IntelliJ IDEA.
  User: dellpc
  Date: 2018/3/22
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>首页 - 管理员</title>
    <link rel="stylesheet" href="../../css/normalize.min.css">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/m-main.css">
    <link rel="stylesheet" href="../../css/m-user.css">
</head>
<body>

<div class="navbar navbar-default">
    <div class="navbar-header">
        <ul class="nav navbar-nav nav-list-left">
            <li><a href="#" class="navbar-brand"></a></li>
            <li><a href="#" class="navbar-name"><h3>知木知管</h3></a></li>
        </ul>
    </div>

    <ul class="nav navbar-nav">
        <li><a href="#">首页</a></li>
        <!-- <li>
            <input type="search" class="form-control search-bar" placeholder="搜一下"/>
        </li>-->
    </ul>

    <ul class="nav navbar-nav navbar-right nav-list-right">
        <li><a href="#">帮助中心</a></li>
    </ul>
</div>

<div class="block">
    <div class="box row">
        <div class="col-sm-2">
            <div class="nav-function">
                <ul class="nav nav-pills nav-stacked">
                    <li>
                        <a href="#">用户管理
                            <div><span class="glyphicon glyphicon-user"></span></div>
                        </a>
                    </li>
                    <li>
                        <a href="#">知识树修改
                            <div><span class="glyphicon glyphicon-th-list"></span></div>
                        </a>
                    </li>
                    <li>
                        <a href="#">博客管理
                            <div><span class="glyphicon glyphicon-list-alt"></span></div>
                        </a>
                    </li>
                    <li>
                        <a href="#">文档管理
                            <div><span class="glyphicon glyphicon-inbox"></span></div>
                        </a>
                    </li>
                    <li>
                        <a href="#">视频管理
                            <div><span class="glyphicon glyphicon-play-circle"></span></div>
                        </a>
                    </li>
                    <li>
                        <a href="#">资料上传
                            <div><span class="glyphicon glyphicon-upload"></span></div>
                        </a>
                    </li>
                    <li>
                        <a href="#">数据统计
                            <div><span class="glyphicon glyphicon-signal"></span></div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-10" style="padding: 0px">
            <div class="home">
                <h1>用户管理</h1>
                <hr>
                <div>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>优先级</th>
                            <th>电话</th>
                            <th>邮箱</th>
                            <th>VIP</th>
                            <th>得分</th>
                        </tr>
                        </thead>
                        <tbody id="jsonData">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="footer">
    <div class="container">
        广播电视节目制作经营许可证：（沪）字第1248号 | 网络文化经营许可证：沪网文[2013]0480-056号 | 信息网络传播视听节目许可证：0910417 | 互联网ICP备案：沪ICP备13002172号-3
        沪ICP证：沪B2-20100043 | 违法不良信息举报邮箱：help@bilibili.com | 违法不良信息举报电话：4000233233转3
        上海互联网举报中心 | 12318 全国文化市场举报网站 | 沪公网安备 31011502001911号 | 儿童色情信息举报专区
        网上有害信息举报专区： 中国互联网违法和不良信息举报中心
    </div>
</div>

<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery-3.2.1.min.js"></script>
<script src="../../js/m-user.js"></script>
<script>
    $(function () {
        $.ajax({
            type: "POST",
            url: "/userManager/findAll.mvc",
            dataType: "json",
            success: function (result) {
                listUsers(result);
            },error: function () {
                alert("操作失败！");
            }
        })
    });

    function listUsers(result) {
        var s = "";
        for (var i = 0; i < result.length; i++) {
            s +=
                "<tr>"+
                "<td>" + result[i].userId +
                "<td>" + result[i].userName +
                "<td>" + result[i].userPassword +
                "<td>" + result[i].userAvatar +
                "<td>" + result[i].userPhone +
                "<td>" + result[i].userEmail +
                "<td>" + result[i].userVip +
                "<td>" + result[i].userPoint +
                "</tr>"
            $("jsonData").append(s);
        }
    }
</script>
</body>
</html>