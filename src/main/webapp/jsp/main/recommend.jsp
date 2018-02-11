<%--
  Created by IntelliJ IDEA.
  User: 锴
  Date: 2018/2/11
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
</head>
/**
* 推荐页面style

*/
<style>
    svg {
        vertical-align: middle;
        margin-right: 4px;
    }
    ul li{
        list-style: none;
    }
    body {
        padding: 0;
        margin: 0;
        font-family: "微软雅黑";
    }
    .box{
        width: 700px;
        height: 188px;
    }
    .box dd{
        margin:20px ;

    }
    .box dd ul{
        overflow: hidden;
        display: inline-block;
        margin-top: -3px;
    }
    .box dd ul li{
        float: left;
        margin-right: 16px;
        font-size: 14px;
        color: #ccc;
        line-height: 30px;
    }
    .box dd h2{
        font-size: 20px;
        color: #2c3033;
        font-weight: bold;
        margin-bottom: 12px;
        line-height: 28px;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
    }
    .box dd .summary {
        font-size: 14px;
        color: #8e959a;
        line-height: 24px;
        margin-bottom: 10px;
        -ms-word-break: break-all;
        word-break: break-all;
        white-space: normal!important;
    }
    .box dd .user_name {
        color: #888;
        line-height: 30px;
    }
    .box dd .visited_num {
        color: #888;
        line-height: 30px;
    }

    .box dd .visited_num span{
        color: #ccc;

    }
</style>
<body>
<!--一条推荐总的div-->
<div class="box">
    <!-- 内容dd标签 -->
    <dd>
        <!-- 主题  -->
        <h2>创造前端最前沿的技术---渐进式WEBAPP</h2>
        <!-- 内容简介-->
        <div class="summary">
            你好，我系古天乐 ，巫师渣渣辉，贪玩蓝月，这是一个你没有 玩过的船新版本
            只要玩5分钟，你舅舅舅会干我一样，岸上这款游戏。
        </div>
        <!--作者和阅读量-->
        <ul>
            <li >作者:</li>
            <!-- 作者名字  -->
            <li class="user_name">wk</li>
            <li class="visited_num">
                <!--矢量图形，描绘 book 图标，表示阅读量 -->
                <svg class="icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"
                     width="16" height="16" fill="#ccc">
                    <path d="M988.16 240.64c0-5.12-2.56-11.52-6.4-15.36-2.56-2.56-51.2-55.04-135.68-81.92-32-10.24-64-15.36-96-15.36-97.28 0-181.76 46.08-235.52 84.48-55.04-39.68-139.52-85.76-236.8-85.76-32 0-65.28 5.12-96 15.36C97.28 168.96 49.92 224 47.36 226.56c-3.84 3.84-5.12 8.96-5.12 15.36v546.56l60.16 71.68c3.84 8.96 12.8 15.36 21.76 15.36 3.84 0 7.68 0 10.24-2.56 19.2-5.12 120.32-29.44 199.68-29.44 37.12 0 64 5.12 79.36 15.36 7.68 5.12 11.52 10.24 12.8 16.64 0 12.8 10.24 23.04 23.04 23.04h21.76c24.32 0 61.44 0 98.56-2.56h5.12c10.24 0 20.48-7.68 23.04-17.92 2.56-10.24 7.68-16.64 17.92-23.04 16.64-8.96 42.24-14.08 76.8-14.08 78.08 0 171.52 24.32 198.4 32 3.84 1.28 7.68 2.56 11.52 2.56 8.96 0 17.92-5.12 21.76-14.08l64-72.96V240.64zM88.32 744.96V250.88c14.08-14.08 52.48-46.08 107.52-64 26.88-8.96 53.76-12.8 81.92-12.8 70.4 0 142.08 26.88 213.76 79.36v477.44c-38.4-23.04-88.32-34.56-149.76-34.56-32 0-66.56 3.84-102.4 10.24-60.16 8.96-115.2 26.88-151.04 38.4zm805.12 79.36c-20.48-5.12-61.44-15.36-106.24-23.04-35.84-5.12-66.56-7.68-94.72-7.68-43.52 0-76.8 6.4-101.12 20.48-15.36 8.96-26.88 20.48-33.28 34.56-33.28 1.28-65.28 2.56-87.04 2.56h-3.84c-6.4-12.8-15.36-24.32-29.44-32-23.04-15.36-58.88-21.76-106.24-21.76-76.8 0-165.12 19.2-200.96 28.16l-29.44-35.84c51.2-17.92 148.48-47.36 240.64-47.36 70.4 0 122.88 17.92 153.6 52.48l2.56 2.56 1.28 1.28 1.28 1.28 1.28 1.28h1.28l2.56 1.28h11.52l2.56-1.28h1.28s1.28 0 1.28-1.28h1.28s1.28 0 1.28-1.28h1.28l2.56-2.56c30.72-37.12 81.92-56.32 152.32-56.32 39.68 0 122.88 6.4 240.64 49.92l-28.16 34.56zm47.36-79.36c-35.84-14.08-90.88-32-152.32-43.52-37.12-6.4-71.68-10.24-103.68-10.24-60.16 0-110.08 12.8-148.48 37.12V253.44c70.4-51.2 142.08-78.08 212.48-78.08 28.16 0 55.04 3.84 81.92 12.8 56.32 17.92 94.72 49.92 110.08 64v492.8z"></path>
                </svg>
                <!--阅读数量 -->
                <span>9999</span>
            </li>
        </ul>
    </dd>
</div>

</body>
</html>

