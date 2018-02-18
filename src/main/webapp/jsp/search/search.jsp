<!--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/2/16
  Time: 16:07
  To change this template use File | Settings | File Templates.
-->
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
    <td><!--${kl.klTitle}--></td>
    <td><!--${kl.klIntroduction}--></td>
    <td><!--${kl.klContent}--></td>
    <td>${kl.klTags}</td>
    <td><!--${kl.klAppendix}--></td>
    <td><!--${kl.klVideo}--></td>
    <td>${kl.klHints}</td>
    <td>${kl.klCollectionNumber}</td>
    <td>${kl.klConnectIds}</td>
    <td>${kl.klParentFileId}</td>
    <td>${kl.klCheckState}</td>
    <td><button>查看正文</button><button>查看附件</button>
        <button>查看视屏</button><button>敏感词检测</button>
        <c:if test="${kl.klCheckState == 0}">
        <button><a href="${path}/addIndex/${kl.klId}.mvc">审核通过</a></button>
        </c:if>
    </td>
    </tr>
    </c:forEach>
</table>


<br>
<br>
<br>
<br>
<div align="center">
    <form action="${path}/search.mvc" method="post">
<input name="queryString" type="text" /> <input type="submit">搜索</input>
    </form>
    <hr>

    <br>
    <div style="width:800px;height:1000px;text-align:left">
        <c:forEach  items="${requestScope.searchList}" var="map">
            <div style="width:798px;height:100px;padding:5px 0px 5px 0px;;font-size:14px;border:1px #BFDCE8 solid">
                <font style="family:Arial Narrow;color:blue;size:3pt">
                        ${map.klTitle }</font><br>
                <font style="size:10px">
                        ${map.klIntro }
                </font><br>
                <font style="size:10px">
                        ${map.klContent }...
                </font><br>
            </div>
            <div style="width:800px;height:10px;">

            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
