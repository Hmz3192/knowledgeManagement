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
    <script type="text/javascript">
        $(function () {
            //按钮单击时执行
            $("#testAjax").click(function () {
                //Ajax调用处理
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/json/Upload_listFile",
                    success: function (data) {
                        alert("ok");
                    }
                });
            });
        });
    </script>
</head>
<body>
<s:form action="Upload_upload" namespace="/method" method="post" enctype="multipart/form-data">
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
　
<div id="table" align="center"></div>  <!--用于显示数据的div-->
<div id="page" class="page"></div>  <!--div的class要设置成引入的css文件中的.page-->
<script type="text/javascript">
    var url = "${pageContext.request.contextPath}/json/Upload_listFile";
    var $table = $("<table border='2px' id='a' width='300px' height='200px'></table>");
    var $tr = $("<tr display='none'></tr>");
    var $td = $("<td>编号</td><td>姓名</td><td>url</td><td>操作</td>");
    $tr.append($td);
    $table.append($tr);
    var datas = null;      //datas,options一定要设置为全局变量,发现不设置成全局,没法使用插件
    var options = null;
    var pagelistcount = 6; //每页显示数据个数
    //    var maxentries = 50;   //要显示的数据总量,未进行传递
    $.ajax({
        url: url,
        type: "GET",
        data: null,
        dataType: "json",
        success: function (backdata) {
            datas = backdata;
            var a = eval(backdata);
            options = {
                "id": "page",     //----显示页码的元素(数据放在哪里)---->上面的div标签
                "data": datas,   //-----返回的数据---->json形式
                "maxshowpageitem": 10,//-----最多显示的页码个数
                "pagelistcount": pagelistcount,//-----每页显示数据个数,下面的callback是每个分页插件都有的回调函数
                "callBack": function (result) {  //----result表示处理好的数据集,比如你设置了pagelistcount为6,那么result就有6条数据
                    $("#table").append($table);
                    //遍历生成表格并插入数据
                    $.each(result, function (index, emp) {
                        $tr = $("<tr></tr>");
                        $table.append($tr);
                        for (var i = 0; i <= 4; i++) {
                            $td = $("<td></td>");
                            $tr.append($td);
                        }
                        var $tr = $("table tr");
                        //解决多生成表格的问题--->总数50,每页6条,最后一页不足6条,这样解决多生成表格的问题
                        if ($tr.size() > result.length) {
                            $("table tr:gt(" + result.length + ")").remove();
                        }
                        var $td = $tr.eq(index + 1).find("td");
                        var info = $(result).get(index);
                        var $empId = $td.eq(0).text(index);
                        var $empName = $td.eq(1).text(info.name)
                        var $salary = $td.eq(2).text(info.url);
//                        var $dept = $td.eq(3).text(info.dept.deptName);
                        var $action = $td.eq(4).html("<a href=${update}?empId=" + info.empId + ">修改</a>&nbsp;&nbsp;<a id ='del" + info.empId + "' href='#'>删除</a>");
                        $("#del" + info.empId).click(function () {
                            if (window.confirm("确定要删除吗?删除之后无法恢复!!!")) {
                                $(this).attr("href", "${delete}?empId=" + info.empId);
                            }
                        })
                    });
                }
            };
            page.init(datas.length, 1, options); //执行分页,1表示加载完成后显示为第一页
        }
    });
</script>

</body>
</html>
