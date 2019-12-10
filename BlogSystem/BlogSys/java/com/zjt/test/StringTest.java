package com.zjt.test;

public class StringTest {
    public static int judgeStringLength(String string){

        return string.length();
    }

    public static void main(String[] args) {
        String test ="高中，对于很多人来说，是一段带着自己的大学梦储备能量的征途吧，为的只是在最后一场战—";
        int i = judgeStringLength(test);
        System.out.println(i);
    }
}
