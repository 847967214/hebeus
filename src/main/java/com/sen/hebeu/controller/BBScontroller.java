package com.sen.hebeu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BBScontroller {

    @RequestMapping("/page/bbs")
    public String BBSPage(Model model){
        return "bbs";
    }
}

