<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dellpc
  Date: 2018/4/7
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/jsp/manager";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Centaurus - Bootstrap Admin Template</title>

    <script type="text/javascript">
        //<![CDATA[
        try{if (!window.CloudFlare) {var CloudFlare=[{verbose:0,p:1419364062,byc:0,owlid:"cf",bag2:1,mirage2:0,oracle:0,paths:{cloudflare:"/cdn-cgi/nexp/dok2v=1613a3a185/"},atok:"1fca8a26fb9678bbb4b5c54c34e227b9",petok:"1e0063518cc050ddd6cebeee1a188ea152223302-1420553999-1800",zone:"adbee.technology",rocket:"0",apps:{"ga_key":{"ua":"UA-49262924-2","ga_bs":"2"}}}];!function(a,b){a=document.createElement("script"),b=document.getElementsByTagName("script")[0],a.async=!0,a.src="//ajax.cloudflare.com/cdn-cgi/nexp/dok2v=919620257c/cloudflare.min.js",b.parentNode.insertBefore(a,b)}()}}catch(e){};
        //]]>
    </script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css"/>

    <script src="js/demo-rtl.js"></script>


    <link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="css/libs/nanoscroller.css"/>

    <link rel="stylesheet" type="text/css" href="css/compiled/theme_styles.css"/>


    <link type="image/x-icon" href="favicon.png" rel="shortcut icon"/>

    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400' rel='stylesheet' type='text/css'>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        /* <![CDATA[ */
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-49262924-2']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

        (function(b){(function(a){"__CF"in b&&"DJS"in b.__CF?b.__CF.DJS.push(a):"addEventListener"in b?b.addEventListener("load",a,!1):b.attachEvent("onload",a)})(function(){"FB"in b&&"Event"in FB&&"subscribe"in FB.Event&&(FB.Event.subscribe("edge.create",function(a){_gaq.push(["_trackSocial","facebook","like",a])}),FB.Event.subscribe("edge.remove",function(a){_gaq.push(["_trackSocial","facebook","unlike",a])}),FB.Event.subscribe("message.send",function(a){_gaq.push(["_trackSocial","facebook","send",a])}));"twttr"in b&&"events"in twttr&&"bind"in twttr.events&&twttr.events.bind("tweet",function(a){if(a){var b;if(a.target&&a.target.nodeName=="IFRAME")a:{if(a=a.target.src){a=a.split("#")[0].match(/[^?=&]+=([^&]*)?/g);b=0;for(var c;c=a[b];++b)if(c.indexOf("url")===0){b=unescape(c.split("=")[1]);break a}}b=void 0}_gaq.push(["_trackSocial","twitter","tweet",b])}})})})(window);
        /* ]]> */
    </script>
</head>
<body>
<div id="theme-wrapper">
    <header class="navbar" id="header-navbar">
        <div class="container">
            <a href="index.html" id="logo" class="navbar-brand">
                知木管家
                <img src="img/logo-black.png" alt="" class="normal-logo logo-black"/>
                <img src="img/logo-small.png" alt="" class="small-logo hidden-xs hidden-sm hidden"/>
            </a>
            <div class="clearfix">
                <button class="navbar-toggle" data-target=".navbar-ex1-collapse" data-toggle="collapse" type="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="fa fa-bars"></span>
                </button>
                <div class="nav-no-collapse navbar-left pull-left hidden-sm hidden-xs">
                    <ul class="nav navbar-nav pull-left">
                        <li>
                            <a class="btn" id="make-small-nav">
                                <i class="fa fa-bars"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="nav-no-collapse pull-right" id="header-nav">
                    <ul class="nav navbar-nav pull-right">
                        <li class="mobile-search">
                            <a class="btn">
                                <i class="fa fa-search"></i>
                            </a>
                            <div class="drowdown-search">
                                <form role="search">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Search...">
                                        <i class="fa fa-search nav-search-icon"></i>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="btn dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-warning"></i>
                                <span class="count">8</span>
                            </a>
                            <ul class="dropdown-menu notifications-list">
                                <li class="pointer">
                                    <div class="pointer-inner">
                                        <div class="arrow"></div>
                                    </div>
                                </li>
                                <li class="item-header">You have 6 new notifications</li>
                                <li class="item">
                                    <a href="#">
                                        <i class="fa fa-comment"></i>
                                        <span class="content">New comment on ‘Awesome P...</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>13 min.</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="#">
                                        <i class="fa fa-plus"></i>
                                        <span class="content">New user registration</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>13 min.</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="#">
                                        <i class="fa fa-envelope"></i>
                                        <span class="content">New Message from George</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>13 min.</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="#">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span class="content">New purchase</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>13 min.</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="#">
                                        <i class="fa fa-eye"></i>
                                        <span class="content">New order</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>13 min.</span>
                                    </a>
                                </li>
                                <li class="item-footer">
                                    <a href="#">
                                        View all notifications
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="btn dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope-o"></i>
                                <span class="count">16</span>
                            </a>
                            <ul class="dropdown-menu notifications-list messages-list">
                                <li class="pointer">
                                    <div class="pointer-inner">
                                        <div class="arrow"></div>
                                    </div>
                                </li>
                                <li class="item first-item">
                                    <a href="#">
                                        <img src="<%=basePath%>/img/samples/messages-photo-1.png" alt=""/>
                                        <span class="content">
<span class="content-headline">
George Clooney
</span>
<span class="content-text">
Look, just because I don't be givin' no man a foot massage don't make it
right for Marsellus to throw...
</span>
</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>13 min.</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="#">
                                        <img src="<%=basePath%>/img/samples/messages-photo-2.png" alt=""/>
                                        <span class="content">
<span class="content-headline">
Emma Watson
</span>
<span class="content-text">
Look, just because I don't be givin' no man a foot massage don't make it
right for Marsellus to throw...
</span>
</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>13 min.</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="#">
                                        <img src="<%=basePath%>/img/samples/messages-photo-3.png" alt=""/>
                                        <span class="content">
<span class="content-headline">
Robert Downey Jr.
</span>
<span class="content-text">
Look, just because I don't be givin' no man a foot massage don't make it
right for Marsellus to throw...
</span>
</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>13 min.</span>
                                    </a>
                                </li>
                                <li class="item-footer">
                                    <a href="#">
                                        View all messages
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="hidden-xs">
                            <a class="btn">
                                <i class="fa fa-cog"></i>
                            </a>
                        </li>
                        <li class="dropdown profile-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="<%=basePath%>/img/samples/scarlet-159.png" alt=""/>
                                <span class="hidden-xs">Admin</span> <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="user-profile.html"><i class="fa fa-user"></i>Profile</a></li>
                                <li><a href="#"><i class="fa fa-cog"></i>Settings</a></li>
                                <li><a href="#"><i class="fa fa-envelope-o"></i>Messages</a></li>
                                <li><a href="#"><i class="fa fa-power-off"></i>Logout</a></li>
                            </ul>
                        </li>
                        <li class="hidden-xxs">
                            <a class="btn">
                                <i class="fa fa-power-off"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <div id="page-wrapper" class="container">
        <div class="row">
            <div id="nav-col">
                <section id="col-left" class="col-left-nano">
                    <div id="col-left-inner" class="col-left-nano-content">
                        <div id="user-left-box" class="clearfix hidden-sm hidden-xs">
                            <img alt="" src="img/samples/scarlet-159.png"/>
                            <div class="user-box">
<span class="name">
Admin
</span>
                                <span class="status">
<i class="fa fa-circle"></i> Online
</span>
                            </div>
                        </div>
                        <div class="collapse navbar-collapse navbar-ex1-collapse" id="sidebar-nav">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="home.jsp">
                                        <i class="fa fa-dashboard"></i>
                                        <span>资讯</span>
                                        <span class="label label-info label-circle pull-right">28</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/userManager/findAll.mvc" class="dropdown-toggle">
                                        <i class="fa fa-table"></i>
                                        <span>用户管理</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="/userManager/findAll.mvc">
                                                普通用户
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="open active">
                                    <a href="webFlow.jsp" class="dropdown-toggle">
                                        <i class="fa fa-bar-chart-o"></i>
                                        <span>网站流量</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="webFlow.jsp" class="active">
                                                网站流量图
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="boke.jsp">
                                        <i class="fa fa-th-large"></i>
                                        <span>博客管理</span>
                                        <span class="label label-success pull-right">New</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="ziliao.jsp" class="dropdown-toggle">
                                        <i class="fa fa-desktop"></i>
                                        <span>资料上传</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="ziliao.jsp">
                                                文件上传
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="dropdown-toggle">
                                        <i class="fa fa-edit"></i>
                                        <span>文档管理</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="wendang.jsp">
                                                文档管理
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="dropdown-toggle">
                                        <i class="fa fa-desktop"></i>
                                        <span>视频管理</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="shipin.jsp">
                                                视频管理
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </section>
            </div>
            <div id="content-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-12">
                                <ol class="breadcrumb">
                                    <li><a href="#">Home</a></li>
                                    <li class="active"><span>网站流量</span></li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="main-box">
                                    <header class="main-box-header clearfix">
                                        <h2>折线图</h2>
                                    </header>
                                    <div class="main-box-body clearfix">
                                        <div id="graph-flot-sin" style="height: 300px; padding: 0px; position: relative;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="main-box">
                                    <header class="main-box-header clearfix">
                                        <h2>实时流量</h2>
                                    </header>
                                    <div class="main-box-body clearfix">
                                        <div id="graph-flot-realtime" style="height: 400px; padding: 0px; position: relative;"></div>
                                        <br/>
                                        <p>
                                            You can update a chart periodically to get a real-time effect by using a timer to insert the new
                                            data in the plot and redraw it.
                                        </p>
                                        <p>
                                            Time between updates:
                                            <input id="updateInterval" class="form-control inline" type="text" value="" style="text-align: right; width:5em; display: inline-block;">
                                            milliseconds
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="main-box">
                                    <header class="main-box-header clearfix">
                                        <h2>用户</h2>
                                    </header>
                                    <div class="main-box-body clearfix">
                                        <div id="graph-flot-points" style="height: 400px; padding: 0px; position: relative;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="main-box">
                                    <header class="main-box-header clearfix">
                                        <h2>饼图</h2>
                                    </header>
                                    <div class="main-box-body clearfix">
                                        <div id="graph-flot-donut" style="height: 400px; padding: 0px; position: relative;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer id="footer-bar" class="row">
                    <p id="footer-copyright" class="col-xs-12">
                        广播电视节目制作经营许可证：（沪）字第1248号 | 网络文化经营许可证：沪网文[2013]0480-056号 | 信息网络传播视听节目许可证：0910417 | 互联网ICP备案：沪ICP备13002172号-3 沪ICP证：沪B2-20100043 | 违法不良信息举报邮箱：help@bilibili.com | 违法不良信息举报电话：4000233233转3
                        上海互联网举报中心 | 12318 全国文化市场举报网站 | 沪公网安备 31011502001911号 | 儿童色情信息举报专区
                        网上有害信息举报专区： 中国互联网违法和不良信息举报中心
                    </p>
                </footer>
            </div>
        </div>
    </div>
</div>

<script src="js/demo-skin-changer.js"></script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.nanoscroller.min.js"></script>
<script src="js/demo.js"></script>

<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="<%=basePath%>/js/flot/excanvas.min.js"></script><![endif]-->
<script src="<%=basePath%>/js/flot/jquery.flot.js"></script>
<script src="<%=basePath%>/js/flot/jquery.flot.min.js"></script>
<script src="<%=basePath%>/js/flot/jquery.flot.pie.min.js"></script>
<script src="<%=basePath%>/js/flot/jquery.flot.stack.min.js"></script>
<script src="<%=basePath%>/js/flot/jquery.flot.resize.min.js"></script>
<script src="<%=basePath%>/js/flot/jquery.flot.time.min.js"></script>
<script src="<%=basePath%>/js/flot/jquery.flot.orderBars.js"></script>

<script src="<%=basePath%>/js/scripts.js"></script>
<script src="<%=basePath%>/js/pace.min.js"></script>

<script>
    $(function() {

        // bar chart
        if ($('#graph-bar').length) {
            var db1 = [];
            for (var i = 0; i <= 10; i += 1) {
                db1.push([i, parseInt(Math.random() * 30)]);
            }

            var db2 = [];
            for (var i = 0; i <= 10; i += 1) {
                db2.push([i, parseInt(Math.random() * 30)]);
            }

            var db3 = [];
            for (var i = 0; i <= 10; i += 1) {
                db3.push([i, parseInt(Math.random() * 30)]);
            }

            var series = new Array();

            series.push({
                data : db1,
                bars : {
                    show : true,
                    barWidth : 0.2,
                    order : 1,
                    lineWidth: 1,
                    fill: 1
                }
            });
            series.push({
                data : db2,
                bars : {
                    show : true,
                    barWidth : 0.2,
                    order : 2,
                    lineWidth: 1,
                    fill: 1
                }
            });
            series.push({
                data : db3,
                bars : {
                    show : true,
                    barWidth : 0.2,
                    order : 3,
                    lineWidth: 1,
                    fill: 1
                }
            });

            $.plot("#graph-bar", series, {
                colors: ['#e74c3c', '#f1c40f', '#2ecc71', '#3498db', '#9b59b6', '#95a5a6'],
                grid: {
                    tickColor: "#ddd",
                    borderWidth: 0
                },
                shadowSize: 0
            });
        }

        // bar chart - horizontal
        if ($('#graph-flot-bar-horizontal').length) {
            var db1 = [];
            for (var i = 0; i <= 4; i += 1) {
                db1.push([parseInt(Math.random() * 30), i]);
            }

            var db2 = [];
            for (var i = 0; i <= 4; i += 1) {
                db2.push([parseInt(Math.random() * 30), i]);
            }

            var db3 = [];
            for (var i = 0; i <= 4; i += 1) {
                db3.push([parseInt(Math.random() * 30), i]);
            }

            var series = new Array();

            series.push({
                data : db1,
                bars : {
                    show : true,
                    barWidth : 0.2,
                    order : 1,
                    lineWidth: 1,
                    horizontal: true,
                    fill: 1
                }
            });
            series.push({
                data : db2,
                bars : {
                    show : true,
                    barWidth : 0.2,
                    order : 2,
                    lineWidth: 1,
                    horizontal: true,
                    fill: 1
                }
            });
            series.push({
                data : db3,
                bars : {
                    show : true,
                    barWidth : 0.2,
                    order : 3,
                    lineWidth: 1,
                    horizontal: true,
                    fill: 1
                }
            });

            $.plot("#graph-flot-bar-horizontal", series, {
                colors: ['#e74c3c', '#f1c40f', '#2ecc71', '#3498db', '#9b59b6', '#95a5a6'],
                grid: {
                    tickColor: "#ddd",
                    borderWidth: 0
                },
                shadowSize: 0
            });
        }

        // graph with points - sin/cos example
        if ($('#graph-flot-sin').length) {
            var sin = [],
                cos = [];

            for (var i = 0; i < 14; i += 0.5) {
                sin.push([i, Math.sin(i)]);
                cos.push([i, Math.cos(i)]);
            }

            var plot = $.plot("#graph-flot-sin", [
                { data: sin, label: "sin(x)"},
                { data: cos, label: "cos(x)"}
            ], {
                series: {
                    lines: {
                        show: true,
                        lineWidth: 2
                    },
                    points: {
                        show: true
                    }
                },
                grid: {
                    hoverable: true,
                    clickable: true,
                    tickColor: "#ddd",
                    borderWidth: 0
                },
                yaxis: {
                    min: -1.2,
                    max: 1.2
                },
                colors: ['#e74c3c', '#2ecc71', '#f1c40f', '#3498db', '#9b59b6', '#95a5a6'],
                shadowSize: 0
            });

            function showTooltip(x, y, contents) {
                $("<div id='tooltip'>" + contents + "</div>").css({
                    position: "absolute",
                    display: "none",
                    top: y + 5,
                    left: x + 5,
                    border: "1px solid #fdd",
                    padding: "2px",
                    "background-color": "#fee",
                    opacity: 0.80
                }).appendTo("body").fadeIn(200);
            }

            var previousPoint = null;
            $("#graph-flot-sin").bind("plothover", function (event, pos, item) {

                if ($("#enablePosition:checked").length > 0) {
                    var str = "(" + pos.x.toFixed(2) + ", " + pos.y.toFixed(2) + ")";
                    $("#hoverdata").text(str);
                }

                if ($("#enableTooltip:checked").length > 0) {
                    if (item) {
                        if (previousPoint != item.dataIndex) {

                            previousPoint = item.dataIndex;

                            $("#tooltip").remove();
                            var x = item.datapoint[0].toFixed(2),
                                y = item.datapoint[1].toFixed(2);

                            showTooltip(item.pageX, item.pageY,
                                item.series.label + " of " + x + " = " + y);
                        }
                    } else {
                        $("#tooltip").remove();
                        previousPoint = null;
                    }
                }
            });

            $("#graph-flot-sin").bind("plotclick", function (event, pos, item) {
                if (item) {
                    $("#clickdata").text(" - click point " + item.dataIndex + " in " + item.series.label);
                    plot.highlight(item.series, item.datapoint);
                }
            });
        }

        // stack graph
        if ($('#graph-flot-stacking').length) {
            var d1 = [];
            for (var i = 0; i <= 10; i += 1) {
                d1.push([i, parseInt(Math.random() * 30)]);
            }

            var d2 = [];
            for (var i = 0; i <= 10; i += 1) {
                d2.push([i, parseInt(Math.random() * 30)]);
            }

            var d3 = [];
            for (var i = 0; i <= 10; i += 1) {
                d3.push([i, parseInt(Math.random() * 30)]);
            }

            var stack = 0,
                bars = true,
                lines = false,
                steps = false;

            function plotWithOptions() {
                $.plot("#graph-flot-stacking", [ d1, d2, d3 ], {
                    series: {
                        stack: stack,
                        lines: {
                            show: lines,
                            fill: true,
                            steps: steps,
                            lineWidth: 1,
                            fill: 1
                        },
                        bars: {
                            show: bars,
                            barWidth: 0.3,
                            lineWidth: 1,
                            fill: 1
                        }
                    },
                    colors: ['#e74c3c', '#f1c40f', '#2ecc71', '#3498db', '#9b59b6', '#95a5a6'],
                    grid: {
                        tickColor: "#ddd",
                        borderWidth: 0
                    },
                    shadowSize: 0
                });
            }

            plotWithOptions();

            $(".stackControls button").click(function (e) {
                e.preventDefault();
                stack = $(this).text() == "With stacking" ? true : null;
                plotWithOptions();
            });

            $(".graphControls button").click(function (e) {
                e.preventDefault();
                bars = $(this).text().indexOf("Bars") != -1;
                lines = $(this).text().indexOf("Lines") != -1;
                steps = $(this).text().indexOf("steps") != -1;
                plotWithOptions();
            });
        }

        // donut chart
        if ($('#graph-flot-donut').length) {
            var dataDonut = [
                { label: "Series1",  data: 10},
                { label: "Series2",  data: 30},
                { label: "Series3",  data: 90},
                { label: "Series4",  data: 70},
                { label: "Series5",  data: 80},
                { label: "Series6",  data: 110}
            ];

            $.plot('#graph-flot-donut', dataDonut, {
                series: {
                    pie: {
                        show: true,
                        innerRadius: 0.5,
                        label: {
                            show: true,
                        }
                    }
                },
                colors: ['#e74c3c', '#f1c40f', '#2ecc71', '#3498db', '#9b59b6', '#95a5a6'],
                legend: {
                    show: false,
                }
            });
        }

        // graph with points
        if ($('#graph-flot-points').length) {
            var likes = [[1, 5], [2, 10], [3, 15], [4, 20],[5, 25],[6, 30],[7, 35],[8, 40],[9, 45],[10, 50],[11, 55],[12, 60],[13, 65],[14, 70],[15, 75],[16, 80],[17, 85],[18, 90],[19, 85],[20, 80],[21, 75],[22, 80],[23, 75],[24, 70],[25, 65],[26, 75],[27,80],[28, 85],[29, 90], [30, 95]];

            var plot = $.plot($("#graph-flot-points"),
                [ { data: likes, label: "Fans"} ], {
                    series: {
                        lines: {
                            show: true,
                            lineWidth: 2,
                            fill: true,
                            fillColor: { colors: [ { opacity: 0.3 }, { opacity: 0.3 } ] }
                        },
                        points: { show: true,
                            lineWidth: 2
                        },
                        shadowSize: 0
                    },
                    grid: { hoverable: true,
                        clickable: true,
                        tickColor: "#f9f9f9",
                        borderWidth: 0
                    },
                    colors: ["#3498db"],
                    xaxis: {ticks:6, tickDecimals: 0},
                    yaxis: {ticks:3, tickDecimals: 0},
                });

            function showTooltip(x, y, contents) {
                $('<div id="tooltip">' + contents + '</div>').css( {
                    position: 'absolute',
                    display: 'none',
                    top: y + 5,
                    left: x + 5,
                    border: '1px solid #fdd',
                    padding: '2px',
                    'background-color': '#dfeffc',
                    opacity: 0.80
                }).appendTo("body").fadeIn(200);
            }

            var previousPoint = null;
            $("#graph-flot-points").bind("plothover", function (event, pos, item) {
                $("#x").text(pos.x.toFixed(2));
                $("#y").text(pos.y.toFixed(2));

                if (item) {
                    if (previousPoint != item.dataIndex) {
                        previousPoint = item.dataIndex;

                        $("#tooltip").remove();
                        var x = item.datapoint[0].toFixed(2),
                            y = item.datapoint[1].toFixed(2);

                        showTooltip(item.pageX, item.pageY,
                            item.series.label + " of " + x + " = " + y);
                    }
                }
                else {
                    $("#tooltip").remove();
                    previousPoint = null;
                }
            });
        }

        // graph real time
        if ($('#graph-flot-realtime').length) {

            var data = [],
                totalPoints = 300;

            function getRandomData() {

                if (data.length > 0)
                    data = data.slice(1);

                // Do a random walk

                while (data.length < totalPoints) {

                    var prev = data.length > 0 ? data[data.length - 1] : 50,
                        y = prev + Math.random() * 10 - 5;

                    if (y < 0) {
                        y = 0;
                    } else if (y > 100) {
                        y = 100;
                    }

                    data.push(y);
                }

                // Zip the generated y values with the x values

                var res = [];
                for (var i = 0; i < data.length; ++i) {
                    res.push([i, data[i]])
                }

                return res;
            }

            // Set up the control widget

            var updateInterval = 30;
            $("#updateInterval").val(updateInterval).change(function () {
                var v = $(this).val();
                if (v && !isNaN(+v)) {
                    updateInterval = +v;
                    if (updateInterval < 1) {
                        updateInterval = 1;
                    } else if (updateInterval > 2000) {
                        updateInterval = 2000;
                    }
                    $(this).val("" + updateInterval);
                }
            });

            var plot = $.plot("#graph-flot-realtime", [ getRandomData() ], {
                series: {
                    lines: {
                        show: true,
                        lineWidth: 2,
                        fill: true,
                        fillColor: { colors: [ { opacity: 0.3 }, { opacity: 0.3 } ] }
                    },
                    shadowSize: 0	// Drawing is faster without shadows
                },
                colors: ["#e74c3c"],
                yaxis: {
                    min: 0,
                    max: 100
                },
                xaxis: {
                    show: false
                }
            });

            function update() {

                plot.setData([getRandomData()]);

                // Since the axes don't change, we don't need to call plot.setupGrid()

                plot.draw();
                setTimeout(update, updateInterval);
            }

            update();
        }
    });

    function labelFormatter(label, series) {
        return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
    }
</script>
</body>
</html>