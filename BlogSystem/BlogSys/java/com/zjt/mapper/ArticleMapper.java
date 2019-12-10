package com.zjt.mapper;

import com.zjt.pojo.Article;
import com.zjt.pojo.ArticleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArticleMapper {
    int countByExample(ArticleExample example);

    int deleteByExample(ArticleExample example);

    int deleteByPrimaryKey(Integer aid);

    int insert(Article record);

    int insertSelective(Article record);

    List<Article> selectByExampleWithBLOBs(ArticleExample example);

    List<Article> selectByExample(ArticleExample example);

    Article selectByPrimaryKey(Integer aid);

    int updateByExampleSelective(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByExampleWithBLOBs(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByExample(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    Article getMaxClickAr();

    List<Article> getRestClickAr();

    List<Article> getTenArticle(String click);


    List<Article> getLatestArticle(String writed);

    List<Article> getArticleByWrited(String writed);

    List<Article> getAllArticles();

    List<Article> getTechBlog();

    List<Article>  getSS();

    List<Article>  getFootBallWorld();

    List<Article>  getSecret();

    Article getPersonal();

    List<Article> getRecommend();

    List<Article> getTop();


    List<Article> getTime();
}