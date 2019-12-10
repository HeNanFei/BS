package com.zjt.service.serviceimpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjt.mapper.ArticleMapper;
import com.zjt.mapper.ArticleMapper2;
import com.zjt.mapper.HMapper;
import com.zjt.pojo.Article;
import com.zjt.pojo.ArticleExample;
import com.zjt.pojo.H;
import com.zjt.pojo.HExample;
import com.zjt.service.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@org.springframework.stereotype.Service
public class ServiceImpl implements Service{
    @Autowired
    private ArticleMapper2 articleMapper2;
    @Autowired
    private HMapper hm;
    @Autowired
    private ArticleMapper am;

    @Override
    public List<Article> getTe(String click) {

        return articleMapper2.getTenAr(click);
    }

    @Override
    public PageInfo testPagehelper() {
        PageHelper.startPage(1,5);
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andAidIsNotNull();
        List<Article> articles = am.selectByExample(example);
        PageInfo<Article> result = new PageInfo<>(articles);

        return result;
    }
}
