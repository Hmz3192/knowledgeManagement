<%--
  Created by IntelliJ IDEA.
  User: ZJNU-Hmz
  Date: 2018/1/13
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title>Ajax滚动加载数据</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            list-style: none;
            font-size: 14px;
        }
        /*
            box
        */
        .box {
            width: 795px;
            margin: 0 auto;
        }
        /*
            ul
        */
        .list ul {
            width: 100%;
            overflow: hidden;
        }
        /*
            item
        */
        .list ul li {
            width: 180px;
            height: 200px;
            margin-left: 15px;
            margin-bottom: 15px;
            float: left;
            background-color: #ccc;
            text-align: center;
            line-height: 200px;
            cursor: pointer;
        }
        /*
            item鼠标经过
        */
        .list ul li:hover {
            background-color: #e1e1e1;
        }
        /*
            加载更多
        */
        #loading {
            height: 50px;
            width: 765px;
            line-height: 50px;
            text-align: center;
            cursor: pointer;
            margin: 0 auto;
        }
        /*
            加载更多经过
        */
        #loading:hover {
            background-color: #cecece;
        }
    </style>
    <!-- 引入jquery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resource/js/jquery.js"></script>
    <!--  -->
    <script type="text/javascript">
        $(function(){
            //请求数据接口
            var url="${pageContext.request.contextPath}/json/page";
            //渲染数据集合dom
            var list=$("#list");
            //加载更多dom
            var loadingBtn=$("#loading");
            //是否需要加载
            var isLoad =true;
            //当前查询第几页
            var currentPage = 1;
            //每页数量
            var rows = 2;
            //没有更多数据
            var nomore_Text = '没有更多数据';
            /*
                请求数据接口
            */
            function loadData(){
                //发送ajax
                $.ajax({
                    //url
                    url: url,
                    //请求方式
                    type:'POST',
                    //参数
                    data: {currentPage:currentPage,rows:rows},
                    //成功回调
                    success: sucessCallback,
                    //失败回调
                    error: function(e, e2, e3){
                        //
                        alert('请求失败，原因：'+e3);
                    }
                });
            }
            /*
                成功回调函数
            */
            function sucessCallback(data){
                //当前页自增
                currentPage++;
                //
                var html = '',result = data.amounts, len = result.length,i = 0;
                //循环数据
                for(; i<len;i++){
                    var rs = result[i], title = rs.user,id=rs.id;
                    html+='<li data-id="'+id+'">'+title+'</li>';
                }
                //渲染数据
                list.append(html);
                //接口是否查询完毕
                if(data.total == data.currentPage || currentPage > data.total){
                    //数据全部加载完毕
                    isLoad = false;
                    //
                    loadingBtn.html(nomore_Text);
                }
            }
            /*
                判断是否要加载接口
            */
            function isScrollLoad(){
                //加载更多距离
                var btn_top = loadingBtn.offset().top;
                //窗体高度
                var window_height = $(window).height();
                //滚动距离
                var scroll_Top = $(window).scrollTop();
                //加载更多高度
                var loading_height = loadingBtn.height();
                //是否需要加载(底部距离是否小于窗口高度+滚动的距离)
                return btn_top < scroll_Top + window_height - (loading_height - 5) ? true : false;
            }
            /*
                滚动事件监听
            */
            $(window).scroll(function(){
                //是否滚动到底部
                var _needload = isScrollLoad();
                //
                if(_needload && isLoad){
                    //加载数据
                    loadData();
                }
            });

            /*
                页面加载完毕执行一次查询
            */
            window.onload = function(){
                //加载数据
                loadData();
            };

            /*
                点击加载更多
            */
            loadingBtn.click(function(){
                //是否加载数据
                if(isLoad)
                    loadData();
            });
        });
    </script>
</head>
<body>
<div class="box">
    <!-- list -->
    <div class="list">
        <ul id="list"></ul>
    </div>
    <!-- 加载更多 -->
    <div id="loading">点击加载更多</div>
</div>
</body>
</html>
