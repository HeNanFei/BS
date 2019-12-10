<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/18 0018
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>内容页_锦添个人博客 -</title>
    <meta name="keywords" content="" />
    <meta name="description" content="锦添个人博客" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../css/base.css" rel="stylesheet">
    <link href="../../css/index.css" rel="stylesheet">
    <link href="../../css/m.css" rel="stylesheet">
    <%--自定义js文件--%>
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="js/ueditor/zh-cn.js"></script>

    <script src="../../js/jquery-2.1.1.min.js"></script>
    <!--[if lt IE 9]>
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
                <li><a href="javascript:void(0)">网站首页</a></li>
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
                <li><a href="javascript:void(0)">网站首页</a></li>
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
    <h1 class="t_nav"><span id="locations">您现在的位置是：首页 > ${Article.attribute}</span><a href="/" class="n1">网站首页</a><a href="/" class="n2">${Article.attribute}</a></h1>
    <div class="infos">
        <div class="newsview">
            <h3 class="news_title">${Article.title}</h3>
            <div class="news_author"><span class="au01"><a href="mailto:dancesmiling@qq.com" id="writerName"></a></span><span class="au02" id="writed"></span><span class="au03">共<b id="click"><script src="/e/public/ViewClick/?classid=5&amp;id=816&amp;addclick=1"></script></b>人围观</span></div>
            <div class="tags"><a href="/e/tags/?tagname=%B8%F6%C8%CB%B2%A9%BF%CD&amp;tempid=13" target="_blank">${Article.attribute}</a> &nbsp; <a href="/e/tags/?tagname=%D0%A1%CA%C0%BD%E7&amp;tempid=13" target="_blank">小世界</a></div>
            <div class="news_infos" id="articleContent">
                ${Article.content}
                <%--文章内容--%>
              <%--  <textarea id="ueditoroa" style="width: 100%;height: 100%"></textarea>--%>
            </div>
        </div>
        <div class="share"> </div>
        <div class="nextinfo">
            <p id="last"></p>
            <p id="next"></p>
<%--
            <p>测试篇：${url}</p>
--%>

        </div>
        <div class="otherlink">

        </div>
        <div class="news_pl">
            <h2>文章评论</h2>
            <ul>
                <div class="gbko" id="commentArea">
                    <div id="SOHUCS" sid="${Article.aid}"></div>

                    <script charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/changyan.js" ></script>


                </div>
            </ul>
        </div>
    </div>




    <div class="sidebar">
        <div class="search">
            <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
                <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
                <input name="show" value="title" type="hidden">
                <input name="tempid" value="1" type="hidden">
                <input name="tbname" value="news" type="hidden">
                <input name="Submit" class="input_submit" value="搜索" type="submit">
            </form>
        </div>
        <div class="lmnav">
            <h2 class="hometitle">栏目导航</h2>
            <ul class="navbor">
                <li><a href="index.jsp">网站首页</a></li>
                <li><a href="toAttributeList.do?attribute=足球世界" >足球世界</a></li>

                <ul>
                    <li><a href="toAttributeList.do?attribute=碎言碎语">慢生活</a></li>

                    <li><a href="toAttributeList.do?attribute=技术博客" >技术博客</a></li>

                </ul>
                </li>
                <li><a href="toAboutMe.do">关于我</a>
                    <ul>
                        <li><a href="toC.do">留言</a></li>

                    </ul>
                </li>
                <li><a href="toMyLife.do" >时光轴</a></li>
            </ul>
        </div>
        <div class="paihang">
            <h2 class="hometitle">点击排行</h2>
            <ul id="top10">

            </ul>
        </div>
        <div class="cloud">
            <h2 class="hometitle">友情链接</h2>
            <ul>
                <a href="http://www.liqinglin0314.com">李庆林个人博客</a>
                <a href="https://www.yezismile.com/">叶子个人博客</a> <a href="https://www.csdn.net/">CSDN</a> <a href="https://github.com/">GitHub</a> <a href="https://stackoverflow.com/">stackoverflow</a> <a href="http://www.zuidaima.com/">最代码</a> <a href="https://www.aliyun.com/?utm_content=se_1003074876">阿里云</a> <a href="https://www.cnblogs.com/">博客园</a> <a href="https://www.jianshu.com/">简书</a><a href="/">索尼</a> <a href="/">华维荣耀</a> <a href="/">三星</a> <a href="/">索尼</a>
            </ul>
        </div>
        <div class="paihang">
            <h2 class="hometitle">站长推荐</h2>
            <ul id="recommend">

            </ul>
        </div>
        <div class="weixin">
            <h2 class="hometitle">官方微信</h2>
            <ul>
                <img src="../../images/wallPaper/wx.png">
            </ul>
        </div>
        <%--advertisement--%>
        <div class="ad" id="left_flow2">  </div>
    </div>
</article>
<footer>
    <p>Design by <a href="/">锦添个人博客</a> <a href="/">滇ICP备19009393号</a></p>
</footer>
<script src="js/nav.js"></script>
<script type="text/javascript">
    jQuery.noConflict();
    jQuery(function() {
        var elm = jQuery('#left_flow2');
        var startPos = jQuery(elm).offset().top;
        jQuery.event.add(window, "scroll", function() {
            var p = jQuery(window).scrollTop();
            jQuery(elm).css('position',((p) > startPos) ? 'fixed' : '');

            jQuery(elm).css('top',((p) > startPos) ? '0' : '');
        });
    });
    $(function () {
       // alert('it starts');
        var ue = UE.getEditor('ueditoroa',{
            toolbars: [
                []
            ]



        })
        loadNext();
        loadRecommend();
        loadTop10();
        insertArticleContent();
        loadComment();





        /*setTimeout(function () {
            insertCommment();
        },200)*/
        function insertArticleContent() {

            $.ajax({
                url:'toLatestPageACC.do',
                dataType:'json',
                success:function (msg) {
                    $('#writerName').html(msg.acc.username);
                    $('#writed').html(msg.acc.writed);
                    $('#click').html(msg.acc.click);
                    //$('#articleContent').html(msg.acc.content);

                        ue.setContent(msg.acc.content);


                    //alert(msg.acc.content);

                },

                error:function () {
                    alert('toLatestPageACC failed');
                }
            })
        }

            function insertCommment() {
                var appid = 'cyuv7Yg5V';
                var conf = 'd315fd8f5c8f4b6ca59bf16a0c372c0d';
                var width = window.innerWidth || document.documentElement.clientWidth;
                if (width < 960) {
                    window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>');
                } else {
                    var loadJs = function (d, a) {
                        var c = document.getElementsByTagName("head")[0] || document.head || document.documentElement;
                        var b = document.createElement("script");
                        b.setAttribute("type", "text/javascript");
                        b.setAttribute("charset", "UTF-8");
                        b.setAttribute("src", d);
                        if (typeof a === "function") {
                            if (window.attachEvent) {
                                b.onreadystatechange = function () {
                                    var e = b.readyState;
                                    if (e === "loaded" || e === "complete") {
                                        b.onreadystatechange = null;
                                        a()
                                    }
                                }
                            } else {
                                b.onload = a
                            }
                        }
                        c.appendChild(b)
                    };
                    loadJs("http://changyan.sohu.com/upload/changyan.js", function () {
                        window.changyan.api.config({
                            appid: appid,
                            conf: conf
                        })
                    });
                }
            }

        function loadTop10() {
            $.ajax({
                url:'getRecommendAndTop.do',
                dataType:'json',
                data:{attribute:'top10'},
                success:function (msg) {
                    $.each(msg,function (i,item) {
                        //alert(item.content+'内容'+'item.aid'+item.aid);

                        $('#top10').append(' <li><b><a href="getAritcleByAid.do?aid='+item.aid+'" target="_blank">'+item.title+'</a></b>\n' +
                            '                    <p><i><img src="'+item.imgurl+'"></i>'+item.content2.substring(1,40)+'</p>\n' +
                            '                </li>\n' +
                            '               ');
                    })
                },error:function () {
                    alert('loadTop10 failed');
                }
            })
        }

        function loadRecommend() {
            $.ajax({
                url:'getRecommendAndTop.do',
                dataType:'json',
                data:{attribute:'站长推荐'},
                success:function (msg) {
                    $.each(msg,function (i,item) {
                        // alert(item.content+'内容'+'item.aid'+item.aid);

                        $('#recommend').append(' <li><b><a href="getAritcleByAid.do?attribute='+item.attribute+'aid='+item.aid+'" target="_blank">'+item.title+'</a></b>\n' +
                            '                    <p><i><img src="'+item.imgurl+'"></i>'+item.content2+'</p>\n' +
                            '                </li>\n' +
                            '               ');
                    })
                },error:function () {
                    alert('loadRecomend failed');
                }
            })
        }
        function loadNext() {
            $.ajax({
                url:'loadNextAndLast.do',
                dataType:'json',
                success:function (msg) {
                    //alert(msg.status+'状态');
                    //alert('接收数据'+JSON.stringify(msg));
                   if(msg.status =='(next)'){
                       $('#next').append("下一篇：<a href='../getAritcleByAid.do?attribute="+msg.last.attribute+"&aid="+msg.next.aid+"'>"+msg.next.title+"</a>");
                   } if(msg.status == ('last')){
                        $('#last').append("上一篇：<a href='../getAritcleByAid.do?attribute="+msg.last.attribute+"&aid="+msg.last.aid+"'>"+msg.last.title+"</a>");
                    }if(msg.status == ('true')){
                        $('#last').append("上一篇：<a href='../getAritcleByAid.do?attribute="+msg.last.attribute+"&aid="+msg.last.aid+"'>"+msg.last.title+"</a>");
                        $('#next').append("下一篇：<a href='../getAritcleByAid.do?attribute="+msg.next.attribute+"&aid="+msg.next.aid+"'>"+msg.next.title+"</a>");
                    }

                },error:function () {
                    alert('loadNext failed');
                }
            })
        }



    })
    function loadComment() {

            window.changyan.api.config({
                appid: 'cyuv7Yg5V',
                conf: 'prod_27d77078ffcf2cf377bf2a87c5631e7c'
            })

    }

</script>
</body>
</html>
