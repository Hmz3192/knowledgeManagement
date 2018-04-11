<%--
  Created by IntelliJ IDEA.
  User: dellpc
  Date: 2018/4/10
  Time: 22:07
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
        try{if (!window.CloudFlare) {var CloudFlare=[{verbose:0,p:1419364062,byc:0,owlid:"cf",bag2:1,mirage2:0,oracle:0,paths:{cloudflare:"/cdn-cgi/nexp/dok2v=1613a3a185/"},atok:"1fca8a26fb9678bbb4b5c54c34e227b9",petok:"c58e01c4350f2cac3ab235b257a67fb80bd8d846-1420554009-1800",zone:"adbee.technology",rocket:"0",apps:{"ga_key":{"ua":"UA-49262924-2","ga_bs":"2"}}}];!function(a,b){a=document.createElement("script"),b=document.getElementsByTagName("script")[0],a.async=!0,a.src="//ajax.cloudflare.com/cdn-cgi/nexp/dok2v=919620257c/cloudflare.min.js",b.parentNode.insertBefore(a,b)}()}}catch(e){};
        //]]>
    </script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap/bootstrap.min.css"/>

    <script src="<%=basePath%>/js/demo-rtl.js"></script>


    <link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="css/libs/nanoscroller.css"/>

    <link rel="stylesheet" type="text/css" href="css/compiled/theme_styles.css"/>

    <link rel="stylesheet" type="text/css" href="css/libs/jquery.nouislider.css">

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
                                        <img src="img/samples/messages-photo-1.png" alt=""/>
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
                                        <img src="img/samples/messages-photo-2.png" alt=""/>
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
                                        <img src="img/samples/messages-photo-3.png" alt=""/>
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
                                <img src="img/samples/scarlet-159.png" alt=""/>
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
                                <li>
                                    <a href="webFlow.jsp" class="dropdown-toggle">
                                        <i class="fa fa-bar-chart-o"></i>
                                        <span>网站流量</span>
                                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="webFlow.jsp">
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
                                    <a href="wendang.jsp" class="dropdown-toggle">
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
                                <li class="open active">
                                    <a href="shipin.jsp" class="dropdown-toggle">
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
                                    <li class="active"><span>视频管理</span></li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="main-box clearfix">
                                    <div class="main-box-body clearfix">
                                        <div class="table-responsive">
                                            <table id="user" class="table table-hover" style="clear: both">
                                                <thead>
                                                <tr>
                                                    <th><span>用户</span></th>
                                                    <th><span>视频名称</span></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td width="35%">用户1</td>
                                                    <td width="65%"><a href="#" id="username" data-type="text"
                                                                       data-pk="1" data-title="Enter username"
                                                                       class="editable editable-click">superuser</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>用户2</td>
                                                    <td><a href="#" id="firstname" data-type="text" data-pk="1"
                                                           data-placement="right" data-placeholder="Required"
                                                           data-title="Enter your firstname"
                                                           class="editable editable-click editable-empty">新的希望</a></td>
                                                </tr>
                                                <tr>
                                                    <td>用户3</td>
                                                    <td><a href="#" id="sex" data-type="select2" data-pk="1"
                                                           data-value="" data-title="Select sex"
                                                           class="editable editable-click" style="color: gray;">闪电侠</a></td>
                                                </tr>
                                                <tr>
                                                    <td>用户4</td>
                                                    <td><a href="#" id="group" data-type="select" data-pk="1"
                                                           data-value="5" data-source="/groups"
                                                           data-title="Select group" class="editable editable-click">他是龙</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>用户5</td>
                                                    <td><a href="#" id="status" data-type="select" data-pk="1"
                                                           data-value="0" data-source="/status"
                                                           data-title="Select status" class="editable editable-click">前任3</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>用户6</td>
                                                    <td>
                                                        <span class="notready">星晴</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>用户7</td>
                                                    <td><a href="#" id="dob" data-type="combodate"
                                                           data-value="1984-05-15" data-format="YYYY-MM-DD"
                                                           data-viewformat="DD/MM/YYYY" data-template="D / MMM / YYYY"
                                                           data-pk="1" data-title="Select Date of birth"
                                                           class="editable editable-click">魔兽世界</a></td>
                                                </tr>
                                                <tr>
                                                    <td>用户8</td>
                                                    <td><a href="#" id="event" data-type="combodate"
                                                           data-template="D MMM YYYY  HH:mm"
                                                           data-format="YYYY-MM-DD HH:mm"
                                                           data-viewformat="MMM D, YYYY, HH:mm" data-pk="1"
                                                           data-title="Setup event date and time"
                                                           class="editable editable-click editable-empty">黑豹</a></td>
                                                </tr>

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

<script src="js/demo-skin-changer.js"></script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.nanoscroller.min.js"></script>
<script src="js/demo.js"></script>

<script src="js/jquery.nouislider.js"></script>

<script src="js/scripts.js"></script>
<script src="js/pace.min.js"></script>

<script>
    $(document).ready(function() {
        $(".alert").alert();

        $('.bs-example-tooltips button').popover();

        $('#btn-loading-demo').click(function () {
            var btn = $(this)
            btn.button('loading')
            setTimeout(function () {
                btn.button('reset')
            }, 3000)
        });

        //run noUiSlider with basic slider
        $('.slider-basic').noUiSlider({
            range: [10,40],
            start: [20],
            handles: 1,
            connect: 'lower',
        });
        $('.slider-basic:nth-of-type(2)').val(25);
        $('.slider-basic:nth-of-type(3)').val(35);
        $('.slider-basic:nth-of-type(4)').val(30);
        $('.slider-basic:nth-of-type(5)').val(22);

        //min/max slider
        $('.slider-minmax').noUiSlider({
            range: [0,100],
            start: [20],
            handles: 1,
            connect: 'upper',
            slide: function(){
                var val = $(this).val();

                $(this).next('span').text(
                    'Max: $' + val
                );
            },
            set: function() {
                var val = $(this).val();

                $(this).next('span').text(
                    'Max: $' + val
                );
            }
        });
        $('.slider-minmax').val(20, true);

        //range slider
        $('.slider-range').noUiSlider({
            range: [20, 100],
            start: [40, 80],
            step: 5,
            connect: true,
            slide: function(){
                var values = $(this).val();

                $(this).next('span').text(
                    'Price range: $' + values[0] + ' - $' + values[1]
                );
            },
            set: function(){
                var values = $(this).val();

                $(this).next('span').text(
                    'Price range: $' + values[0] + ' - $' + values[1]
                );
            }
        });
        $('.slider-range').val([40, 80], true);

        //vertical sliders
        $('.slider-vertical').noUiSlider({
            range: [20, 100],
            start: 40,
            connect: true,
            handles: 1,
            orientation: 'vertical'
        });

        $('.slider-vertical:nth-of-type(2)').val(50);
        $('.slider-vertical:nth-of-type(3)').val(60);
        $('.slider-vertical:nth-of-type(4)').val(70);
        $('.slider-vertical:nth-of-type(5)').val(55);

        //disabled slider example
        var disableSlider = $('.slider-disable-example');
        disableSlider.noUiSlider({
            range: [10,40],
            start: [20],
            handles: 1,
            connect: 'lower',
        });

        $('#disable-checkbox').click(function(){
            if (this.checked) {
                // Disable the slider
                disableSlider.attr("disabled", "disabled");
            }
            else {
                // Enabled the slider
                disableSlider.removeAttr("disabled");
            }
        });
    });
</script>
</body>
</html>