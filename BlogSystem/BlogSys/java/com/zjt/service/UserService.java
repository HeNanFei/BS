package com.zjt.service;

import com.zjt.pojo.User1;

import java.util.List;

public interface UserService {

    boolean checkUsername1(User1 ul);

    void userRegister(User1 ul);

    boolean checkLogin(Object object);

    boolean checkUsername(String username);

    String checkPassword(String password);

    String checkname(String Username);

    String confirmPassword(String password, String confirmPs);

    String checkUn(String username);

    boolean userLogin(User1 ul);

    List<User1> UserList();

    User1 getUser(User1 ul);



}
