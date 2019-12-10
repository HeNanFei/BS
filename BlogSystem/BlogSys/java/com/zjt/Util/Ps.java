package com.zjt.Util;

import com.zjt.pojo.User1;

import org.apache.shiro.crypto.hash.Md5Hash;

public class Ps {
    public static Md5Hash md = null;
    public static Md5Hash encrypte(User1 ul, int scale){
        md = new Md5Hash(ul.getPassword(),ul.getUsername(),scale);
        return  md;
    }
}
