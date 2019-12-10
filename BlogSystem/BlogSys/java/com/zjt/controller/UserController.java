package com.zjt.controller;


import com.sun.deploy.net.HttpResponse;
import com.zjt.Util.JsonWrite;
import com.zjt.Util.Ps;
import com.zjt.pojo.User1;
import com.zjt.service.UserService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    private static final int scale =2;

    public String page = null;

    public  String msg = null;

    String state = null;
    @Autowired
    private UserService us;



    /**
     *用户 登录页面
     * @return
     */

    @RequestMapping("toLoginPage.do")
    public String toLoginPage(){

        return "login";
    }

    /**
     * 用户注册页面
     * @return
     */

    @RequestMapping("toRegisterPage.do")
    public String toRegisterPage(){

        return "formList";
    }

    /**
     * 用户注册
     * @param ul
     * @param request
     * @return
     */
    @RequestMapping("userRegister.do")
    public String userRegister(User1 ul, HttpServletRequest request){
        System.out.println(ul);
        Md5Hash encrypte = Ps.encrypte(ul, scale);
        String s = encrypte.toString();
        System.out.println("sjdfkjffffffffffffffffffffff"+"注册密码"+s);
        ul.setPassword(s);
        boolean b = us.checkUsername(ul.getUsername());
        us.userRegister(ul);
        if(b==true){
            page = "login";
        }else{
            page = "formList";
            msg = "用户名已存在";
            request.setAttribute("msg",msg);
        }

        return page;
    }

    /**
     * 用户管理界面
     * @param session
     * @param response
     * @return
     */
    @RequestMapping("checkSessionUser.do")
    public String checkSessionUser(HttpSession session,HttpServletResponse response){
        String msg = null;
        Object user = session.getAttribute("user");

        System.out.println(user.toString()+"checkSessionuser");
        if (us.checkLogin(user)==true){
           msg = "1";
        }

        JsonWrite.finalJson(msg,response);

        return null;
    }

    /**
     *
     * @param session
     * @param response
     * @return
     */

    @RequestMapping("s.do")
    public String checkLogin(HttpSession session, HttpServletResponse response,HttpServletRequest request){
        System.out.println("user checkLogin");
        Map<String,Object> map = new HashMap<>();
        Object user1 = request.getAttribute("usr");
        System.out.println("request li de user"+user1);
        Object user = session.getAttribute("usr");
        User1 user2 = (User1)session.getAttribute("usr");
        System.out.println(user2+"拿到的user信息");
        if (us.checkLogin(user)==true){
           state = "0";
           msg = "欢迎回来，"+user2.getUsername();
        }else{
            msg = "系统检测您还未登录，登录后可享受更多服务";
            state = "1";
        }


        map.put("msg",msg);
        map.put("state",state);
        System.out.println(map.get("state")+"拿到的state");
        JsonWrite.finalJson(map,response);
        return  null;
    }

    /**
     * 检测姓名
     * @param realname
     * @param response
     */



   @RequestMapping("cr.do")
    public void checkUsername(String realname, HttpServletResponse response){
        System.out.println("检测姓名"+realname);
        boolean b = us.checkUsername(realname);
       System.out.println("结果"+b);
        if(b==true){
            msg = "姓名可用";
        }else{
            msg = "姓名不可用";
        }
        JsonWrite.finalJson(msg,response);
    }

    /**
     *
     * 检测用户名
     * @param
     */


    @RequestMapping("cuu.do")
    public void checkUn(String user,HttpServletResponse response){
        System.out.println(user+"checkUn.do");
        String msg = us.checkUn(user);
        System.out.println(msg+"输出");
        JsonWrite.finalJson(msg,response);
    }


    /**
     * 检测首次密码
     * @param password
     * @param response
     */

    @RequestMapping("cp.do")
    public void cp(String password,HttpServletResponse response){
        System.out.println("check password"+password);
        String s = us.checkPassword(password);
        JsonWrite.finalJson(s,response);
    }



    /**
     * 密码二次校验
     * @param password
     * @param confirmPs
     */

    @RequestMapping("confirmPs.do")
    public void confirmPs(String password,String confirmPs,HttpServletResponse response){
        String msg = us.confirmPassword(password, confirmPs);
        System.out.println(msg);
        JsonWrite.finalJson(msg,response);
    }

    /**
     * 用户登录
     *
     */

    @RequestMapping("userLogin.do")
    public String userLogin(User1 ul, HttpServletRequest request,   HttpSession session){
        String infor = null;
        System.out.println(ul);
        boolean b = us.userLogin(ul);
        if(b == false){
            infor = "账号密码有误";
            page = "login";
        }else{
            User1 user = us.getUser(ul);
            System.out.println(user+"查到的用户信息");
            session.removeAttribute("usr");
            session.setAttribute("usr",user);
            page = "manager";
        }
        request.setAttribute("infor",infor);
        return  page;
    }

    /**
     * 用户注销
     * @param session
     * @return
     */

    @RequestMapping("logout.do")
    public String logout(HttpSession session){
        session.removeAttribute("usr");

        return "index";
    }

    /**
     * 用户列表
     * @return
     */

    @RequestMapping("ul.do")
    public String UserList(HttpServletResponse response){
        List<User1> user1s = us.UserList();
        for (User1 user:user1s
             ) {
            System.out.println(user+"打印user");
        }
        System.out.println(user1s.size());
        JsonWrite.finalJson(user1s,response);
        return null;
    }
    @RequestMapping("toC.do")
    public String toComment(){

        return "comment";
    }
    @RequestMapping("toAboutMe.do")
    public String toAboutMe(){
        return "aboutme";
    }
}
