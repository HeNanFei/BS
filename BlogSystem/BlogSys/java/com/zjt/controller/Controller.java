package com.zjt.controller;

import com.github.pagehelper.PageInfo;
import com.zjt.Util.JsonWrite;
import com.zjt.Util.Order;
import com.zjt.mapper.ArticleMapper2;
import com.zjt.pojo.Article;
import com.zjt.service.ArticleService;
import com.zjt.service.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@org.springframework.stereotype.Controller

public class Controller {
    @Autowired
    private Service sv;


    @RequestMapping("toRegister.do")
    public String toRegister(){

        return  "formList";
    }
    @RequestMapping("toArticleDetail.do")
    public String toArticleDetail(){


        return  "articleDetail";
    }
    @RequestMapping("test2.do")
    public void test2() {
        List<Article> click = sv.getTe("click");
        for (Article cli:click
             ) {
            System.out.println(cli);
        }
    }
    @RequestMapping("testPageHelper.do")
    public String testPageHelper(HttpServletResponse response, HttpServletRequest request){
        PageInfo pageInfo = sv.testPagehelper();
        System.out.println("得到了pageinfo"+pageInfo);
        request.setAttribute("pageInfor",pageInfo);
        List list = pageInfo.getList();
        JsonWrite.finalJson(list,response);
        return "articleList";
    }
    @RequestMapping("testMethod.do")
    public String testPageHelper2(HttpServletResponse response, HttpServletRequest request){
        PageInfo pageInfo = sv.testPagehelper();


        List<Article> list = pageInfo.getList();
        for (Article at:list
             ) {
            System.out.println("testPageHelper2"+at);
        }
        String s = "传来的数据";
        JsonWrite.finalJson(list,response);
        return null;
    }
    @RequestMapping("toEditor.do")
    public String toEditor(String c){
        System.out.println("拿到的数据"+c);
        return "test";
    }
    @RequestMapping("testAjax.do")
    public String testAjax(HttpServletResponse response){
        JsonWrite.finalJson("test ok",response);

        return null;
    }
    @RequestMapping("toMyLife.do")
    public String toMyLife(){
        return "myLife";
    }
}

