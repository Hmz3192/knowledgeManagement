<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.utils.ConstantPara"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
	   scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style type="text/css" media="screen">
		  html,body{height:100%;}
		  body{margin:0;padding:0;overflow:auto;}
		  #flashContent{display:none;}
		</style>	    
	    <script type="text/javascript" src="${path}/flexpaper/js/flexpaper_flash_debug.js"></script>
		<script type="text/javascript" src="${path}/flexpaper/js/jquery.js"></script>
		<script type="text/javascript" src="${path}/flexpaper/js/flexpaper_flash.js"></script>

  </head>
  
  <body>
		要加载的文件：<%=(String)(session.getAttribute("swfPath"))%>
		<div style="position:absolute;left:200px;top:10px;">
		<center><a id="viewerPlaceHolder"style="margin-top:100px;width:1500px;height:800px;display:block">努力加载中............</a></center>
		<script type="text/javascript">
	        $(document).ready(function(){
					var fp = new FlexPaperViewer(
						'<%=ConstantPara.ServerPath%>/flexpaper/FlexPaperViewer',
						'viewerPlaceHolder', { config : {
						 SwfFile : escape('<%=ConstantPara.ServerPath%>/uploadFile/outSWFFile/<%=(String)(session.getAttribute("swfPath"))%>'),
						 Scale : 1, //缩放比例
						 ZoomTransition : 'easeOut',
						 ZoomTime : 0.5,
						 ZoomInterval : 0.2,
						 FitPageOnLoad : true,//加载后适合高度 
						 FitWidthOnLoad : true,//加载后适合宽度  
						 PrintEnabled : true,//是否支持打印  
						 FullScreenAsMaxWindow : true,//是否支持全屏  
						 ProgressiveLoading : false,//是否延迟加载  
						 MinZoomSize : 0.2,
						 MaxZoomSize : 5,
						 SearchMatchAll : true,//设置为true的时候，单击搜索所有符合条件的地方高亮显示。
						 InitViewMode : 'Portrait',
						
						 ViewModeToolsVisible : true,//工具栏上是否显示样式选择框(就是显示缩略图或分页显示的工具)
						 ZoomToolsVisible : true,//工具栏上是否显示缩放工具
						 NavToolsVisible : true,//工具栏上是否显示导航工具(也就是页码工具)
						 CursorToolsVisible : true,//工具栏上是否显示光标工具
						 SearchToolsVisible : true,//工具栏上是否显示搜索
						
						 localeChain: 'zh_CN'//语言
						 }});
	        });
			
	</script>
		


	</div>


  </body>
</html>
