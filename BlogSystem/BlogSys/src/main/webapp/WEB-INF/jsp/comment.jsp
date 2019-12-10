<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/24 0024
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>留言_锦添个人博客 - </title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../css/base.css" rel="stylesheet">
    <link href="../../css/index.css" rel="stylesheet">
    <link href="../../css/m.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/modernizr.js"></script>
    <![endif]-->
    <script>
        window.onload = function ()
        {
            var oH2 = document.getElementsByTagName("h2")[0];
            var oUl = document.getElementsByTagName("ul")[0];
            oH2.onclick = function ()
            {
                var style = oUl.style;
                style.display = style.display == "block" ? "none" : "block";
                oH2.className = style.display == "block" ? "open" : ""
            }
        }
    </script>
</head>
<body>
<header>
    <div class="tophead">
        <div class="logo"><a href="/">锦添个人博客</a></div>
        <div id="mnav">
            <h2><span class="navicon"></span></h2>
            <ul>
                <li><a href="index.jsp">网站首页</a></li>
                <li><a href="toAboutMe.do">关于我</a></li>
                <li><a href="toC.do">留言</a></li>
                <li><a href="toAttributeList.do?attribute=足球世界" id="fw2">足球世界</a></li>
                <li><a href="toAttributeList.do?attribute=技术博客" id="techBlog2">技术博客</a></li>
                <li><a href="toAttributeList.do?attribute=碎言碎语" id="ss2">慢生活</a></li>
                <li><a href="toMyLife.do">时光轴</a></li>
            </ul>
        </div>
        <nav class="topnav" id="topnav">
            <ul>
                <li><a href="index.jsp">网站首页</a></li>
                <li><a href="toAboutMe.do">关于我</a></li>
                <li><a href="toC.do">留言</a></li>
                <li><a href="toAttributeList.do?attribute=足球世界" id="fw">足球世界</a></li>
                <li><a href="toAttributeList.do?attribute=技术博客" id="techBlog">技术博客</a></li>
                <li><a href="toAttributeList.do?attribute=碎言碎语" id="ss">慢生活</a></li>
                <li><a href="toMyLife.do">时光轴</a></li>
            </ul>
        </nav>
    </div>
</header>
<article>
    <h1 class="t_nav"><span>因为爱自由，所以情缘被束缚</span><a href="/" class="n1">网站首页</a><a href="/" class="n2">留言</a></h1>
    <div class="ab_box">
        <div class="leftbox">
            <div class="newsview">
                <div class="news_infos">
                    <%--畅言插件--%>
                        <div id="SOHUCS" sid="${Article.aid}" ></div>
                        <script type="text/javascript">
                            (function(){
                                var appid = 'cyuv7Yg5V';
                                var conf = 'prod_27d77078ffcf2cf377bf2a87c5631e7c';
                                var width = window.innerWidth || document.documentElement.clientWidth;
                                if (width < 960) {
                                    window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("http://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>
                   <%-- 畅言插件结束--%>
                </div>
            </div>
        </div>
        <div class="rightbox">
            <div class="aboutme">
                <h2 class="hometitle">关于我</h2>
                <div class="avatar"> <img src="../../images/wallPaper/me.jpg"> </div>
                <div class="ab_con">
                    <p>网名：zhang | 锦添</p>
                    <p>职业：半死不活的学生 </p>
                    <p>个人微信：a15159085231</p>
                    <p>邮箱：872060821@qq.com</p>
                </div>
            </div>
            <div class="weixin">
                <h2 class="hometitle">微信关注</h2>
                <ul>
                    <img src="../../images/wallPaper/wx.png">
                </ul>
            </div>
        </div>
    </div>
</article>
<footer>
    <p>Design by <a href="/">锦添个人博客</a> <a href="/">滇ICP备19009393号</a></p>
</footer>
<script src="js/nav.js"></script>
</body>
</html>
