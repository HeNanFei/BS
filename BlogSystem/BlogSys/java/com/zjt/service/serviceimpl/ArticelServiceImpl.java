package com.zjt.service.serviceimpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjt.mapper.ArticleMapper;
import com.zjt.pojo.Article;
import com.zjt.pojo.ArticleExample;
import com.zjt.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ArticelServiceImpl implements ArticleService{
    public Article article;

    public int judge;
    //判断数据库变化的依据

    public boolean result;

    @Autowired
    private ArticleMapper am;
    @Override
    public boolean insertAriticle(Article article) {
        if(article.getTitle().length() != 0 || article.getAttribute().length() != 0 || article.getContent().length() != 0 || article.getUsername().length() != 0 || article.getWrited() != null){
            result = true;
            am.insert(article);
        }else{
            result = false;
        }
        return result;
    }

    @Override
    public Article getArticleByNumber(int num) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andAidEqualTo(num);
        List<Article> articles = am.selectByExample(example);
        Article article = articles.get(0);
        return article;
    }

    @Override
    public List<Article> getAllArticle() {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andAidIsNotNull();
        List<Article> articles = am.selectByExample(example);
        return articles;
    }

    @Override
    public Article getMaxClickAr() {

        Article maxClickAr = am.getMaxClickAr();

        return maxClickAr;
    }

    @Override
    public Article getRestClickArticle(int num) {
        List<Article> restClickAr = am.getRestClickAr();
        System.out.println(restClickAr.size()+"+++++++++++++++++++++++++++长度");
        System.out.println(restClickAr.get(2)+"第二条记录");
        for (Article ar:restClickAr
             ) {
            System.out.println(ar+"十条记录");
        }
        int length = restClickAr.size();
        if(num == 1){
            article = restClickAr.get(1);
        }else{
            article = restClickAr.get(num-1);
        }
        return article;
    }
    //弃用的方法
    /*@Override
    public List<Article> getTAr(String click) {
        int temp;
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andAidIsNotNull();
        List<Article> articles = am.selectByExample(example);
         temp = articles.size();
        judge = temp;
        System.out.println("serviceImpl 里的article总长度"+articles.size());

        return am.getTenArticle(click);
    }*/

    @Override
    public ArrayList<Article> getTenArticles() {

        ArrayList<Article> arr = new ArrayList<>(9);
        List<Article> click = am.getTenArticle("click");
        for (Article a:click
             ) {
            arr.add(a);
        }


        return arr;
    }

    @Override
    public List<Article> getLatestArticle() {
        List<Article> writed = am.getLatestArticle("writed");



        return writed;
    }

    @Override
    public PageInfo<Article> getArticleByLimit() {
        PageHelper.startPage(1,10);

        List<Article> articles = am.getAllArticles();
        PageInfo<Article> pageInfo = new PageInfo<>(articles);
        List<Article> list = pageInfo.getList();
        for (Article a:list
             ) {
            System.out.println(a+"Service 中pageinfor");
        }
        return pageInfo;
    }

    @Override
    public Article getArticleByAid(int aid) {

        Article article = am.selectByPrimaryKey(aid);

        return article;
    }

    @Override
    public String deleteArticle(List<Integer> list) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andAidIn(list);
        am.deleteByExample(example);
        return "删除成功";
    }

    @Override
    public boolean judgePersonal() {
        boolean result =false;
        if(am.getPersonal() != null){
            result = true;
        }

        return result;
    }

    @Override
    public void deletePerson() {
        Integer i = null;
        ArticleExample example2 = new ArticleExample();
        ArticleExample.Criteria criteria1 = example2.createCriteria();
        criteria1.andAttributeEqualTo("个人简介");
        List<Article> list = am.selectByExample(example2);
        if(list != null){
            i = list.get(0).getAid();
        }
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
       criteria.andAidEqualTo(i);
        am.deleteByExample(example);
    }

    @Override
    public Article getPersonal() {
        return am.getPersonal();
    }

    @Override
    public List<Article> getArticleByAttribute(String attribute) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andAttributeEqualTo(attribute);
        List<Article> list = am.selectByExample(example);

        return list;
    }

    @Override
    public List<Article> getArticleByAids(ArrayList<Integer> list) {

        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andAidIn(list);
        List<Article> list1 = am.selectByExample(example);
        return list1;
    }

    @Override
    public void updateArticlesByAids(ArrayList<Integer> list, Article article) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andAidIn(list);
        List<Article> aa = am.selectByExample(example);
        for (Article a:aa) {

            if (article.getTitle()!=null){
                a.setTitle(article.getTitle());
            }if(article.getAttribute()!= null){
                a.setAttribute(article.getAttribute());
            }if (article.getUsername()!=null){
                a.setUsername(article.getUsername());
            }if (article.getClick() != null){
                a.setClick(article.getClick());
            }
            am.updateByPrimaryKeySelective(a);


        }

    }

    @Override
    public List<Article> getRecommendAndTop(String attribute) {
        List<Article> list = null;
        if(attribute.equals("站长推荐")){
            list = am.getRecommend();
        }if(attribute.equals("top10")){
            list = am.getTop();
        }
        return list;
    }


}
