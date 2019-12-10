<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/26 0026
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>关于_锦添个人博客 - </title>
    <meta name="keywords" content="锦添" />
    <meta name="description" content="锦添个人博客" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../css/base.css" rel="stylesheet">
    <link href="../../css/index.css" rel="stylesheet">
    <link href="../../css/m.css" rel="stylesheet">
    
    <%--自定义js--%>
    <script src="../../js/jquery-3.3.1.min.js"></script>


    <link href="../../js/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../js/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
    <script type="text/javascript">
        SyntaxHighlighter.all();
    </script>
    
    
    <script src="../../js/modernizr.js"></script>
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
    <h1 class="t_nav"><span>木末芙蓉花，山中发红萼。涧户寂无人，纷纷开且落。</span><a href="/" class="n1">网站首页</a><a href="/" class="n2">关于我</a></h1>
    <div class="ab_box">
        <div class="leftbox">
            <div class="newsview">
                <div class="news_infos"id="aboutMe">
                    


                </div>
            </div>
        </div>
        <div class="rightbox">
            <div class="aboutme">
                <h2 class="hometitle">关于我</h2>
                <div class="avatar"> <img src="../../images/wallPaper/me.jpg"> </div>
                <div class="ab_con">
                    <p>网名：Z | 锦添</p>
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
<script>
    $(function () {
        loadAboutme();
    })
    function loadAboutme() {
        $.ajax({
            url:'getPersonal.do',
            data:{attribute:'个人简介'},
            dataType:'json',
            success:function (msg) {
                //alert(msg);
                $('#aboutMe').append(msg);
            },
            error:function () {
                alert('getPersonal failed');
            }

        })
    }
</script>