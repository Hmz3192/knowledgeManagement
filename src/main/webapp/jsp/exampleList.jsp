<%--
  Created by IntelliJ IDEA.
  User: ZJNU-Hmz
  Date: 2018/1/4
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../Resource/js/jquery.js"></script>
</head>
<body>
<s:form action="Upload_upload.action"  method="post"  enctype="multipart/form-data">
    <s:token></s:token>
    <s:file name="myfile" label="选择上传文件"></s:file>
    <s:submit value="提交">123123123</s:submit>
</s:form>

<hr>
<%--<s:if test="#session.names == null || #session.names.size() == 0">
    没有任何信息
</s:if>
<s:else>
    <s:iterator value="#session.names" var="entry">
        <s:property value="#entry"/>{
        key: <s:property value="key"/>
        value:<s:property value="value"/>}|
    </s:iterator></s:else>--%>
　

</body>
</html>
