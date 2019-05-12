package com.sen.hebeu.controller;

import com.sen.hebeu.pojo.TbContent;
import com.sen.hebeu.service.ContentService;
import com.sen.hebeu.service.UserInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class TestOne {

    @Autowired
    private UserInformationService userInformationService;
    @Autowired
    private ContentService contentService;


    @RequestMapping("/hello")
    public String hello(Model model){
        model.addAttribute("user","indea");
        List<TbContent> titleByCategoryId = contentService.getTitleByCategoryId(new Long(300));
        model.addAttribute("con",titleByCategoryId);

        return "hello";
    }
}
