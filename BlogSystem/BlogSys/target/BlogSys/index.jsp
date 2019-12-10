<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/16 0016
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>首页_锦添个人博客 -</title>
    <meta name="keywords" content="个人博客,锦添个人博客" />
    <meta name="description" content="锦添的个人博客" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/base.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="css/m.css" rel="stylesheet">


    <%--360验证--%>
    <meta name="360-site-verification" content="612d1739e114b4a3ab9278e6d0f0eaa4" />
    <%--百度验证--%>
    <meta name="baidu-site-verification" content="SnMwNS0BlH" />

    <%--自动收录--%>
    <script>
        (function(){
            var src = "https://jspassport.ssl.qhimg.com/11.0.1.js?d182b3f28525f2db83acfaaf6e696dba";
            document.write('<script src="' + src + '" id="sozz"><\/script>');
        })();
    </script>
    <%--自定义css文件--%>
    <link href="css/pagination.css" type="text/css" rel="stylesheet" charset="UTF-8"/>

    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
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

    <%--自定义js文件--%>
    <script type="text/javascript" src="js/jquery.pagination2.js"></script>
    <script src="js/highlight.min.js" type="text/javascript"></script>






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
                <li><a href="javascript:void(0)" id="fw2">足球世界</a></li>
                <li><a href="javascript:void(0)" id="techBlog2">技术博客</a></li>
                <li><a href="javascript:void(0)" id="ss2">慢生活</a></li>
                <li><a href="toMyLife.do">时光轴</a></li>
            </ul>
        </div>
        <nav class="topnav" id="topnav">
            <ul>
                <li><a href="javascript:void(0)">网站首页</a></li>
                <li><a href="toAboutMe.do">关于我</a></li>
                <li><a href="toC.do">留言</a></li>
                <li><a href="javascript:void(0)" id="fw">足球世界</a></li>
                <li><a href="javascript:void(0)" id="techBlog">技术博客</a></li>
                <li><a href="javascript:void(0)" id="ss">慢生活</a></li>
                <li><a href="toMyLife.do">时光轴</a></li>

            </ul>
        </nav>
    </div>
</header>
<div class="picshow">
    <ul>
        <li><a href="toAboutMe.do"><i><img src="images/wallPaper/wall1.jpg"></i>
            <div class="font">
                <h3>关于我</h3>
            </div>
        </a></li>
        <li><a href="toAboutMe.do"><i><img src="images/wallPaper/wall2.jpg"></i>
            <div class="font">
                <h3>关于我</h3>
            </div>
        </a></li>
        <li><a href="toAboutMe.do"><i><img src="images/wallPaper/wall6.jpg"></i>
            <div class="font">
                <h3>关于我</h3>
            </div>
        </a></li>
        <li><a href="toAboutMe.do"><i><img src="images/wallPaper/wall7.jpg"></i>
            <div class="font">
                <h3>关于我</h3>
            </div>
        </a></li>
        <li><a href="toAboutMe.do"><i><img src="images/wallPaper/wall8.jpg"></i>
            <div class="font">
                <h3>关于我</h3>
            </div>
        </a></li>
    </ul>
</div>
<article>
    <div class="blogs">
        <div class="mt20"></div>
        <div  id="articleArea" class="AA"></div>
        <div class="pagelist" id="pagination"></div>
    </div>
    <div class="sidebar">
        <div class="about">
            <div class="avatar"> <img src="images/wallPaper/me.jpg" alt=""> </div>
            <p class="abname">Z | 锦添</p>
            <p class="abposition">三本大学，三流学生</p>
            <div class="abtext"> 要安静，爱音乐，just leave me alone！ </div>
        </div>
        <div class="search">
            <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
                <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
                <input name="show" value="title" type="hidden">
                <input name="tempid" value="1" type="hidden">
                <input name="tbname" value="news" type="hidden">
                <input name="Submit" class="input_submit" value="搜索" type="submit">
            </form>
        </div>
        <div class="cloud">
            <h2 class="hometitle">友情链接</h2>
            <ul>
                <a href="http://www.liqinglin0314.com">李庆林个人博客</a><a href="https://www.yezismile.com/">叶子个人博客</a> <a href="https://www.csdn.net/">CSDN</a> <a href="https://github.com/">GitHub</a> <a href="https://stackoverflow.com/">stackoverflow</a> <a href="http://www.zuidaima.com/">最代码</a> <a href="https://www.aliyun.com/?utm_content=se_1003074876">阿里云</a> <a href="https://www.cnblogs.com/">博客园</a> <a href="https://www.jianshu.com/">简书</a>
            </ul>
        </div>
        <div class="paihang">
            <h2 class="hometitle">点击排行</h2>
            <ul id="top10">
                <li><b><a href="getAritcleByAid.do?aid=100" target="_blank">锦添的个人博客</a></b>
                    <p><i><img src="images/t02.jpg"></i>锦添的个人博客，记录生活中值得被铭记的瞬间</p>
                </li>
            </ul>
        </div>
        <div class="paihang">
            <h2 class="hometitle">站长推荐</h2>
            <ul id="recommend">
                <li><b><a href="getAritcleByAid.do?aid=100" target="_blank">锦添的个人博客</a></b>
                    <p><i><img src="images/t02.jpg"></i>锦添的个人博客，记录生活中值得被铭记的瞬间</p>
                </li>

            </ul>
        </div>
        <div class="links">
            <h2 class="hometitle">技术支持</h2>
            <ul>
                <li><a href="www.baidu.com" title="百度">百度</a></li>
                <li><a href="https://gitee.com/" title="码云">码云</a></li>
                <li><a href="https://docs.spring.io/spring/docs/current/spring-framework-reference/web.html" title="spring">spring</a></li>
            </ul>
        </div>
        <div class="weixin">
            <h2 class="hometitle">官方微信</h2>
            <ul>
                <img src="images/wallPaper/wx.png">
            </ul>
        </div>
    </div>
</article>

<div id="pagination2" class="pn2"></div>
<div class="blank"></div>
<footer>
    <p>Design by <a href="/">锦添个人博客</a> <a href="/">滇ICP备19009393号</a></p>
</footer>
<script src="js/nav.js"></script>
</body>
</html>
<script>
    var totalData;
    var pageSize;
    var showData;
    $(function () {
        redisTest();
        loadTop10();
        loadRecommend();
        initLimitPage();
        initPagination(totalData,showData,pageSize);
        function initPagination(totalData,showData,pageCount) {
            //alert("initpagination starts");
            $.ajax({
                url:'getLimitPageBean.do',
                async:false,
                data:{pageSize:13,pageNum:1},

                success:function (msg) {

                    /*var jsonobj = JSON.parse(msg);
                    alert('json转换后的数据'+jsonobj.pages);*/
                    var jsonObject =  JSON.parse(msg);
                    //alert(jsonObject.total+'总数');
                    var jsonString = JSON.stringify(msg);
                    //alert('jsonString'+jsonString);
                    //var jsonobj= eval('(' + msg + ')');
                    pageCount = jsonObject.pages;
                    totalData = jsonObject.total;
                    showData = jsonObject.pageSize;
                    fuzhi(totalData,showData,pageCount);

                }
            })
            function fuzhi(totalData,showData,pageCount){
                //alert('赋值了');
                this.pageCount = pageCount;
                this.totalData = totalData;
                this.showData = showData;
            }
            //alert(pageCount+'总页数'+'总记录'+totalData+'每页数量'+showData);
            $("#pagination").pagination({

                /*totalData: 0, //数据总条数
                showData: 0, //每页显示的条数
                pageCount: 9, //总页数,默认为9
                current: 1, //当前第几页
                prevCls: 'prev', //上一页class
                nextCls: 'next', //下一页class
                prevContent: '<', //上一页内容
                nextContent: '>', //下一页内容
                activeCls: 'active', //当前页选中状态
                coping: false, //首页和尾页
                isHide: false, //当前页数为0页或者1页时不显示分页
                homePage: '', //首页节点内容
                endPage: '', //尾页节点内容
                keepShowPN: false, //是否一直显示上一页下一页
                mode: 'unfixed', //分页模式，unfixed：不固定页码数量，fixed：固定页码数量
                count: 4, //mode为unfixed时显示当前选中页前后页数，mode为fixed显示页码总数
                jump: false, //跳转到指定页数
                jumpIptCls: 'jump-ipt', //文本框内容
                jumpBtnCls: 'jump-btn', //跳转按钮
                jumpBtn: '跳转', //跳转按钮文本
                callback: function () {} //回调*/

                totalData:totalData,
                pageCount:13,
                showData:13,
                coping: true,
                homePage: '首页',
                endPage: '末页',
                prevContent: '上页',
                nextContent: '下页',
                jump: true, //跳转到指定页数
                jumpIptCls: 'jump-ipt', //文本框内容
                jumpBtnCls: 'jump-btn', //跳转按钮
                jumpBtn: '跳转', //跳转按钮文本
                callback:function(api){
                    var currentPage = api.getCurrent();
                    //alert(currentPage);
                    ajaxRequest(currentPage);

                }
            });
        }
        function ajaxRequest(currentPage){
            //alert("ajaxRequestStart");
            $.ajax({
                url:'limitList.do',
                data:{pageNum:currentPage},
                success:function (msg) {
                    innerH(msg);
                },
                error:function () {
                    alert('ajaxRequest failed');
                }
            })
        }
        function innerH(msg) {

            $(".AA").empty();
            var arr = eval(msg);
            $.each(arr,function (i,item) {

                $("#articleArea").append(" <li> <span class=\"blogpic\"><a href=\"\"><img src=\""+item.imgurl+"\"></a></span>\n" +
                    "            <h3 class=\"blogtitle\"><a href=\"getAritcleByAid.do?attribute="+item.attribute+"&aid="+item.aid+"\">"+item.title+"</a></h3>\n" +
                    "            <div class=\"bloginfo\">\n" +
                    "                <p>"+item.content2+"...</p>\n" +
                    "            </div>\n" +
                    "            <div class=\"autor\"><span class=\"lm\"><a href=\"/\" title=\""+item.attribute+"\" target=\"_blank\" class=\"classname\">"+item.attribute+"</a></span><span class=\"dtime\">"+item.writed+"</span><span class=\"viewnum\">浏览（<a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\">"+item.click+"</a>）</span><span class=\"readmore\"><a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\">阅读原文</a></span></div>\n" +
                    "        </li>\n");
            })


        }



        function initLimitPage(){
            $.ajax({
                url:'initLimitPage.do',
                success:function (msg) {
                    //alert(msg);
                    var arr = eval(msg);
                    $.each(arr,function (i,item) {

                        $("#articleArea").append(" <li> <span class=\"blogpic\"><a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\"><img src=\""+item.imgurl+"\"></a></span>\n" +
                            "            <h3 class=\"blogtitle\"><a href=\"getAritcleByAid.do?attribute="+item.attribute+"&aid="+item.aid+"\">"+item.title+"</a></h3>\n" +
                            "            <div class=\"bloginfo\">\n" +
                            "                <p>"+item.content2+"...</p>\n" +
                            "            </div>\n" +
                            "            <div class=\"autor\"><span class=\"lm\"><a href=\"/\" title=\""+item.attribute+"\" target=\"_blank\" class=\"classname\">"+item.attribute+"</a></span><span class=\"dtime\">"+item.writed+"</span><span class=\"viewnum\">浏览（<a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\">"+item.click+"</a>）</span><span class=\"readmore\"><a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\">阅读原文</a></span></div>\n" +
                            "        </li>\n");
                    })

                },error:function(){
                    alert("initLimitPage failed");
                }
            })
        }

        //绑定点击事件

        $('#fw').click(function () {
            //alert('fw Test');
            $('.AA').empty();
            //$('#pagination').hide();
            //$('#pagination').empty();
            $.ajax({
                url:'getAttributeAr.do',

                data:{attribute:'足球世界',pageNum:1},
                success:function (msg) {

                    var jsonObj2 =  JSON.parse(msg);
                    var total = jsonObj2.total;
                    var pageCount = jsonObj2.pageSize;
                    // alert(jsonObj2.total+'arr');
                    // alert('fomer'+total+'former'+pageCount);
                    reloadPagination2(total,pageCount,showData,'足球世界');

                    reloadPageContent('足球世界',1);






                }

            })
        })
        $('#fw2').click(function () {
            //alert('fw Test');
            $('.AA').empty();
            //$('#pagination').hide();
            //$('#pagination').empty();
            $.ajax({
                url:'getAttributeAr.do',

                data:{attribute:'足球世界',pageNum:1},
                success:function (msg) {

                    var jsonObj2 =  JSON.parse(msg);
                    var total = jsonObj2.total;
                    var pageCount = jsonObj2.pageSize;
                    // alert(jsonObj2.total+'arr');
                    // alert('fomer'+total+'former'+pageCount);
                    reloadPagination2(total,pageCount,showData,'足球世界');

                    reloadPageContent('足球世界',1);






                }

            })
        })

        /*页面内容重载*/
        function reloadPageContent(attribute,pageNum) {
            //alert('内容重载中的'+attribute+pageNum)
            $.ajax({
                url:'getAttributeAr.do',
                data:{attribute:attribute,pageNum:pageNum},
                success:function (msg) {
                    var jsonObj =  JSON.parse(msg);
                    $.each(jsonObj.list,function (i,item) {
                        $('#articleArea').append(" <li> <span class=\"blogpic\"><a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\"><img src=\""+item.imgurl+"\"></a></span>\n" +
                            "            <h3 class=\"blogtitle\"><a href=\"getAritcleByAid.do?attribute="+item.attribute+"&aid="+item.aid+"\">"+item.title+"</a></h3>\n" +
                            "            <div class=\"bloginfo\">\n" +
                            "                <p>"+item.content2+"...</p>\n" +
                            "            </div>\n" +
                            "            <div class=\"autor\"><span class=\"lm\"><a href=\"/\" title=\""+item.attribute+"\" target=\"_blank\" class=\"classname\">"+item.attribute+"</a></span><span class=\"dtime\">"+item.writed+"</span><span class=\"viewnum\">浏览（<a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\">"+item.click+"</a>）</span><span class=\"readmore\"><a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\">阅读原文</a></span></div>\n" +
                            "        </li>\n");
                    })
                },
                error:function () {
                    alert('sorry you failed');
                }
            })
        }

        /*分页重载*/
        function reloadPagination(total,pageCount,showData) {
            //alert('重载pagination中的total'+total+"jj"+pageCount);
            if(typeof total == 'number'){
                //alert('true');
            }
            $('#pagination').pagination({
                totalData: total,
                pageCount: 13,
                showData: 13,
                coping: true,
                homePage: '首页',
                endPage: '末页',
                prevContent: '上页',
                nextContent: '下页',
                jump: false, //跳转到指定页数
                jumpIptCls: 'jump-ipt', //文本框内容
                jumpBtnCls: 'jump-btn', //跳转按钮
                jumpBtn: '跳转', //跳转按钮文本
                callback: function (api) {
                    var currentPage = api.getCurrent();
                    //alert(currentPage);
                    // ajaxRequest(currentPage);
                    usualAjax('getAttributeAr.do','足球世界',currentPage);
                }
            })
        }

        /*分页重载二*/
        function reloadPagination2(total,pageCount,showData,attribute) {
            // alert('重载pagination中的total'+total+"jj"+pageCount);
            if(typeof total == 'number'){
                //alert('true');
            }
            $('#pagination').pagination({
                totalData: total,
                pageCount: 13,
                showData: 13,
                coping: true,
                homePage: '首页',
                endPage: '末页',
                prevContent: '上页',
                nextContent: '下页',
                jump: false, //跳转到指定页数
                jumpIptCls: 'jump-ipt', //文本框内容
                jumpBtnCls: 'jump-btn', //跳转按钮
                jumpBtn: '跳转', //跳转按钮文本
                callback: function (api) {
                    var currentPage = api.getCurrent();
                    //alert(currentPage);
                    // ajaxRequest(currentPage);
                    usualAjax('getAttributeAr.do',attribute,currentPage);
                }
            })
        }
        /*
                绑定事件结束
        */
        /* function initPagination(totalData,showData,pageCount) {
             alert("initpagination starts");
             $.ajax({
                 url:'getLimitPageBean.do',
                 async:false,
                 data:{pageSize:9,pageNum:1},

                 success:function (msg) {

                     /!*var jsonobj = JSON.parse(msg);
                     alert('json转换后的数据'+jsonobj.pages);*!/
                     var jsonObject =  JSON.parse(msg);
                     alert(jsonObject.total+'总数');
                     var jsonString = JSON.stringify(msg);
                     alert('jsonString'+jsonString);
                     //var jsonobj= eval('(' + msg + ')');
                     pageCount = jsonObject.pages;
                     totalData = jsonObject.total;
                     showData = jsonObject.pageSize;
                     fuzhi(totalData,showData,pageCount);

                 }
             })
             function fuzhi(totalData,showData,pageCount){
                 alert('赋值了');
                 this.pageCount = pageCount;
                 this.totalData = totalData;
                 this.showData = showData;
             }
             alert(pageCount+'总页数'+'总记录'+totalData+'每页数量'+showData);
             $("#pagination").pagination({

                 /!*totalData: 0, //数据总条数
                 showData: 0, //每页显示的条数
                 pageCount: 9, //总页数,默认为9
                 current: 1, //当前第几页
                 prevCls: 'prev', //上一页class
                 nextCls: 'next', //下一页class
                 prevContent: '<', //上一页内容
                 nextContent: '>', //下一页内容
                 activeCls: 'active', //当前页选中状态
                 coping: false, //首页和尾页
                 isHide: false, //当前页数为0页或者1页时不显示分页
                 homePage: '', //首页节点内容
                 endPage: '', //尾页节点内容
                 keepShowPN: false, //是否一直显示上一页下一页
                 mode: 'unfixed', //分页模式，unfixed：不固定页码数量，fixed：固定页码数量
                 count: 4, //mode为unfixed时显示当前选中页前后页数，mode为fixed显示页码总数
                 jump: false, //跳转到指定页数
                 jumpIptCls: 'jump-ipt', //文本框内容
                 jumpBtnCls: 'jump-btn', //跳转按钮
                 jumpBtn: '跳转', //跳转按钮文本
                 callback: function () {} //回调*!/

                 totalData:totalData,
                 pageCount:pageCount,
                 showData:showData,
                 coping: true,
                 homePage: '首页',
                 endPage: '末页',
                 prevContent: '上页',
                 nextContent: '下页',
                 jump: true, //跳转到指定页数
                 jumpIptCls: 'jump-ipt', //文本框内容
                 jumpBtnCls: 'jump-btn', //跳转按钮
                 jumpBtn: '跳转', //跳转按钮文本
                 callback:function(api){
                     var currentPage = api.getCurrent();
                     alert(currentPage);
                     ajaxRequest(currentPage);
                     /!*$.ajax({
                         url:'getLimitList.do',
                         data:{pageSize:5,pageNum:currentPage},
                         success:function (msg) {
                             var jsonobj= eval('(' + msg + ')');
                            // $("#articles").empty();
                             var arr = eval(msg);
                             alert('数组'+arr.list);
                             alert(jsonobj.list+'处理后的数组');
                             $.each(arr.list,function (i,item) {
                                 alert(i);
                                 $("#articles").append("<div class=\"one-atl\">\n" +
                                     "               <img alt=\"爱他们的时候我们像条狗\" src=\"images/1.jpg\" class=\"img f-l\" />\n" +
                                     "               <div class=\"con f-r\">\n" +
                                     "               <h3><a class=\"tle\" href=\"pic_detail.html?show/241\">"+item.title+"</a><span class=\"ath\"></span></h3>\n" +
                                     "           <h4 class=\"pb-mt10\">作者："+item.username+"</h4>\n" +
                                     "           <p class=\"f-l\">"+item.content.substring(1,70)+'......'+"</p>\n" +
                                     "           <div class=\"morewp f-l m-t-10\">\n" +
                                     "               <a class=\"f-r\" href=\"pic_detail.html?show/241\">详细</a>\n" +
                                     "               </div>\n" +
                                     "               </div>\n" +
                                     "               </div>\n" +
                                     "               <div class=\"ycjpline\"></div>");
                             })


                         }
                     })*!/

                 }
             });
         }
         function ajaxRequest(currentPage){
             alert("ajaxRequestStart");
             $.ajax({
                 url:'limitList.do',
                 data:{pageNum:currentPage},
                 success:function (msg) {
                     innerH(msg);
                 },
                 error:function () {
                     alert('ajaxRequest failed');
                 }
             })
         }
         function innerH(msg) {

             $(".AA").empty();
             var arr = eval(msg);
             $.each(arr,function (i,item) {

                 $("#articleArea").append(" <li> <span class=\"blogpic\"><a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\"><img src=\""+item.imgurl+"\"></a></span>\n" +
                     "            <h3 class=\"blogtitle\"><a href=\"getAritcleByAid.do?aid="+item.aid+"\">"+item.title+"</a></h3>\n" +
                     "            <div class=\"bloginfo\">\n" +
                     "                <p>"+item.content.substring(1,70)+"...</p>\n" +
                     "            </div>\n" +
                     "            <div class=\"autor\"><span class=\"lm\"><a href=\"/\" title=\""+item.attribute+"\" target=\"_blank\" class=\"classname\">"+item.attribute+"</a></span><span class=\"dtime\">"+item.writed+"</span><span class=\"viewnum\">浏览（<a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\">"+item.click+"</a>）</span><span class=\"readmore\"><a href=\"getAritcleByAid.do?attribute="+item.getattribute+"&aid="+item.aid+"\">阅读原文</a></span></div>\n" +
                     "        </li>\n");
             })


         }
         */





        function usualAjax(url,attribute,pageNum){
            $.ajax({
                url:url,
                dataType:'json',
                data:{attribute:attribute,pageNum:pageNum},
                success:function (msg) {

                    innerH(msg.list);
                },
                error:function () {
                    alert('usualAjax is failed');
                }
            })
        }



        /*
                techBlog Starts
        */

        $('#techBlog').click(function () {
            //alert('tech Test');
            $('.AA').empty();
            //$('#pagination').hide();
            //$('#pagination').empty();
            $.ajax({
                url:'getAttributeAr.do',

                data:{attribute:'技术博客',pageNum:1},
                success:function (msg) {

                    var jsonObj2 =  JSON.parse(msg);
                    var total = jsonObj2.total;
                    var pageCount = jsonObj2.pageSize;
                    // alert(jsonObj2.total+'arr');
                    // alert('fomer'+total+'former'+pageCount);
                    reloadPagination2(total,pageCount,showData,'技术博客');

                    reloadPageContent('技术博客',1);






                }

            })
        })
        $('#techBlog2').click(function () {
            //alert('tech Test');
            $('.AA').empty();
            //$('#pagination').hide();
            //$('#pagination').empty();
            $.ajax({
                url:'getAttributeAr.do',

                data:{attribute:'技术博客',pageNum:1},
                success:function (msg) {

                    var jsonObj2 =  JSON.parse(msg);
                    var total = jsonObj2.total;
                    var pageCount = jsonObj2.pageSize;
                    // alert(jsonObj2.total+'arr');
                    // alert('fomer'+total+'former'+pageCount);
                    reloadPagination2(total,pageCount,showData,'技术博客');

                    reloadPageContent('技术博客',1);






                }

            })
        })
        /*ssstarts*/
        $('#ss').click(function () {
            //alert('ss Test');
            $('.AA').empty();
            //$('#pagination').hide();
            //$('#pagination').empty();
            $.ajax({
                url:'getAttributeAr.do',

                data:{attribute:'碎言碎语',pageNum:1},
                success:function (msg) {

                    var jsonObj2 =  JSON.parse(msg);
                    var total = jsonObj2.total;
                    var pageCount = jsonObj2.pageSize;
                    // alert(jsonObj2.total+'arr');
                    // alert('fomer'+total+'former'+pageCount);
                    reloadPagination2(total,pageCount,showData,'碎言碎语');

                    reloadPageContent('碎言碎语',1);






                }

            })
        })


        $('#ss2').click(function () {
            //alert('ss Test');
            $('.AA').empty();
            //$('#pagination').hide();
            //$('#pagination').empty();
            $.ajax({
                url:'getAttributeAr.do',

                data:{attribute:'碎言碎语',pageNum:1},
                success:function (msg) {

                    var jsonObj2 =  JSON.parse(msg);
                    var total = jsonObj2.total;
                    var pageCount = jsonObj2.pageSize;
                    // alert(jsonObj2.total+'arr');
                    // alert('fomer'+total+'former'+pageCount);
                    reloadPagination2(total,pageCount,showData,'碎言碎语');

                    reloadPageContent('碎言碎语',1);






                }

            })
        })
        //load recommend
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
        //load top10
        function loadTop10() {
            $.ajax({
                url:'getRecommendAndTop.do',
                dataType:'json',
                data:{attribute:'top10'},
                success:function (msg) {
                    $.each(msg,function (i,item) {
                        //alert(item.content+'内容'+'item.aid'+item.aid);

                        $('#top10').append(' <li><b><a href="getAritcleByAid.do?attribute='+item.attribute+'&aid='+item.aid+'" target="_blank">'+item.title+'</a></b>\n' +
                            '                    <p><i><img src="'+item.imgurl+'"></i>'+item.content2+'</p>\n' +
                            '                </li>\n' +
                            '               ');
                    })
                },error:function () {
                    alert('loadTop10 failed');
                }
            })
        }


        //test();
        //test method
        function test() {
            $.ajax({
                url:'getLimitPageBean.do',
                success:function (msg) {
                    //alert(msg);
                },
                error:function () {
                    alert('failed');
                }
            })
        }


        /*测试redis*/
        function redisTest() {
            $.ajax({
                url:'getAllArticle.do',
                success:function (msg) {
                    //alert(msg);
                },
                error:function () {
                    alert('failed');
                }
            })
        }

    })
</script>