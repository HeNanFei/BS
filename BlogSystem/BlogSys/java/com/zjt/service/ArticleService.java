package com.zjt.service;

import com.github.pagehelper.PageInfo;
import com.zjt.pojo.Article;

import java.util.ArrayList;
import java.util.List;

public interface ArticleService {

    boolean insertAriticle(Article article);

   Article getArticleByNumber(int num);

   List<Article> getAllArticle();

  Article getMaxClickAr();


  Article getRestClickArticle(int num);

 // List<Article> getTAr(String click);

  ArrayList<Article> getTenArticles();

  List<Article> getLatestArticle();

  PageInfo<Article> getArticleByLimit();

  Article getArticleByAid(int aid);

  String deleteArticle(List<Integer> list);

  boolean judgePersonal();

  void deletePerson();

  Article getPersonal();

  List<Article> getArticleByAttribute(String attribute);


  List<Article> getArticleByAids(ArrayList<Integer> list);

  void updateArticlesByAids(ArrayList<Integer> list, Article article);

  List<Article> getRecommendAndTop(String attribute);



}
