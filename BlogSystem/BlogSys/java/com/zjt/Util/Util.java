package com.zjt.Util;

public class Util {
    public static  String FString = null;
    public static String getString(String string){

        int length = string.length();
        if(length == 0){
            FString = "文章内容太短了";
        }else if (length>40){
            FString = string.substring(0,40);
        }else{
            FString = string.substring(0,string.length()-1);
        }

        return  FString;
    }
}