package com.zjt.service;

import com.github.pagehelper.PageInfo;
import com.zjt.pojo.Article;

import java.util.List;

public interface Service {
   List<Article> getTe(String click);

   PageInfo testPagehelper();
}
