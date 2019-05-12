package com.sen.hebeu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutmyController {

    @RequestMapping("/page/aboutwe")
    public String avoutmePage(Model model){
        return "aboutUS";
    }
}
