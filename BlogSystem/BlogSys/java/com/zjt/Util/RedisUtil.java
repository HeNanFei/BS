package com.zjt.Util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.zjt.pojo.Article;
import redis.clients.jedis.Jedis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RedisUtil {
    static  Jedis jedis = new Jedis("127.0.0.1",6379);


    static Gson gson = new Gson();

    public static void setList(List<Article> articles){
        List<Article> list = null;
        Map<String,Object> map = new HashMap<>();

        for (Article a:articles) {
            //System.out.println("object"+a);
            String s1 = JSON.toJSONString(a);
            //System.out.println("转的！！"+s1);

            jedis.hset("articles",a.getAid().toString(),s1);


            //jedis.hset("articles",aid,jsonString);
        }


    }
    public static List<Article> getList(){
        int port = 6380;
        Jedis jedis2;
        try{
             jedis2 = new Jedis("127.0.0.1",port);
            String ping = jedis2.ping();
            System.out.println("测试联通80"+ping);
        }catch (Exception e){
             jedis2 = new Jedis("127.0.0.1",6381);
        }


        Map<String, String> articles = jedis2.hgetAll("articles");
        List<Article> list = new ArrayList<>();
        articles.entrySet();
        for (String key:articles.keySet()
             ) {

            System.out.println("拿到的key"+key);
            String s = articles.get(key);
            System.out.println("对象"+s);
            JSONObject jsonObject = JSON.parseObject(s);

            System.out.println("拿到的json对象"+jsonObject);
            Article article = JSON.toJavaObject(jsonObject, Article.class);
            System.out.println("zhuan huang"+article);
            list.add(article);
        }
        return list;

    }
}
