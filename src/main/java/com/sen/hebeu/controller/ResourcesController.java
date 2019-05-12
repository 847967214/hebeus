package com.sen.hebeu.controller;

import com.sen.hebeu.pojo.TbContent;
import com.sen.hebeu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResourcesController {

    @Autowired
    private ContentService contentService;
    @Autowired
    private AcademyService academyService;
    @Autowired
    private ProfessionService professionService;
    @Autowired
    private ContentCategoryService contentCategoryService;
    @Autowired
    private UserService userService;
    @RequestMapping("/resources/{id}")
//    @ResponseBody
    public String resources(@PathVariable Long id, Model model){
        TbContent contentById = contentService.getContentById(id);
        model.addAttribute("academy",academyService.getAcademyById(contentById.getAcademyId()));
        model.addAttribute("profession",professionService.getProfessionById(contentById.getProfessionId()));
        model.addAttribute("category",contentCategoryService.getCatgoryById(contentById.getCategoryId()));
        if (contentById.getClassify()!=null)
            model.addAttribute("classify",contentCategoryService.getCatgoryById(Long.valueOf(contentById.getClassify())));
        else
            model.addAttribute("classify","");
        model.addAttribute("username",userService.getUserNameById(contentById.getUserId()));
        model.addAttribute("content",contentById);


        return "resources";
    }

}
