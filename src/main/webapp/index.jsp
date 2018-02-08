<%--
  Created by IntelliJ IDEA.
  User: ZJNU-Hmz
  Date: 2017/12/30
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<s:form action="Page_login" namespace="/method" method="post">
    <s:token></s:token>
    <s:textfield name="user" label="name"/>
    <%--<s:textfield name="password" label="password"></s:textfield>--%>
        <s:submit/>
</s:form>

<s:form action="Page_page" namespace="/method" method="post">
    <s:textfield name="currentPage" label="currentPage"/>
    <s:textfield name="rows" label="rows"/>
    <%--<s:textfield name="password" label="password"></s:textfield>--%>
    <s:submit/>
</s:form>
    <s:a namespace="/method" action="Upload_toUpload">toUploadPage</s:a>
    <br>
<s:a namespace="/method" action="Page_toLoad">toLoadPage</s:a>
<br>


<s:a namespace="/method" action="Page_tocreate1">create1</s:a>    <br>

<s:a namespace="/method" action="Page_tocreate2">create2</s:a>    <br>

<s:a namespace="/method" action="Page_tocreate3">create3</s:a>
<br>
<s:a namespace="/method" action="Page_toKlDetail">toKlDetail</s:a>



</body>
</html>
