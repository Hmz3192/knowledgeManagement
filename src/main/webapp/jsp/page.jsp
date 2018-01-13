<%--
  Created by IntelliJ IDEA.
  User: ZJNU-Hmz
  Date: 2018/1/13
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<s:if test="#application.pageResult == null || #application.pageResult.size() == 0">
    <h2>无数据</h2>
</s:if>
<s:else>
<table border="1px">
    <tr>
        <th style="width:20%">编号</th>
        <th style="width:20%">名称</th>
    </tr>
    <s:iterator value="#application.pageResult.rows" var="usr">
    <tr>
        <td><s:property value="#usr.id"/></td>
        <td><s:property value="#usr.user"/></td>
    </tr>
    </s:iterator>
    <tr>
        <div>
            <font size="2">共 ${application.pageResult.total} 页</font> <font
                size="2">第 ${application.pageResult.currentPage} 页</font>
            <s:if test="#application.pageResult.currentPage != 1">
            <s:url var="first" action="User_page" namespace="/method">
                <s:param name="rows" value="2"/>
                <s:param name="currentPage" value="1"/>
            </s:url>
            <s:a href="%{first}">首页</s:a>
            </s:if>


            <s:if test="#application.pageResult.currentPage - 1 > 0">
            <s:url var="lastone" action="User_page" namespace="/method">
                <s:param name="rows" value="2"/>
                <s:param name="currentPage" value="#application.pageResult.currentPage - 1"/>
            </s:url>
            <s:a href="%{lastone}">上一页</s:a>
            </s:if>

            <s:if test="#application.pageResult.currentPage + 1 <= #application.pageResult.total">
                <s:url var="nextone" action="User_page" namespace="/method">
                    <s:param name="rows" value="2"/>
                    <s:param name="currentPage" value="#application.pageResult.currentPage + 1"/>
                </s:url>
                <s:a href="%{nextone}">下一页</s:a>
            </s:if>


            <s:if test="#application.pageResult.currentPage != #application.pageResult.total">
                <s:url var="first" action="User_page" namespace="/method">
                    <s:param name="rows" value="2"/>
                    <s:param name="currentPage" value="#application.pageResult.total"/>
                </s:url>
                <s:a href="%{first}">尾页</s:a>
            </s:if>


        </div>
    </tr>
    </s:else>


</body>
</html>