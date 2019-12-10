package com.zjt.Util;

import com.alibaba.fastjson.JSON;

import javax.servlet.http.HttpServletResponse;

public class JsonWrite {
    public static void finalJson(Object obj,HttpServletResponse response) {

        try {
            String list2 = JSON.toJSONString(obj);
            System.out.println("转换后的json数据++++++++"+list2);
            response.getWriter().write(list2);
        }catch (Exception e){
            System.out.println("json 数据转换出错");
        }

    }
}
