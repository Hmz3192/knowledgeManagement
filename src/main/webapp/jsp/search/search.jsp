<!--
Created by IntelliJ IDEA.
User: ThinKPad
Date: 2018/2/16
Time: 16:07
To change this template use File | Settings | File Templates.
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="${path}/jsp/main/top.jsp"/>
<div class="block">
    <div class="box row">

        <jsp:include page="${path}/jsp/main/left.jsp"/>
        <div class="col-sm-10" style="padding: 0px">
            <div class="home">
                <div style="width: 95%;margin: 0px auto">
                    <table border="1px" id="table">
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
                        <c:forEach var="kl" items="${requestScope.Knowledges}">
                            <tr>
                                <td>${kl.klId}</td>
                                <td>${kl.userId}</td>
                                <td>${kl.klKind}</td>
                                <c:choose>
                                    <c:when test="${fn:length(kl.klTitle) >= 3}">
                                        <td>${fn:substring(kl.klTitle,0,3)}...</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>${kl.klTitle}</td>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${fn:length(kl.klIntroduction) >= 3}">
                                        <td>${fn:substring(kl.klIntroduction,0,3)}...</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>${kl.klIntroduction}</td>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${fn:length(kl.klContent) >= 3}">
                                        <td>${fn:substring(kl.klContent,0,3)}...</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>${kl.klContent}</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${kl.klTags}</td>
                                <td><!--${kl.klAppendix}--></td>
                                <td><!--${kl.klVideo}--></td>
                                <td>${kl.klHints}</td>
                                <td>${kl.klCollectionNumber}</td>
                                <td>${kl.klConnectIds}</td>
                                <td>${kl.klParentFileId}</td>
                                <td>${kl.klCheckState}</td>
                                <td>
                                    <button id="fulltext"
                                            onclick="select(this)">查看正文
                                    </button>
                                    <button id="appendixList"
                                            onclick="appendixList(this)">查看附件
                                    </button>
                                    <c:if test="${kl.klKind == 2 || kl.klKind == 3}">
                                        <button>查看视屏</button>
                                    </c:if>
                                    <button>敏感词检测</button>
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
                            <input name="queryString" type="text" value="${queryString}"/> <input type="submit"
                                                                                                  value="搜索"></input>
                        </form>
                        <hr>

                        <br>
                        <div style="width:800px;height:1000px;text-align:left">
                            <c:forEach items="${requestScope.searchList}" var="map">
                                <a href="#" style="text-decoration: none">
                                    <div style="width:798px;height:200px;padding:5px 0px 5px 0px;;font-size:14px;border:1px #BFDCE8 solid">
                                        <font style="family:Arial Narrow;color:blue;size:3pt">
                                                ${map.klTitle }</font><br>
                                        <font style="size:10px">
                                                ${map.klIntro }
                                        </font><br>
                                        <c:if test="${map.klContent !=null}">
                                            <font style="size:10px">
                                                    ${map.klContent }...
                                            </font><br>
                                        </c:if>
                                        <c:if test="${map.klAppendix1 !=null}">
                                            <font style="size:10px">
                                                    ${map.klAppendix1 }...
                                            </font><br>
                                        </c:if>
                                        <c:if test="${map.klAppendix2 !=null}">
                                            <font style="size:10px">
                                                    ${map.klAppendix2 }...
                                            </font><br>
                                        </c:if>
                                        <c:if test="${map.klAppendix3 !=null}">
                                            <font style="size:10px">
                                                    ${map.klAppendix3 }...
                                            </font><br>
                                        </c:if>
                                        <c:if test="${map.klAppendix4 !=null}">
                                            <font style="size:10px">
                                                    ${map.klAppendix4 }...
                                            </font><br>
                                        </c:if>
                                        <c:if test="${map.klAppendix5 !=null}">
                                            <font style="size:10px">
                                                    ${map.klAppendix5 }...
                                            </font><br>
                                        </c:if>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 查看正文（Modal） -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="pop-full"
     style="display:none;">
    <div class="modal-dialog" style="width: 70%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;
                </button>
                <h4 class="modal-title" id="fullTextTitle">
                </h4>
            </div>
            <div class="modal-body" id="fullTextIntro">
            </div>
            <hr>
            <div class="modal-body" id="fullTextContent">
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </div>
</div>
<!--附件-->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true" id="pop-appendix"
     style="display:none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;
                </button>
                <h4 class="modal-title" id="appendixListTitle">
                    附件列表
                </h4>
            </div>
            <div class="modal-body" id="appendixListIntro">
                <h4 class="modal-title" id="myModalLabel2"></h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function select(elementId) {
        var buttonId = $(elementId).parent().parent().find("td:eq(0)").text(),
            url = "${path}/getByklId/" + buttonId + ".mvc";
        //发送ajax
        $.ajax({
            //url
            url: url,
            //请求方式
            type: 'GET',
            //成功回调
            success: function (data) {
                $("#fullTextTitle").append('<h2>' + data.klTitle + '</h2>')
                $("#fullTextIntro").append('<h3>' + data.klIntroduction + '</h3>')
                $("#fullTextContent").append(data.klContent)
                $('#pop-full').modal('show')
            },
            //失败回调
            error: function (e, e2, e3) {
                alert('请求失败，原因：' + e3);
            }
        });
    }
    function appendixList(elementId) {
        var buttonId = $(elementId).parent().parent().find("td:eq(0)").text(),
            url = "${path}/getByklId/" + buttonId + ".mvc",
            htmlText = "";
        $.ajax({
            url: url,
            //请求方式
            type: 'GET',
            //成功回调
            success: function (data) {
                var str = data.klAppendix,
                    htmlText = "",
                    arry = str.split(","),
                    i = 0;
                for (; i < arry.length; i++) {
                    var arryDetail = arry[i].split("/"),
                        lens = arryDetail.length;
                    var readOnlinePath = arry[i].split('/').join('-'),
                        readOnlinePath = readOnlinePath.split('.').join('-')

                    htmlText += '<a href="${path}/toReadOnline/' + readOnlinePath + '.mvc" target="_blank">' + arryDetail[lens - 1] + '</a><br>',
                    $("#appendixListIntro").append(htmlText)
                }
                $('#pop-appendix').modal('show')
            },
            //失败回调
            error: function (e, e2, e3) {
                alert('请求失败，原因：' + e3);
            }
        });


    }
    $(function () {
        $('#pop-full').on('hidden.bs.modal',
            function () {
                $("#fullTextTitle").empty(),
                    $("#fullTextIntro").empty(),
                    $("#fullTextContent").empty();
            });
        $('#pop-appendix').on('hidden.bs.modal',
            function () {
                $("#appendixListTitle").empty(),
                    $("#appendixListIntro").empty();
            });
    })
</script>
</body>
</html>
