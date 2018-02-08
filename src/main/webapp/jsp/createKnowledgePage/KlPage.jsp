<%--
  Created by IntelliJ IDEA.
  User: ThinKPad
  Date: 2018/2/8
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${path}/Resource/tags/js/jquery.js"></script>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/Resource/comment/css/comment.css">
    <link rel="stylesheet" href="${path}/Resource/comment/css/style.css">
    <link rel="stylesheet" href="${path}/Resource/DanmuPlayer/css/danmuplayer.css">

    <style>
        .t-h1 {
            line-height: 1.5;
            font-size: 24px;
            word-wrap: break-word;
            word-break: normal;
        }

        .column-link-box {
            right: 0;
            text-align: right;
            color: #bbb;
        }

        .pull-left {
            float: left !important
        }

        .column-link {
            font-size: 12px;
            color: #3ca5f6;
            text-align: center;
            line-height: 1;
            z-index: 10;
            margin-left: 20px;
        }

        .article-content-wrap {
            font-size: 16px;
            line-height: 30px;
            margin-top: 25px;
        }
    </style>
</head>
<body>

<!-- content -->
<div class="row" style="background: #e2e2e2">


    <!-- main col right -->
    <div class="col-sm-7" style="float: none;margin: 2% auto">

        <div class="panel panel-default">
            <div class="panel-body">
                <h1 class="t-h1">闪送、小罐茶：将单一元素推向极致的创业给我们什么启发？</h1>
                <br>
                <div class="column-link-box">
                    <span class="article-time pull-left">2017-05-30 16:30</span>
                    <span class="article-share pull-left">&nbsp;收藏87</span>
                    <span class="article-pl pull-left">&nbsp;&nbsp;评论16</span>
                    <a href="#" class="column-link" target="_blank">创业维艰</a> <i></i>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div id="danmup"></div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="panel-heading"><p style="font-size:20px;">
                    有些人和企业的厉害之处，在于从一个看似成熟、红海的领域，硬生生拓展出一片蓝海市场来，而且生意做到风生水起。</p></div>
                <div class="clearfix"></div>
                <hr>
                <div id="article_content" class="article-content-wrap">
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        有些人和企业的厉害之处，在于从一个看似成熟、红海的领域，硬生生拓展出一片蓝海市场来，而且生意做到风生水起。</p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        <br/></p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        而这种闯出一片新天地的方法，最常见的一种，就是将原有的产品或服务模式中的某个元素，推向极致，拓展出新的用户场景和产品价值，自然就拓展出了新的市场。</p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        <br/></p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        今天来分析三个例子，来看看这种"单一元素推向极致"的手段有多厉害。</p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        <br/></p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        <span style="font-weight:700;">第一个例子，是前段时间非常火爆的电话亭式KTV。</span></p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        <br/></p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        我不知道现在还有多少人经常去KTV唱歌。我能看到的是，在一线城市，传统的量贩式KTV市场一再萎缩，以钱柜、麦乐迪为代表的老企业日渐衰败，新的主打小户型的唱吧麦颂半死不活。长盛不衰此起彼伏的KTV也有，但那是俗称商K的夜总会式KTV，你懂的。</p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        <br/></p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        究其原因，现在娱乐的个性化和小群体化趋势日益明显，以前那种成群结队去唱歌，还要忍受别人五音不全的唱腔的娱乐形式，显得不够与时俱进。</p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        <br/></p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        但是，朋友情侣三两出行，还是有唱歌娱乐的需求的。电话亭式KTV应运而生。</p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        <br/></p>
                    <p style="color:#333333;font-family:Arial, 微软雅黑, &quot;font-size:16px;background-color:#FFFFFF;">
                        电话亭式KTV，把时间和空间两个元素推向极致。仅容纳两到三个人的私密空间，少至一首歌或者一刻钟的欢唱时间，充分利用碎片化时间和空间，让唱歌这件事不那么仪式感和处心积虑，随时兴起就可以来一发，多么愉快。何况，曲库、音响效果并不亚于传统的KTV，甚至还有所超越。</p>
                </div>
            </div>
        </div>

        <%--/attached/multFile/20180208\浙江网新恒天软件有限公司_针对资讯的用户建模和个性推荐系统.docx--%>
        <div class="panel panel-default">
            <div class="panel-heading"><h4 style="color: #4e4845">附件预览</h4></div>
            <div class="panel-body">
                <div class="list-group">
                    <a href="${path}/method/BlogEdit_toReadOnline.action" class="list-group-item" target="_blank">浙江网新恒天软件有限公司_针对资讯的用户建模和个性推荐系统.docx</a>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="commentAll">
                <!--评论区域 begin-->
                <div class="reviewArea clearfix">
                    <textarea class="content comment-input" placeholder="Please enter a comment&hellip;"
                              onkeyup="keyUP(this)"></textarea>
                    <a href="javascript:;" class="plBtn">评论</a>
                </div>
                <!--评论区域 end-->
                <!--回复区域 begin-->
                <div class="comment-show">
                    <div class="comment-show-con clearfix">
                        <div class="comment-show-con-img pull-left"><img
                                src="${path}/Resource/comment/images/header-img-comment_03.png" alt=""></div>
                        <div class="comment-show-con-list pull-left clearfix">
                            <div class="pl-text clearfix">
                                <a href="#" class="comment-size-name">张三 : </a>
                                <span class="my-pl-con">&nbsp;来啊 造作啊!</span>
                            </div>
                            <div class="date-dz">
                                <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                <div class="date-dz-right pull-right comment-pl-block">
                                    <a href="javascript:;" class="removeBlock">删除</a>
                                    <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                    <span class="pull-left date-dz-line">|</span>
                                    <a href="javascript:;" class="date-dz-z pull-left"><i
                                            class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>
                                </div>
                            </div>
                            <div class="hf-list-con"></div>
                        </div>
                    </div>
                </div>
                <!--回复区域 end-->
            </div>
        </div>

        <div class="panel panel-default">
            <p>推荐列表</p>
            <br>
            <br>
            <br>

        </div>

    </div>
</div><!--/row-->

<script type="text/javascript" src="${path}/Resource/common/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${path}/Resource/comment/js/jquery.flexText.js"></script>
<script src="${path}/Resource/DanmuPlayer/danmuplayer.js"></script>

<script type="text/javascript">
    $(function () {
        $("#danmup").danmuplayer({
            src: "${path}/attached/vedio/vedioFile/b6c53c15cae215559d6d8551bbdb2cb4.mp4",       //视频源
            width: 840,            //视频宽度
            height: 445            //视频高度
        });
    });

</script>

<!--textarea高度自适应-->
<script type="text/javascript">
    $(function () {
        $('.content').flexText();
    });
</script>
<!--textarea限制字数-->
<script type="text/javascript">
    function keyUP(t) {
        var len = $(t).val().length;
        if (len > 139) {
            $(t).val($(t).val().substring(0, 140));
        }
    }
</script>
<!--点击评论创建评论条-->
<script type="text/javascript">
    $('.commentAll').on('click', '.plBtn', function () {
        var myDate = new Date();
        //获取当前年
        var year = myDate.getFullYear();
        //获取当前月
        var month = myDate.getMonth() + 1;
        //获取当前日
        var date = myDate.getDate();
        var h = myDate.getHours();       //获取当前小时数(0-23)
        var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        if (m < 10) m = '0' + m;
        var s = myDate.getSeconds();
        if (s < 10) s = '0' + s;
        var now = year + '-' + month + "-" + date + " " + h + ':' + m + ":" + s;
        //获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        console.log(oSize);
        //动态创建评论模块
        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="${path}/Resource/comment/images/header-img-comment_03.png" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">David Beckham : </a> <span class="my-pl-con">&nbsp;' + oSize + '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + now + '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
        if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value', '').siblings('pre').find('span').text('');
        }
    });
</script>
<!--点击回复动态创建回复块-->
<script type="text/javascript">
    $('.comment-show').on('click', '.pl-hf', function () {
        //获取回复人的名字
        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        //回复@
        var fhN = '回复@' + fhName;
        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
        //显示回复
        if ($(this).is('.hf-con-block')) {
            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
            $(this).removeClass('hf-con-block');
            $('.content').flexText();
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding', '6px 15px');
            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
            //input框自动聚焦
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
        } else {
            $(this).addClass('hf-con-block');
            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
        }
    });
</script>
<!--评论回复块创建-->
<script type="text/javascript">
    $('.comment-show').on('click', '.hf-pl', function () {
        var oThis = $(this);
        var myDate = new Date();
        //获取当前年
        var year = myDate.getFullYear();
        //获取当前月
        var month = myDate.getMonth() + 1;
        //获取当前日
        var date = myDate.getDate();
        var h = myDate.getHours();       //获取当前小时数(0-23)
        var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        if (m < 10) m = '0' + m;
        var s = myDate.getSeconds();
        if (s < 10) s = '0' + s;
        var now = year + '-' + month + "-" + date + " " + h + ':' + m + ":" + s;
        //获取输入内容
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
        console.log(oHfVal)
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var oAllVal = '回复@' + oHfName;
        if (oHfVal.replace(/^ +| +$/g, '') == '' || oHfVal == oAllVal) {

        } else {
            $.getJSON("${path}/Resource/comment/json/pl.json", function (data) {
                var oAt = '';
                var oHf = '';
                $.each(data, function (n, v) {
                    delete v.hfContent;
                    delete v.atName;
                    var arr;
                    var ohfNameArr;
                    if (oHfVal.indexOf("@") == -1) {
                        data['atName'] = '';
                        data['hfContent'] = oHfVal;
                    } else {
                        arr = oHfVal.split(':');
                        ohfNameArr = arr[0].split('@');
                        data['hfContent'] = arr[1];
                        data['atName'] = ohfNameArr[1];
                    }

                    if (data.atName == '') {
                        oAt = data.hfContent;
                    } else {
                        oAt = '回复<a href="#" class="atName">@' + data.atName + '</a> : ' + data.hfContent;
                    }
                    oHf = data.hfName;
                });

                var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">' + oAt + '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + now + '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
                oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display', 'block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
            });
        }
    });
</script>
<!--删除评论块-->
<script type="text/javascript">
    $('.commentAll').on('click', '.removeBlock', function () {
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
        if (oT.siblings('.all-pl-con').length >= 1) {
            oT.remove();
        } else {
            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display', 'none')
            oT.remove();
        }
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

    })
</script>
<!--点赞-->
<script type="text/javascript">
    $('.comment-show').on('click', '.date-dz-z', function () {
        var zNum = $(this).find('.z-num').html();
        if ($(this).is('.date-dz-z-click')) {
            zNum--;
            $(this).removeClass('date-dz-z-click red');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').removeClass('red');
        } else {
            zNum++;
            $(this).addClass('date-dz-z-click');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').addClass('red');
        }
    })
</script>
</body>
</html>
