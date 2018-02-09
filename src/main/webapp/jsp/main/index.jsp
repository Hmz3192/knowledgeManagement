<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/2/6
  Time: 19:40
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
    <title>首页</title>
    <link rel="stylesheet" href="${path}/Resource/common/css/normalize.min.css">
    <link rel="stylesheet" href="${path}/Resource/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/Resource/common/css/main.css">
</head>
<body>

<jsp:include page="${path}/jsp/main/top.jsp"/>
<div class="block">
    <div class="box row">
        <jsp:include page="${path}/jsp/main/left.jsp"/>
        <div class="col-sm-10" style="padding: 0px">
            <div class="home">
                <div style="background-color: #ff9900;width: 99%;height: 100vw">
                    <div style="background-color: #ff9933"></div>
                    <div style="background-color: #ff9966"></div>
                </div>
                <div style="background-color: #ff9999"></div>
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



<script src="${path}/Resource/common/js/jquery-3.2.1.min.js"></script>
<script src="${path}/Resource/common/js/bootstrap.min.js"></script>
<script src="${path}/Resource/common/js/index.js"></script>
</body>
</html>
