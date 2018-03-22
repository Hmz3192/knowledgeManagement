<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2018/3/22
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="../css/normalize.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/main.css">
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
</div>


<div class="main-form">
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>

            <div class="col-md-6">
                <div class="form-f">
                    <h1>
                        管理员登录
                    </h1>
                    <form>
                        <div class="form-group">
                            <label>用户名/手机/邮箱</label>
                            <input  id="id_l" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input id="pw_l" type="password" class="form-control">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block" onclick="Login">登录</button>
                        </div>
                        <div class="form-group">
                            <a href="#">忘了密码？</a>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-md-3"></div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="container">
        广播电视节目制作经营许可证：（沪）字第1248号 | 网络文化经营许可证：沪网文[2013]0480-056号 | 信息网络传播视听节目许可证：0910417 | 互联网ICP备案：沪ICP备13002172号-3 沪ICP证：沪B2-20100043 | 违法不良信息举报邮箱：help@bilibili.com | 违法不良信息举报电话：4000233233转3
        上海互联网举报中心 | 12318 全国文化市场举报网站 | 沪公网安备 31011502001911号 | 儿童色情信息举报专区
        网上有害信息举报专区： 中国互联网违法和不良信息举报中心
    </div>
</div>

<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.2.1.min.js"></script>
<script>
    $(function() {
        $.ajax({
            type:"POST",
            url:"",
            dataType:"json",
            success:function (result) {
                var dataObj = result,
                con = "";
                $.each(dataObj,function (index,item) {
                    con += ""

                })

            }
        })
    })
</script>
</body>
</html>
