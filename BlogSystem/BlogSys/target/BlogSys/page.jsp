<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/19 0019
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="js/ueditor/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 单页信息</strong></div>
    <div class="body-content">
        <form  class="form-x" enctype="multipart/form-data" id="formData" method="post">
            <div class="form-group">
                <div class="label">
                    <label>标题：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="title" value=""  id="title"/>
                    <div class="tips"></div>
                </div>

            </div>
            <div class="form-group">
                <div class="label">
                    <label>分类标题：</label>
                </div>
                <div class="field">
                    <select name="cid" class="input w50" id="attribute">
                        <option value="">请选择分类</option>
                        <option value="技术博客">技术博客</option>
                        <option value="碎言碎语">碎言碎语</option>
                        <option value="足球世界">足球世界</option>
                        <option value="产品分类">产品分类</option>
                        <option value="个人简介">个人简介</option>
                        <option value="top10">前十</option>
                        <option value="站长推荐">站长推荐</option>
                        <option value="时光轴">时光轴</option>
                    </select>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>图片：</label>
                </div>
                <div class="field">
                    <input type="file" id="file" name="file" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
                    <input type="button"  class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
                    <div class="tipss">图片尺寸：450*300</div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>内容：</label>
                </div>
                <div class="field">
                    <textarea name="content" id="editor" style="width: 100%;height: 600px"></textarea>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="button"  id="confirm2"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>


</body>
</html>
<script>
    $(function () {

        var ue = UE.getEditor('editor',{ //自动排版参数
                autotypeset: {
                mergeEmptyline: true,           //合并空行
                removeClass: true,              //去掉冗余的class
                removeEmptyline: false,         //去掉空行
                textAlign: "left",               //段落的排版方式，可以是 left,right,center,justify 去掉这个属性表示不执行排版
                imageBlockLine: 'center',       //图片的浮动方式，独占一行剧中,左右浮动，默认: center,left,right,none 去掉这个属性表示不执行排版
                pasteFilter: false,             //根据规则过滤没事粘贴进来的内容
                clearFontSize: false,           //去掉所有的内嵌字号，使用编辑器默认的字号
                clearFontFamily: false,         //去掉所有的内嵌字体，使用编辑器默认的字体
                removeEmptyNode: false,         // 去掉空节点
                //    //可以去掉的标签
                //    removeTagNames: {标签名字:1},
                indent: false,                  // 行首缩进
                indentValue: '2em',            //行首缩进的大小
                //    bdc2sb: false,
                //    tobdc: false
                }});

        $('#confirm2').click(function () {
            //文件上传
            test();

             var content2 = UE.getEditor('editor').getContentTxt().substring(1,100);

            var ArticleContent =  UE.getEditor('editor').getContent();

            var title = document.getElementById("title").value;
            var attribute = document.getElementById("attribute").value;
            setTimeout(function () {
                request(ArticleContent,title,attribute);
            },300)
            function request(ArticleContent,title,attribute) {
                $.ajax({
                    url:'insertA.do',
                    data:{ArticleContent:ArticleContent,title:title,attribute:attribute,content2:content2},
                    success:function (msg) {
                        alert(msg);
                    },
                    error:function () {
                        alert('failed');
                    }
                })

            }


        })

        function test() {

            var formData = new FormData();
            formData.append('file', $('#file')[0].files[0]);

            $.ajax({
                url: "fileU.do",
                type: "POST",
                data: formData,
                /**
                 *必须false才会自动加上正确的Content-Type
                 */
                contentType: false,
                /**
                 * 必须false才会避开jQuery对 formdata 的默认处理
                 * XMLHttpRequest会对 formdata 进行正确的处理
                 */
                processData: false,
                success: function (data) {
                    alert("success");

                },
                error: function () {
                    alert("上传失败！");

                }
            });


        }



    })

</script>