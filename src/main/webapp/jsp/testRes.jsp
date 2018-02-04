<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/2/4
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>基于Bootstrap简单实用的tags标签插件|DEMO_jQuery之家-自由分享jQuery、html5、css3的插件库</title>
    <link rel="stylesheet" href="${path}/Resource/tag/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/Resource/tag/css/default.css">
</head>
<body>
<div class="htmleaf-container">
    <header class="htmleaf-header">
        <h1>基于Bootstrap简单实用的tags标签插件 <span>A Jquery tag input pulgin, use Bootstrap UI</span></h1>
        <div class="htmleaf-links">
            <a class="htmleaf-icon icon-htmleaf-home-outline" href="http://www.htmleaf.com/" title="jQuery之家" target="_blank"><span> jQuery之家</span></a>
            <a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="http://www.htmleaf.com/jQuery/Form/201506252104.html" title="返回下载页" target="_blank"><span> 返回下载页</span></a>
        </div>
    </header>
    <div class="htmleaf-content bgcolor-3">
        <div class="container">
            <h1>Demo</h1>
            <h2>data-toggle="tags"</h2>
            <pre>&lt;input type="text" data-toggle="tags" /&gt;</pre>
            <input type="text" data-toggle="tags" />
            <h2>$('#id').tags('initial', 'value')</h2>
            <pre>&lt;input type="text" id="id" /&gt;</pre>
            <input type="text" class="form-control" id="id" />
            <h2>$('#id').val()</h2>
            <p>value: <span id="value"></span></p>
        </div>
    </div>
</div>

<script src="${path}/Resource/tag/js/jquery.min.js" type="text/javascript"></script>
<script src="${path}/Resource/tag/js/jquery.tags.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('#id').tags('initial', 'value');
        $('#value').text($('#id').val());
        setInterval(function () {
            $('#value').text($('#id').val());
        }, 500);
    });
</script>
</body>
</html>
