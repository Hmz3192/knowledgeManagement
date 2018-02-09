<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/2/9
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!doctype html>
<html lang="en" data-ng-app="FileManagerApp">
<head>
    <!--
      * Angular FileManager v1.4.4 (https://github.com/joni2back/angular-filemanager)
      * Jonas Sciangula Street <joni2back@gmail.com>
      * Licensed under MIT (https://github.com/joni2back/angular-filemanager/blob/master/LICENSE)
    -->
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>在线文件管理</title>

    <!-- third party -->
    <script src="${path}/bower_components/angular/angular.min.js"></script>
    <script src="${path}/bower_components/angular-translate/angular-translate.min.js"></script>
    <script src="${path}/bower_components/angular-cookies/angular-cookies.min.js"></script>
    <script src="${path}/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="${path}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${path}/bower_components/bootswatch/paper/bootstrap.min.css"/>

    <link href="${path}/bower_components/jquery-uploadfile/css/uploadfile.css" rel="stylesheet">
    <script src="${path}/bower_components/jquery-uploadfile/js/jquery.uploadfile.js"></script>
    <script type="text/javascript" src="${path}/bower_components/jquery-qrcode/jquery.qrcode.min.js"></script>

    <!-- Uncomment if you need to use raw source code-->
    <script type="text/javascript">
        var extraObj;
        var serverAddresses;
        $.get("getServerUrl",function(data,status){
            serverAddresses = eval(data);
        });
    </script>
    <script src="${path}/src/js/app.js" type="text/javascript"></script>
    <script src="${path}/src/js/filters/filters.js" type="text/javascript"></script>
    <script src="${path}/src/js/providers/config.js" type="text/javascript"></script>
    <script src="${path}/src/js/entities/chmod.js" type="text/javascript"></script>
    <script src="${path}/src/js/entities/item.js" type="text/javascript"></script>
    <script src="${path}/src/js/directives/directives.js" type="text/javascript"></script>
    <script src="${path}/src/js/services/filenavigator.js" type="text/javascript"></script>
    <script src="${path}/src/js/services/fileuploader.js" type="text/javascript"></script>
    <script src="${path}/src/js/providers/translations.js" type="text/javascript"></script>
    <script src="${path}/src/js/controllers/main.js" type="text/javascript"></script>
    <script src="${path}/src/js/controllers/selector-controller.js" type="text/javascript"></script>
    <script src="${path}/bower_components/custom/js/custom.js" type="text/javascript" type="text/javascript"></script>

    <link href="${path}/src/css/animations.css" rel="stylesheet">
    <link href="${path}/src/css/dialogs.css" rel="stylesheet">
    <link href="${path}/src/css/main.css" rel="stylesheet">
    <link href="${path}/bower_components/custom/css/style.css" rel="stylesheet">

    <!-- Comment if you need to use raw source code -->
    <!--<link href="dist/angular-filemanager.min.css" rel="stylesheet">
    <script src="dist/angular-filemanager.min.js"></script>-->
    <!-- /Comment if you need to use raw source code -->
</head>

<body class="ng-cloak">
<angular-filemanager></angular-filemanager>
</body>
</html>


