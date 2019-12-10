package com.zjt.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjt.Util.JsonWrite;
import com.zjt.Util.RedisUtil;
import com.zjt.Util.Util;
import com.zjt.mapper.ArticleMapper;
import com.zjt.pojo.Article;
import com.zjt.pojo.PageBean;
import com.zjt.pojo.User1;
import com.zjt.service.ArticleService;
import com.zjt.service.serviceimpl.ArticelServiceImpl;
import jdk.nashorn.internal.ir.debug.JSONWriter;
import org.apache.ibatis.annotations.Param;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ArticleController {

    @Autowired
    private ArticleMapper am;
    @Autowired
    private ArticleService as;

    //排名的文章
    ArrayList<Article> listMax = new ArrayList<>(9);


    //图片url
    String imgUrl;

   ArrayList<Article> top10 = new ArrayList<>();

   ArrayList<Article> recommend = new ArrayList<>();


    public int judge ;
    //判断数据库变化的依据


    //the page
    public String page = null;

    private String msg = null;

    public ArrayList<String> writer = new ArrayList<>();

    public Article article;

    String tempWriter = null;

    //the num of the writer
    public int writerNum = 0;

    //the current num of  aritcle
    public int currentPage = 0;



    //the num of total article



    public int totalPage;


    public String username= null;
    static{
        System.out.println("静态代码块");

    }
    public ArticleController() {


        System.out.println("父类构造中listMax");
    }


    //构造代码块
    {
        System.out.println(totalPage+"构造代码块");


    }


    /**
     * 提交文章
     * @param article
     * @param response
     * @param session
     * @return
     */



    @RequestMapping("insertA.do")
    public String insertArticle(Article article, HttpServletResponse response, HttpSession session,String ArticleContent){
        System.out.println(article.getContent2()+"内容二");
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createDate = sdf.format(date);
        System.out.println(createDate+"当前时间是");


        User1 usr = (User1) session.getAttribute("usr");
        System.out.println(usr);

        System.out.println(article+"拿到的");
        article.setUid(usr.getUid());
        article.setUsername(usr.getUsername());
        article.setContent(ArticleContent);
        article.setWrited(createDate);
        article.setClick(0);
        article.setImgurl(imgUrl);
        System.out.println(article+"插入的文章");
        boolean result;
        ArrayList<Article> top = new ArrayList<>();
        List<Article> top1 = as.getArticleByAttribute("top10");
        for (Article articles:top1
             ) {
            top.add(articles);
        }
        top10 = top;
        System.out.println("插入文章中的图片路径"+imgUrl);

        if(article.getAttribute().equals("个人简介")){
            boolean b = as.judgePersonal();
            if (b == true){
                as.deletePerson();
            }
        }
        if(article.getAttribute().equals("top10")){
            article.setContent(ArticleContent);
            if(top10.size()==9){
                System.out.println("数组等于9");
                ArrayList<Integer> list = new ArrayList();
                System.out.println(top10.get(8)+"九二");
                System.out.println("索引为9的"+top10.get(8).getAid());
                list.add(top10.get(8).getAid());
                as.deleteArticle(list);
                top10.remove(top10.get(8));
                System.out.println("移除后的size"+top10.size());
            }else{
                top10.add(article);
            }
        }
        if(article.getAttribute().equals("站长推荐")){

            List<Article> articleByAttribute = as.getArticleByAttribute(article.getAttribute());
            ArrayList<Article> recomendDuplicate = new ArrayList<>();
            for (Article aa:articleByAttribute
                 ) {
                recomendDuplicate.add(aa);
            }

            recommend = recomendDuplicate;
            if(recommend.size()==9){
                ArrayList<Integer> list = new ArrayList<>();
                list.add(recommend.get(8).getAid());
                recommend.remove(recommend.get(8));
               as.deleteArticle(list);

            }else{
                recommend.add(article);
            }
        }

        if(this.top10.size()<=9 && recommend.size()<=9) {

            if(imgUrl == null){
                result = false;
                msg = "无法插入，请上传图片";
            }else{
                 result = as.insertAriticle(article);
            }
            if(result==true){
                if (((User1) session.getAttribute("usr")).getUsername()!= tempWriter){
                    tempWriter = ((User1) session.getAttribute("usr")).getUsername();
                    currentPage =0;
                    currentPage++;

                    if(currentPage==1){

                        writerNum++;
                        writer.add(tempWriter);

                    }


                    currentPage++;

                }
                page = null;
                msg = "文章提交成功";
                totalPage++;


                System.out.println(currentPage+"已经提交的文章数"+writerNum+"作者数量"+totalPage+"总的文章数量");

                //msg = "文章信息位完善请重新填写";
            }
        }
        System.out.println("当前作者"+tempWriter);

        for (String writerName:writer
                ) {
            System.out.println("这些作者的名字"+writerName);
        }
        System.out.println("top10size"+ this.top10.size());
        System.out.println("recommendsize"+recommend.size());
        JsonWrite.finalJson(msg,response);
        return null;
    }

    /**
     * 查找文章
     * @param num
     * @param response
     * @return
     */
    @RequestMapping("selectArticleByNum.do")
    public String selectArticleByNum(int num,HttpServletResponse response){

        Article articleByNumber = as.getArticleByNumber(num);
        System.out.println(articleByNumber);
        String msg = articleByNumber.getTitle()+"/"+articleByNumber.getUsername();
        JsonWrite.finalJson(msg,response);
        return null;
    }

    /**
     *
     * 查找所有的文章
     * @param response
     * @return
     */
    @RequestMapping("getAllArticle.do")
    public String getAllArticle(HttpServletResponse response){
        List<Article> allArticle = am.getAllArticles();
        for (Article ss:allArticle
             ) {
            System.out.println("前台的"+ss);
        }
        //存入redis

        RedisUtil.setList(allArticle);

        JsonWrite.finalJson(allArticle,response);
        return null;
    }

    /**
     * 文章提交消息
     * @param response
     * @return
     */

    @RequestMapping("inforArticleNum.do")
    public String inforArticleNum(HttpServletResponse response){
        System.out.println("jfkdsjkkkkkkkkkk");
        System.out.println(currentPage+"已经提交的文章数"+writerNum+"作者数量"+totalPage+"总的文章数量");
        JsonWrite.finalJson(totalPage,response);
        return null;
    }

    /**
     * 排名榜首的文章标题
     * @param
     * @return
     */
    @RequestMapping("getMaxAr.do")
    public String getMaxAr(HttpServletResponse response){
        Article maxClickAr = as.getMaxClickAr();
        System.out.println("getMaxAr中的文章"+maxClickAr.toString());
        String title = maxClickAr.getTitle()+"/"+maxClickAr.getUsername();
        JsonWrite.finalJson(title,response);
        return null;
    }

    /**
     * 获取排名第一的文章内容
     * @param response
     * @return
     */
    @RequestMapping("getMaxArContent.do")
    public String getMaxArContent(HttpServletResponse response ){
        Article maxClickAr = as.getMaxClickAr();
        String content = maxClickAr.getContent();
        String string = Util.getString(content);

        System.out.println("截取的文章chan"+string);



        JsonWrite.finalJson(string,response);


        return null;
    }

    /**
     * 没有办法的方法重载
     * @param response
     * @param state
     * @return
     */
    @RequestMapping("getMaxAc.do")
    public String getMaxArContent(HttpServletResponse response,int state ){
        System.out.println("getMaxArContent2"+"           "+"number="+state);
        Article maxClickAr = as.getMaxClickAr();
        String content = maxClickAr.getContent();
        String string = Util.getString(content);

        System.out.println("截取的文章chan"+string);
        if(state==0){
            JsonWrite.finalJson(content,response);
        }else{
            JsonWrite.finalJson(string,response);

        }





        return null;
    }

    /**
     * 获取其他文章标题
     * @param
     * @return
     */

    @RequestMapping("getRestT.do")
    public String getResteTitle(HttpServletResponse response,int number){
        Article restClickArticle = as.getRestClickArticle(number);
        String title = restClickArticle.getTitle()+"/"+restClickArticle.getUsername();
        System.out.println("getRestT中的"+restClickArticle);

        JsonWrite.finalJson(title,response);
        return null;
    }

    /**
     *获取其他文章内容
     * @param
     * @return
     */
    @RequestMapping("getRestContent.do")
    public String getRestContent(int number, HttpServletResponse response ){
        Article restClickArticle = as.getRestClickArticle(number);
        System.out.println("getRestOCnt中的"+restClickArticle);
        String content = restClickArticle.getContent();
        String string = Util.getString(content);



        JsonWrite.finalJson(string,response);


        return null;
    }

    /**
     * 文章详情
     * @param number
     * @param request
     * @return
     */
    @RequestMapping("toCertainPage.do")
    public String toCertainPage(int number, HttpServletRequest request,String state){
        System.out.println(number+"tocertianppage number"+"state");


       /* System.out.println("第一次listMax的size"+listMax.size()+"gelidai");

        Article a = new Article();
        a.setUsername("测试文章");
        listMax.remove(9);
        listMax.add(a);
        System.out.println("第二次listMax文章的长度"+listMax.size());
*/
        ArrayList<Article> tenArticles = as.getTenArticles();
        Article article = tenArticles.get(number);
        request.setAttribute("Article", article);
        /*for (Article as:listMax
             ) {
            System.out.println(as+"listMax记录");
        }*/
        return "art";
    }

    /**
     * 以上的getMaxT将被弃用
     * @param number
     * @param response
     * @return
     */
    @RequestMapping("getCertainAT.do")
    public String getCertainAT(int number,HttpServletResponse response){
        ArrayList<Article> tenArticles = as.getTenArticles();

        Article article = tenArticles.get(number);

        JsonWrite.finalJson(article.getTitle(),response);

        return null;
    }

    /**
     * 以上的getMaxC将被弃用
     * @param number
     * @return
     */
    @RequestMapping("getCertainAC.do")
    public String getCertainAc(int number,HttpServletResponse response){
        ArrayList<Article> tenArticles = as.getTenArticles();
        Article article = tenArticles.get(number);

        JsonWrite.finalJson(Util.getString(article.getContent()),response);
        return  null;
    }

    @RequestMapping("init.do")
    public String init(HttpServletRequest request,HttpServletResponse response) {
        ArrayList<Article> tenArticles = as.getTenArticles();
        ArrayList<String> Atitle = new ArrayList<>(9);
        for (Article at:tenArticles
                ) {
            Atitle.add(at.getTitle());
        }




        String sTitle = Atitle.toString();
        JsonWrite.finalJson(sTitle.substring(1,sTitle.length()-1),response);
        return  null;
    }

    @RequestMapping("toCertainPage2.do")
    public String toCertainPage2(int number, HttpServletRequest request){


        System.out.println(number+"tocertianppage number");


       /* System.out.println("第一次listMax的size"+listMax.size()+"gelidai");

        Article a = new Article();
        a.setUsername("测试文章");
        listMax.remove(9);
        listMax.add(a);
        System.out.println("第二次listMax文章的长度"+listMax.size());
*/
        ArrayList<Article> tenArticles = as.getTenArticles();
        Article article = tenArticles.get(number);
        request.setAttribute("Article", article);
        /*for (Article as:listMax
             ) {
            System.out.println(as+"listMax记录");
        }*/
        return "articleDetail";
    }

    /**
     * 获取最新文章标题
     * @param response
     * @return
     */
    @RequestMapping("getLAT.do")
    public String getLatestArticle(HttpServletResponse response){
        List<Article> latestArticle = as.getLatestArticle();

        /*for (Article a:latestArticle
             ) {
            System.out.println(a+"最新文章");
        }*/
        ArrayList<String> arr = new ArrayList<>(5);
        ArrayList<Article> articles = new ArrayList<>(5);

        for (Article article:latestArticle
                ) {
            articles.add(article);
        }
        System.out.println(articles.size()+"最新文章的长度");
        String s = subTitle(articles);
        System.out.println("huoqu de wenzhang biaoti"+s);
        JsonWrite.finalJson(s,response);
        return  null;
    }

    /**
     * 最新文章页面
     * @param number
     * @param state
     * @return
     */

    Article ass = new Article();
    @RequestMapping("toLatestPage.do")
    public String toLatestPage(int number,String state,HttpServletRequest request){


        request.setAttribute("state",state);

        System.out.println(number+state+"toLatestPage.do");
        List<Article> latestArticle = as.getLatestArticle();
        ArrayList<Article> latestA = new ArrayList<>();
        for (Article a:latestArticle
                ) {
            latestA.add(a);
        }

        Article article = latestA.get(number);
        ass = article;
        String articleContent = article.getContent();

        request.setAttribute("articleContent",articleContent);
        request.setAttribute("Article", article);



        return "art";
    }
    @RequestMapping("toLatestPageACC.do")
    public String toLatestPage(HttpServletResponse response){
        System.out.println(ass+"文章类");
        Map<String,Object> map = new HashMap<>();
        map.put("acc",ass);
        System.out.println(ass.getContent()+"文章内容呢");
        JsonWrite.finalJson(map,response);
        return  null;
    }


    /**
     * 截取文章标题
     * @param arrayList
     * @return
     */
    public static String subTitle(ArrayList<Article> arrayList){
        ArrayList<String> aTitles = new ArrayList<String>();
        for (Article a:arrayList
                ) {
            aTitles.add(a.getTitle());
        }
        String titles = aTitles.toString().substring(1,aTitles.toString().length()-1);

        return titles;
    }
    /**
     * 判断listMax的长度
     * @param number
     * @return
     */
    public static boolean jAL(int number){
        boolean result = true;

        if(number != 10){
            result = false;
        }
        return result;
    }

    /**
     * 分页
     * @return
     */
    @RequestMapping("articleList.do")
    public String articleList(HttpServletResponse response,int pageNum,int pageSize){
        System.out.println(pageNum+"当前页");
        PageHelper pageHelper = new PageHelper();
        pageHelper.startPage(pageNum,pageSize);
        List<Article> allArticles = am.getAllArticles();
        PageInfo<Article> articleByLimit = new PageInfo<>(allArticles);
        System.out.println("分页方法中的pageInfor"+articleByLimit);
        JsonWrite.finalJson(articleByLimit,response);
        return null;
    }


    @RequestMapping("limitList.do")
    public String getLimitList(HttpServletResponse response,int pageNum){
        PageHelper pageHelper = new PageHelper();
        pageHelper.startPage(pageNum,13);
        List<Article> allArticles = am.getAllArticles();
        PageInfo<Article> articleByLimit = new PageInfo<>(allArticles);
        List<Article> list = articleByLimit.getList();
        for (Article a: list
                ) {
            System.out.println(a+"获取分页list");
        }
        JsonWrite.finalJson(list,response);
        return null;
    }
    @RequestMapping("getLimitPageBean.do")
    public String getLimitPageBean(HttpServletResponse response,int pageSize,int pageNum){
        System.out.println("你想要的page"+pageSize);
        PageHelper pageHelper = new PageHelper();
        pageHelper.startPage(pageNum,13);
        //List<Article> allArticles = am.getAllArticles();
        final List<Article> allArticles = RedisUtil.getList();
        for (Article as:allArticles
             ) {
            System.out.println("controller里的"+as);
        }
        PageInfo<Article> articleByLimit = new PageInfo<>(allArticles);


        PageBean bean = new PageBean();

        bean.setTotal((int)articleByLimit.getTotal());
        bean.setPages(articleByLimit.getPages());
        bean.setPageSize(articleByLimit.getPageSize());
        List<Article> list = articleByLimit.getList();
        System.out.println("listcha"+list.size());

        System.out.println(bean);
        JsonWrite.finalJson(bean,response);


        return null;
    }



    /**
     *分页初始化
     */
    @RequestMapping("initLimitPage.do")
    public String initLimitPage(HttpServletResponse response){
        PageHelper pageHelper = new PageHelper();
        pageHelper.startPage(1,12);
        final List<Article> article = RedisUtil.getList();
        System.out.println("长度啦大哥"+article.size());

        List<Article> list2 = article.subList(0,12);
        //List<Article> article = am.getAllArticles();
        PageInfo<Article> pageInfo = new PageInfo<>(article);
       /* PageInfo<Article> articleByLimit = as.getArticleByLimit();
        List<Article> list = articleByLimit.getList();
        for (Article a:list
                ) {
            System.out.println(a+"initLimitPage");
        }*/
       List<Article> list = pageInfo.getList();
        JsonWrite.finalJson(list2,response);

        return null;
    }
    //上下篇
    Map<String,Object> nextAndLast = new HashMap<>();
    /**
     * 根据aid返回文章
     * @param aid
     * @return
     */
    @RequestMapping("getAritcleByAid.do")
    public String getArticleByAid(int aid,HttpServletRequest request,String attribute){

        if(attribute != null){
            List<Article> articleByAttribute = as.getArticleByAttribute(attribute);
            Integer articelIndex = null;
           articleByAttribute = as.getArticleByAttribute(attribute);
            if(articleByAttribute.size()!= 0){
                for (int i=0;i<articleByAttribute.size();i++){
                    if(articleByAttribute.get(i).getAid() == aid){
                        articelIndex = i;
                        if (articelIndex==0){
                            nextAndLast.put("status","next");
                            nextAndLast.put("next",articleByAttribute.get(i+1));
                        }if(articelIndex==articleByAttribute.size()-1){
                            nextAndLast.put("status","last");
                            nextAndLast.put("last",articleByAttribute.get(i-1));
                        }if (articelIndex >0&&articelIndex<articleByAttribute.size()-1){
                            nextAndLast.put("status","true");
                            nextAndLast.put("next",articleByAttribute.get(i+1));
                            nextAndLast.put("last",articleByAttribute.get(i-1));
                        }

                    }
                }
            }
        }
        Article articleByAid = as.getArticleByAid(aid);
        int i = articleByAid.getClick()+1;
        articleByAid.setClick(i);
        ArrayList<Integer> numbers = new ArrayList<>();
        numbers.add(articleByAid.getAid());
        as.updateArticlesByAids(numbers,articleByAid);

        ass = articleByAid;
        System.out.println(articleByAid+"根据aid返回文章");
        request.setAttribute("Article",articleByAid);
        Integer articleId= articleByAid.getAid();
        request.setAttribute("aid",articleId);

        String text = "<a href='www.baidu.com'>heheh</a>";
        //request.setAttribute("url",text);
        System.out.println("拿到的map"+nextAndLast);

        return "articleInfor";
    }


    @RequestMapping("getAttributeAr.do")
    public String getAttrubuteAr(HttpServletResponse response,String attribute,Integer pageNum){
        System.out.println(attribute+"属性名"+"+++++++++++++"+pageNum);



        List<Article> list = null;
        PageHelper pageHelper = new PageHelper();
            pageHelper.startPage(pageNum,8);
        if(attribute.equals("足球世界")){
          list = am.getFootBallWorld();
        } if(attribute.equals("技术博客")){
            list = am.getTechBlog();
        } if(attribute.equals("碎言碎语")){
            list = am.getSS();
        }if (attribute.equals("secret")){
            list = am.getSecret();
        }if(attribute.equals("top10")){
            list = top10;
        }if ((attribute.equals("站长推荐"))){
            list = recommend;
        }
        PageInfo<Article> pageInfo = new PageInfo<>(list);
        System.out.println("getAttrbute 中的pageInfor"+pageInfo);

        JsonWrite.finalJson(pageInfo,response);

        return null;
    }

    /**
     * 删除文章
     * @param ids2
     * @param response
     * @return
     */
    @RequestMapping("deleteArticles.do")
    public String deleteArticles(String ids2,HttpServletResponse response){
       ArrayList<Integer> list = new ArrayList<>();
        String substring = ids2.substring(1, ids2.length() - 1);
        System.out.println(substring+"截取后的");
        String[] split = substring.split(",");
        System.out.println(split.length+"字符串长度");
        for (int i = 0;i<split.length;i++){
            int i1 = Integer.parseInt(split[i]);
            System.out.println(i1+"zhuanle");
            list.add(i1);
        }

        List<Article> articleByAids = as.getArticleByAids(list);
        for (Article article:articleByAids
             ) {
            if (article.getAttribute().equals("top10")){
                Integer aids = article.getAid();
              for (int i=0;i<top10.size();i++){
                  if(top10.get(i).getAid()==aids){
                      top10.remove(i);
                  }
              }
            }
            if(article.getAttribute().equals("站长推荐")){
                Integer rid = article.getAid();
                for(int i=0;i<recommend.size();i++){
                    if(recommend.get(i).getAid()==rid){
                        recommend.remove(i);
                    }
                }
            }
        }
        System.out.println(list.size()+"我要回去吃饭");
       as.deleteArticle(list);
        JsonWrite.finalJson("ok",response);
        return null;
    }

    /**
     * 个人简介
     * @param attribute
     * @param response
     * @return
     */
    @RequestMapping("getPersonal.do")
    public String getPersonal(String attribute,HttpServletResponse response){
        Article personal = as.getPersonal();
        System.out.println("个人简介的内容"+personal.getContent());

        JsonWrite.finalJson(personal.getContent(),response);
        return null;
    }

    /**
     * 根据栏目获取文章
     * @param attribute
     * @param response
     * @return
     */
    @RequestMapping("getArticleByAttribute.do")
    public String getArticleByAttribute(String attribute,HttpServletResponse response){
        List<Article> articleByAttribute = as.getArticleByAttribute(attribute);

        JsonWrite.finalJson(articleByAttribute,response);

        return null;
    }

    /**修改文章
     *
     * @param article
     * @param response
     * @param ids
     * @return
     */
    @RequestMapping("doUpdate.do")
    public String doUpdate(Article article,HttpServletResponse response,String ids){
        ArrayList<Integer> arrayList = new ArrayList<>();
        System.out.println("do up"+article);
        JsonWrite.finalJson("chuan",response);
        System.out.println(ids+"do upte");
        String substring = ids.substring(1, ids.length() - 1);
        String[] split = substring.split(",");
        for(int i=0;i<split.length;i++){
            Integer i1 = Integer.parseInt(split[i]);
            arrayList.add(i1);
        }
       as.updateArticlesByAids(arrayList,article);
        JsonWrite.finalJson("ok",response);
        return null;
    }



    @RequestMapping("fileU.do")
     public String fileU(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
        // 判断文件是否为空，空则返回失败页面
        System.out.println("文件上传");
        if (file.isEmpty()) {
            imgUrl = null;
            System.out.println("文件为空");
        }
        // 获取文件存储路径（绝对路径）
        String path = "/home/www/apache-tomcat-9.0.21/webapps/BlogSys/images";
        //System.out.println("contextPaht"+path);
        // 获取原文件名
        String fileName = file.getOriginalFilename();
        imgUrl ="images"+"/"+fileName;

        System.out.println("图片路径"+imgUrl);
        // 创建文件实例
        File filePath = new File(path, fileName);
        // 如果文件目录不存在，创建目录
        if (!filePath.getParentFile().exists()) {
            filePath.getParentFile().mkdirs();
            System.out.println("创建目录" + filePath);
        }
        try {
            file.transferTo(filePath);
        }catch (Exception e){
            System.out.println(e);

        }
        // 写入文件
        String msg = "ol";
        JsonWrite.finalJson(msg,response);
        return null;
    }
    @RequestMapping("getRecommendAndTop.do")
    public String getRecommendAndTop(HttpServletResponse response,String attribute){
        final List<Article> list = as.getRecommendAndTop(attribute);
        for (Article l:list
             ) {
            System.out.println("null ma"+l);
        }
        JsonWrite.finalJson(list,response);
        return null;
    }
    @RequestMapping("getTopA.do")
    public String getTopA(){


        return null;
    }

    @RequestMapping("loadNextAndLast.do")
    public String loadNextAndLast(HttpServletResponse response){
        System.out.println("载入中"+nextAndLast.toString());
        JsonWrite.finalJson(nextAndLast,response);
        return null;
    }
    String toArributeListSAttribute = null;
    @RequestMapping("toAttributeList.do")
    public String toAttributeList(String attribute,Integer pageNum,HttpServletResponse response){
        toArributeListSAttribute = attribute;

        return "list";
    }
    @RequestMapping("attributeListData.do")
    public String attributeListData(HttpServletResponse response,int pageNum){


            PageHelper pageHelper = new PageHelper();
            pageHelper.startPage(pageNum,13);
            List<Article> articleByAttribute = as.getArticleByAttribute(toArributeListSAttribute);
            PageInfo<Article> pageInfo = new PageInfo<>(articleByAttribute);
            JsonWrite.finalJson(pageInfo,response);


        return null;
    }
    @RequestMapping("getTime.do")
    public String getTime(HttpServletResponse response,int pageNum){
        PageHelper pageHelper = new PageHelper();
        pageHelper.startPage(pageNum,12);
        List<Article> time = am.getTime();
        PageInfo<Article> pageInfo = new PageInfo<>(time);
        JsonWrite.finalJson(pageInfo,response);

        return null;
    }

}