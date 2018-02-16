<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/2/16
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1px" >
    <tr>
        <th>id</th>
        <th>用户编号</th>
        <th>知识类型</th>
        <th>知识标题</th>
        <th>知识介绍</th>
        <th>知识内容</th>
        <th>知识tags</th>
        <th>附件</th>
        <th>视屏</th>
        <th>点击量</th>
        <th>收藏量</th>
        <th>关联id</th>
        <th>文件路径</th>
        <th>审核状态</th>
        <th>操作</th>
    </tr>
    <c:forEach var="kl" items="${requestScope.Knowledges}" >
    <tr>
    <td>${kl.klId}</td>
    <td>${kl.userId}</td>
    <td>${kl.klKind}</td>
    <td><%--${kl.klTitle}--%></td>
    <td><%--${kl.klIntroduction}--%></td>
    <td><%--${kl.klContent}--%></td>
    <td>${kl.klTags}</td>
    <td><%--${kl.klAppendix}--%></td>
    <td><%--${kl.klVideo}--%></td>
    <td>${kl.klHints}</td>
    <td>${kl.klCollectionNumber}</td>
    <td>${kl.klConnectIds}</td>
    <td>${kl.klParentFileId}</td>
    <td>${kl.klCheckState}</td>
    <td><button>查看正文</button><button>查看附件</button><button>查看视屏</button><button>敏感词检测</button><button>审核通过</button></td>
    </tr>
    </c:forEach>
</table>


<br>
<br>
<br>
<br>
<div align="center">
<input name="keywords" type="text" /> <button>搜索</button>
</div>
</body>
</html>
