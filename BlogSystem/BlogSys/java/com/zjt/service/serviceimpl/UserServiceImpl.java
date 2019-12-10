package com.zjt.service.serviceimpl;

import com.zjt.Util.Ps;
import com.zjt.mapper.User1Mapper;
import com.zjt.pojo.User1;
import com.zjt.pojo.User1Example;
import com.zjt.service.UserService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service
public class UserServiceImpl implements UserService{

    boolean result = true;

    public String msg =null;

    public final int scale = 2;
    @Autowired
    private User1Mapper um;

    /**
     * 用户名检测
     * @param ul
     * @return
     */

    @Override
    public boolean checkUsername1(User1 ul) {
        User1Example example = new User1Example();
        User1Example.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(ul.getUsername());
        List<User1> user1s = um.selectByExample(example);


        User1Example example1 = new User1Example();
        User1Example.Criteria criteria1 = example1.createCriteria();
        criteria1.andRealnameEqualTo(ul.getRealname());
        List<User1> user1s1 = um.selectByExample(example1);

        if(user1s.size()+user1s1.size() != 0){
            result = false;
        }
        return result;
    }

    @Override
    public void userRegister(User1 ul) {
        um.insert(ul);
    }

    @Override
    public boolean checkLogin(Object object) {
        if(object!=null){
            result = true;
        }else{
            result = false;
        }
        return result;
    }

    @Override
    public boolean checkUsername(String username) {
        User1Example example = new User1Example();
        User1Example.Criteria criteria = example.createCriteria();
        criteria.andRealnameEqualTo("username");
        List<User1> user1s = um.selectByExample(example);
        if(user1s.size()!=0){
            result = false;
        }else if(username.length() == 0){
            result= false;
        }else{
            result = true;
        }
        System.out.println("Service 中的result"+result);
        return result;
    }

    @Override
    public String checkPassword(String password) {
        System.out.println("密码"+password.length());
        if(password.length() == 0 || password == null){
            msg = "密码不能为空";
        }else if(password.length()<8){
            msg = "密码不能小于8位";
        }else{
            msg = "密码可用";
        }
        return msg;
    }

    @Override
    public String checkname(String username) {
        System.out.println("用户名"+username);
        User1Example example = new User1Example();
        User1Example.Criteria criteria = example.createCriteria();

        criteria.andUsernameEqualTo(username);
        List<User1> user1s = um.selectByExample(example);
        if(username.length() ==  0 || username == null){
            msg = "姓名不能为空";
        }else if(user1s.size()>1){
            msg = "姓名已存在";
        }
        return msg;
    }

    @Override
    public String confirmPassword(String password, String confirmPs) {
        System.out.println("password"+password+"confirmPs"+confirmPs);
        if(password.length() != confirmPs.length()){
            msg = "密码长度不一致";
        }if(!password.equals(confirmPs)){
            msg = "两次输入密码不一致";
        }else{
            msg = "密码可用";
        }
        return msg;
    }

    @Override
    public String checkUn(String username) {
        String s = null;
        User1Example example = new User1Example();
        User1Example.Criteria criteria = example.createCriteria();

        User1Example.Criteria criteria1 = criteria.andUsernameEqualTo(username);
        List<User1> user1s = um.selectByExample(example);
        System.out.println("用户名检测长度+"+user1s.size());
        if(user1s.size()>0){
            s = "用户名已存在";
        }else if(username.length() == 0){
            s = "用户名不能为空";
        }else{
            s = "用户名可用";
        }
        return s;
    }

    @Override
    public boolean userLogin(User1 ul) {

        Md5Hash encrypte = Ps.encrypte(ul, scale);
        String password = encrypte.toString();

        System.out.println("用户登录controller"+password);
        ul.setPassword(password);
        User1Example example = new User1Example();
        User1Example.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(ul.getUsername());
        criteria.andPasswordEqualTo(ul.getPassword());
        List<User1> user1s = um.selectByExample(example);
        if(user1s.size() == 0){
            result = false;
        }else{
            result = true;
        }

        return result;
    }

    @Override
    public List<User1> UserList() {
        List<User1> user1s = um.UserList();


        return user1s;
    }

    @Override
    public User1 getUser(User1 ul) {

        User1Example example = new User1Example();
        User1Example.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(ul.getUsername());

        List<User1> user1s = um.selectByExample(example);
        User1 user1 = user1s.get(0);

        return user1;
    }
}
