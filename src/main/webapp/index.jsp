<%--
  Created by IntelliJ IDEA.
  User: ZJNU-Hmz
  Date: 2017/12/30
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/User_login" method="post">
        <input name="name" type="text">
        <input name="password" type="text">
        <input type="submit" value="ok">
    </form>
</body>
</html>
