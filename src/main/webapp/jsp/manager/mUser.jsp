<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dellpc
  Date: 2018/3/24
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/jsp/manager";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Centaurus - Bootstrap Admin Template</title>

    <script type="text/javascript">
        //<![CDATA[
        try {
            if (!window.CloudFlare) {
                var CloudFlare = [{
                    verbose: 0,
                    p: 1419364062,
                    byc: 0,
                    owlid: "cf",
                    bag2: 1,
                    mirage2: 0,
                    oracle: 0,
                    paths: {cloudflare: "/cdn-cgi/nexp/dok2v=1613a3a185/"},
                    atok: "1fca8a26fb9678bbb4b5c54c34e227b9",
                    petok: "edc3bb660c960db01c6473543c337c05ff828e55-1420553994-1800",
                    zone: "adbee.technology",
                    rocket: "0",
                    apps: {"ga_key": {"ua": "UA-49262924-2", "ga_bs": "2"}}
                }];
                !function (a, b) {
                    a = document.createElement("script"), b = document.getElementsByTagName("script")[0], a.async = !0, a.src = "//ajax.cloudflare.com/cdn-cgi/nexp/dok2v=919620257c/cloudflare.min.js", b.parentNode.insertBefore(a, b)
                }()
            }
        } catch (e) {
        }
        ;
        //]]>
    </script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap/bootstrap.min.css"/>

    <script src="<%=basePath%>/js/demo-rtl.js"></script>


    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/libs/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/libs/nanoscroller.css"/>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/compiled/theme_styles.css"/>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/libs/dataTables.fixedHeader.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/libs/dataTables.tableTools.css">

    <link type="image/x-icon" href="<%=basePath%>/favicon.png" rel="shortcut icon"/>

    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400' rel='stylesheet'
          type='text/css'>
    <!--[if lt IE 9]>
    <script src="<%=basePath%>/js/html5shiv.js"></script>
    <script src="<%=basePath%>/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        /* <![CDATA[ */
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-49262924-2']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

        (function (b) {
            (function (a) {
                "__CF" in b && "DJS" in b.__CF ? b.__CF.DJS.push(a) : "addEventListener" in b ? b.addEventListener("load", a, !1) : b.attachEvent("onload", a)
            })(function () {
                "FB" in b && "Event" in FB && "subscribe" in FB.Event && (FB.Event.subscribe("edge.create", function (a) {
                    _gaq.push(["_trackSocial", "facebook", "like", a])
                }), FB.Event.subscribe("edge.remove", function (a) {
                    _gaq.push(["_trackSocial", "facebook", "unlike", a])
                }), FB.Event.subscribe("message.send", function (a) {
                    _gaq.push(["_trackSocial", "facebook", "send", a])
                }));
                "twttr" in b && "events" in twttr && "bind" in twttr.events && twttr.events.bind("tweet", function (a) {
                    if (a) {
                        var b;
                        if (a.target && a.target.nodeName == "IFRAME")a:{
                            if (a = a.target.src) {
                                a = a.split("#")[0].match(/[^?=&]+=([^&]*)?/g);
                                b = 0;
                                for (var c; c = a[b]; ++b)if (c.indexOf("url") === 0) {
                                    b = unescape(c.split("=")[1]);
                                    break a
                                }
                            }
                            b = void 0
                        }
                        _gaq.push(["_trackSocial", "twitter", "tweet", b])
                    }
                })
            })
        })(window);
        /* ]]> */
    </script>
</head>
<body>
<div id="theme-wrapper">
    <header class="navbar" id="header-navbar">
        <div class="container">
            <a href="#" id="logo" class="navbar-brand">
                知木管家
            </a>
            <div class="clearfix">
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
                                <!------------------------------------------------管理员图片---------------------------------------------------------->
                                <img src="<%=basePath%>/img/samples/scarlet.png" alt=""/>
                                <span class="hidden-xs">Admin</span> <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="fa fa-user"></i>Profile</a></li>
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
                            <img alt="" src="<%=basePath%>/img/samples/scarlet-159.png"/>
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
                                    <a href="/jsp/manager/home.jsp">
                                        <i class="fa fa-dashboard"></i>
                                        <span>资讯</span>
                                        <span class="label label-info label-circle pull-right">28</span>
                                    </a>
                                </li>
                                <li class="open active">
                                    <a href="/userManager/findAll.mvc" class="dropdown-toggle">
                                        <i class="fa fa-table"></i>
                                        <span>用户管理</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="/userManager/findAll.mvc" class="active">
                                                普通用户
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="/jsp/manager/webFlow.jsp" class="dropdown-toggle">
                                        <i class="fa fa-bar-chart-o"></i>
                                        <span>网站流量</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="/jsp/manager/webFlow.jsp">
                                                网站流量图
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="/jsp/manager/boke.jsp">
                                        <i class="fa fa-th-large"></i>
                                        <span>博客管理</span>
                                        <span class="label label-success pull-right">New</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/jsp/manager/ziliao.jsp" class="dropdown-toggle">
                                        <i class="fa fa-desktop"></i>
                                        <span>资料上传</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="/jsp/manager/ziliao.jsp">
                                                文件上传
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="/jsp/manager/wendang.jsp" class="dropdown-toggle">
                                        <i class="fa fa-edit"></i>
                                        <span>文档管理</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="/jsp/manager/wendang.jsp">
                                                文档管理
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="/jsp/manager/shipin.jsp" class="dropdown-toggle">
                                        <i class="fa fa-desktop"></i>
                                        <span>视频管理</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="/jsp/manager/shipin.jsp">
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
                                    <li class="active"><span>用户管理</span></li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="main-box clearfix">
                                    <div class="main-box-body clearfix">
                                        <div class="table-responsive">
                                            <table id="table-example" class="table table-hover">
                                                <thead>
                                                <tr>
                                                    <th>用户ID</th>
                                                    <th>用户名</th>
                                                    <th>用户密码</th>
                                                    <th>用户等级</th>
                                                    <th>用户电话</th>
                                                    <th>E-mail</th>
                                                    <th>VIP</th>
                                                    <th>用户得分</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${users}" var="user">
                                                    <tr>
                                                        <th><c:out value="${user.userId}"/></th>
                                                        <th><c:out value="${user.userName}"/></th>
                                                        <th><c:out value="${user.userPassword}"/></th>
                                                        <th><c:out value="${user.userAvatar}"/></th>
                                                        <th><c:out value="${user.userPhone}"/></th>
                                                        <th><c:out value="${user.userEmail}"/></th>
                                                        <th><c:out value="${user.userVip}"/></th>
                                                        <th><c:out value="${user.userPoint}"/></th>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer id="footer-bar" class="row">
                    <p id="footer-copyright" class="col-xs-12">
                        广播电视节目制作经营许可证：（沪）字第1248号 | 网络文化经营许可证：沪网文[2013]0480-056号 | 信息网络传播视听节目许可证：0910417 |
                        互联网ICP备案：沪ICP备13002172号-3 沪ICP证：沪B2-20100043 | 违法不良信息举报邮箱：help@bilibili.com |
                        违法不良信息举报电话：4000233233转3
                        上海互联网举报中心 | 12318 全国文化市场举报网站 | 沪公网安备 31011502001911号 | 儿童色情信息举报专区
                        网上有害信息举报专区： 中国互联网违法和不良信息举报中心
                    </p>
                </footer>
            </div>
        </div>
    </div>
</div>
<script src="<%=basePath%>/js/demo-skin-changer.js"></script>
<script src="<%=basePath%>/js/jquery.js"></script>
<script src="<%=basePath%>/js/bootstrap.js"></script>
<script src="<%=basePath%>/js/jquery.nanoscroller.min.js"></script>
<script src="<%=basePath%>/js/demo.js"></script>

<script src="<%=basePath%>/js/jquery.dataTables.js"></script>
<script src="<%=basePath%>/js/dataTables.fixedHeader.js"></script>
<script src="<%=basePath%>/js/dataTables.tableTools.js"></script>
<script src="<%=basePath%>/js/jquery.dataTables.bootstrap.js"></script>

<script src="<%=basePath%>/js/scripts.js"></script>
<script src="<%=basePath%>/js/pace.min.js"></script>

<script>
    $(document).ready(function () {
        var table = $('#table-example').dataTable({
            'info': false,
            'sDom': 'lTfr<"clearfix">tip',
            'oTableTools': {
                'aButtons': [
                    {
                        'sExtends': 'collection',
                        'sButtonText': '<i class="fa fa-cloud-download"></i>&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down"></i>',
                        'aButtons': ['csv', 'xls', 'pdf', 'copy', 'print']
                    }
                ]
            }
        });

        //var tt = new $.fn.dataTable.TableTools( table );
        //$( tt.fnContainer() ).insertBefore('div.dataTables_wrapper');

        var tableFixed = $('#table-example-fixed').dataTable({
            'info': false,
            'pageLength': 50
        });

        new $.fn.dataTable.FixedHeader(tableFixed);
    });
</script>
</body>
</html>