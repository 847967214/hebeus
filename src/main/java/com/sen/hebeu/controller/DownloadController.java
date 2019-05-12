package com.sen.hebeu.controller;

import com.sen.hebeu.pojo.TbContent;
import com.sen.hebeu.service.ContentService;
import com.sen.hebeu.util.HebeuResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DownloadController {

    @Autowired
    private ContentService contentService;

    @RequestMapping("/page/download")
    public String downloadPage(Model model){
        return "download";
    }

    @RequestMapping("/download/list")
    @ResponseBody
    public HebeuResult downloadList(TbContent content){
        HebeuResult result = contentService.downloadList(content);
        return result;
    }

}
