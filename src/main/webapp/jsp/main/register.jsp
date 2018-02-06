<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/2/6
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="${path}/Resource/common/css/normalize.min.css">
    <link rel="stylesheet" href="${path}/Resource/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/Resource/common/css/main.css">
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
        <li><a href="#">登录</a></li>
        <li><a href="#">注册</a></li>
        <li><a href="#">帮助中心</a></li>
    </ul>
</div>


<div class="main-form">
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>

            <div class="col-md-6">
                <div class="form-f">
                    <h1>
                        注册
                        <small>没有账号？<a href="10.注册页.html">注册</a></small>
                    </h1>
                    <form>
                        <div class="form-group">
                            <label>手机</label>
                            <input id="id_r" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>验证码</label>
                            <div class="input-group">
                                <input id="key_r" type="text" class="form-control">
                                <div class="input-group-btn">
                                    <div class="btn btn-default">获取验证码</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input id="pw_r" type="password" class="form-control">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block" onclick="Register">注册</button>
                        </div>
                        <div class="form-group">
                            注册即代表您同意<a href="#">服务条款</a>
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

<script src="${path}/Resource/common/js/bootstrap.min.js"></script>
<script src="${path}/Resource/common/js/jquery-3.2.1.min.js"></script>

</body>
</html>