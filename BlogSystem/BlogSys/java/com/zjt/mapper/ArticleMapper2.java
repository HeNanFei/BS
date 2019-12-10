package com.zjt.mapper;

import com.zjt.Util.Order;
import com.zjt.pojo.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleMapper2 {

    List<Article> getTenAr(String click);

    List<Article> getTenAr2(Order order);
}
