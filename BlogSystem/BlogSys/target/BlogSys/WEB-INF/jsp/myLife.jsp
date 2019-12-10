<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/1 0001
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>锦添的个人博客</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="keywords" content="锦添的个人博客">
    <meta name="description" content="锦添的个人博客">
    <LINK rel="Bookmark" href="favicon.ico" >
    <LINK rel="Shortcut Icon" href="favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../..//staticRes/js/html5shiv.js"></script>
    <script type="text/javascript" src="../..//staticRes/js/respond.min.js"></script>

    <!--自定义css-->
    <link href="../../css/base.css" rel="stylesheet">
    <link href="../../css/index.css" rel="stylesheet">
    <link href="../../css/m.css" rel="stylesheet">

    <%--自定义js文件--%>
    <script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.pagination2.js"></script>
    <script src="../../js/highlight.min.js" type="text/javascript"></script>


    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../../plugin/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../../plugin/Hui-iconfont/1.0.8/iconfont.min.css" />
    <link rel="stylesheet" type="text/css" href="../../css/common.css" />
    <link rel="stylesheet" type="text/css" href="../../plugin/pifu/pifu.css" />
    <link rel="stylesheet" type="text/css" href="../../css/timeline.css" />
    <!--[if lt IE 9]>
    <link href="/staticRes/lib/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
    <![endif]-->
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } function showSide(){$('.navbar-nav').toggle();}</script>
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container cl">


            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:void(0);" onclick="showSide();">&#xe667;</a>
            <nav class="nav navbar-nav nav-collapse w_menu" role="navigation">
                <ul class="cl">

                </ul>
            </nav>
            <nav class="navbar-nav navbar-userbar hidden-xs hidden-sm " style="top: 0;">
                <ul class="cl">
                    <li class="userInfo dropDown dropDown_hover">
                        <!--<a href="javascript:;" ><img class="avatar radius" src="img/40.jpg" alt="丶似浅 "></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="/app/loginOut">退出</a></li>
                        </ul>-->
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<!--导航条-->
<nav class="breadcrumb">
    <div class="container"><i class="Hui-iconfont">&#xe67f;</i> <a href="index.jsp" class="c-primary">首页</a> <span class="c-gray en">&gt;</span> <span class="c-gray">时光轴</span></div>
</nav>

<section class="container mt-20">
    <div class="container-fluid">
        <div class="timeline">
            <div  id="timeArea" class="AA"></div>


        </div>
    </div>

</section>
<div>
    <div class="pagelist" id="pagination"></div>

</div>
<footer class="footer mt-20">
    <div class="container-fluid" id="foot">
        <p> <br>
            <a href="#" target="_blank">滇ICP备19009393号</a>  <br>
        </p>
    </div>
</footer>
<script type="text/javascript" src="../../plugin/layer/3.0/layer.js"></script>
<script type="text/javascript" src="../../plugin/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="../../plugin/pifu/pifu.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script> $(function(){ $(window).on("scroll",backToTopFun); backToTopFun(); }); </script>
<script>
    $(function () {
        //alert('heheheh');
        //on scolling, show/animate timeline blocks when enter the viewport
        $(window).on('scroll', function () {
            $('.cd-timeline-block').each(function () {
                if ($(this).offset().top <= $(window).scrollTop() + $(window).height() * 0.75 && $(this).find('.cd-timeline-img').hasClass('is-hidden')) {
                    $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
                }
                if ($(window).scrollTop() - $(this).offset().top > 0) {
                    $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden').removeClass('bounce-in');
                }

            });
            $('.cd-timeline-block').each(function(){
                if($(this).offset().top < $(window).scrollTop()+$(window).height()*0.75) {
                    $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden');
                }
            });
        });



    });

</script>
<script>
    var totalData;
    var pageSize;
    var showData;
    $(function () {
        loadTime();
        initPagination(totalData,showData,pageSize);
        function loadTime() {
            $.ajax({
                url:'getTime.do',
                data:{pageNum:1},
                dataType:'json',
                success:function (msg) {

                    $.each(msg.list,function (i,item) {
                       // alert(item.aid);
                        $('#timeArea').append(' <div class="cd-timeline-block">\n' +
                            '                <div class="cd-timeline-img cd-picture">\n' +
                            '                    <img src="css/timeline/cd-icon-location.svg" alt="position">\n' +
                            '                </div>\n' +
                            '                <div class="cd-timeline-content">\n' +
                            '                    <h4>'+item.title+'</h4>\n' +
                            '                    <p>'+item.content2+'</p>\n' +
                            '                    <a href="http://www.wfyvv.com" class="f-r"><input class="btn btn-success size-S" type="button" value="更多"></a>\n' +
                            '                    <span class="cd-date">'+item.writed+'</span>\n' +
                            '                </div>\n' +
                            '            </div>\n')
                    })

                },error:function(){
                    alert("initLimitPage failed");
                }
            })
        }
        function initPagination(totalData,showData,pageCount) {
            //alert("initpagination starts");
            $.ajax({
                url:'getTime.do',
                async:false,
                data:{pageSize:12,pageNum:1},

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
            $("#pagination").pagination({

                totalData:totalData,
                pageCount:12,
                showData:12,
                coping: true,
                homePage: '首页',
                endPage: '末页',
                prevContent: '上页',
                nextContent: '下页',
                jump: false, //跳转到指定页数
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
                url:'getTime.do',
                dataType:'json',
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

            $.each(msg.list,function (i,item) {

                $('#timeArea').append(' <div class="cd-timeline-block">\n' +
                    '                <div class="cd-timeline-img cd-picture">\n' +
                    '                    <img src="css/timeline/cd-icon-location.svg" alt="position">\n' +
                    '                </div>\n' +
                    '                <div class="cd-timeline-content">\n' +
                    '                    <h4>'+item.title+'</h4>\n' +
                    '                    <p>'+item.content2+'</p>\n' +
                    '                    <a href="http://www.wfyvv.com" class="f-r"><input class="btn btn-success size-S" type="button" value="更多"></a>\n' +
                    '                    <span class="cd-date">'+item.writed+'</span>\n' +
                    '                </div>\n' +
                    '            </div>\n');
            })


        }


    })

</script>
</body>
</html>
