package com.sen.hebeu.controller;

import com.sen.hebeu.mapper.TbUserMapper;
import com.sen.hebeu.pojo.TbUser;
import com.sen.hebeu.service.UserService;
import com.sen.hebeu.util.CookieUtils;
import com.sen.hebeu.util.HebeuResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;


    @RequestMapping("/page/register")
    public String showRegister() {
        return "register";
    }

    @RequestMapping("/page/login")
    public String showLogin() {
        return "login";
    }

    @RequestMapping(value="/user/register", method= RequestMethod.POST)
    @ResponseBody
    public Boolean register(TbUser user) {

        System.out.println(user.getUserName());
        System.out.println(user.getUserPassword());
        Boolean flag = userService.registerUser(user.getUserName(),user.getUserPassword());
        return flag;
    }



    @RequestMapping("/user/check/{param}/{type}")
    @ResponseBody
    public Boolean checkData(@PathVariable String param, @PathVariable Integer type) {
        Boolean checkData = userService.checkData(param, type);
        System.out.println(param);
        return checkData;
    }


    @RequestMapping(value="/user/login", method=RequestMethod.POST)
    @ResponseBody
    public HebeuResult login(String username, String password, HttpServletRequest request, HttpServletResponse response) {

        System.out.println(username);
        System.out.println(password);
        HebeuResult result = userService.login(username, password);
//        String token = result.getData().toString();
//        CookieUtils.setCookie(request, response,"SHARE_COOKIE_HEBEU" , token);
        return result;

    }

    @RequestMapping("/user/token/{token}")
    @ResponseBody
    public HebeuResult getUserByToken(@PathVariable String token) {
        HebeuResult result = userService.getUserByToken(token);
        return result;
    }




}
