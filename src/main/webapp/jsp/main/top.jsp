<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/2/9
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${path}/Resource/common/css/normalize.min.css">
    <link rel="stylesheet" href="${path}/Resource/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/Resource/common/css/main.css">
</head>
<body>
<div class="navbar navbar-default" style="margin-bottom: 10px">
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
</body>
</html>
