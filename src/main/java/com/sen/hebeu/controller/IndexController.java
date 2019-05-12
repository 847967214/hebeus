package com.sen.hebeu.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sen.hebeu.pojo.TbContent;
import com.sen.hebeu.pojo.TbContentCategory;
import com.sen.hebeu.pojo.TbUser;
import com.sen.hebeu.pojo.TbUserInformation;
import com.sen.hebeu.service.*;
import com.sen.hebeu.util.HebeuResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class IndexController {


    @Autowired
    private UserInformationService userInformationService;
    @Autowired
    private AcademyService academyService;
    @Autowired
    private ProfessionService professionService;
    @Autowired
    private ContentCategoryService contentCategoryService;
    @Autowired
    private ContentService contentService;

    /**
     * 返回首页视图
     * @param model
     * @return
     */
    @RequestMapping("/")
//    @ResponseBody
    public String index(Model model){
        // loginService.getLoginOpenId("1111");
        TbUserInformation userInformationById = userInformationService.getUserInformationById(new Long(111));
        Integer academyId = userInformationById.getAcademyId();
        Integer professionId = userInformationById.getProfessionId();
        String academyName = academyService.getAcademyById(academyId);
        String professionName = professionService.getProfessionById(professionId);
        List<TbContentCategory> catgoryP = contentCategoryService.getCatgoryIdBy(new Long(100));
        model.addAttribute("catgoryP",catgoryP);
        //List<TbContentCategory> catgoryIdBy = contentCategoryService.getCatgoryIdBy(new Long(200));
        List<List<TbContentCategory>> listCategory = new ArrayList<>();
        List<List<TbContent>> listContent = new ArrayList<>();
        Long categoryId ,id;
        List<TbContent> titleByCategoryId;
        for (TbContentCategory contentCategory: catgoryP) {
            categoryId = contentCategory.getId();
            List<TbContentCategory> catgoryIdBy = contentCategoryService.getCatgoryIdBy(categoryId);
            for (TbContentCategory catgory:catgoryIdBy){
                id = catgory.getId();
                titleByCategoryId = contentService.getTitleByCategoryId(id);
                listContent.add(titleByCategoryId);
            }
            listCategory.add(catgoryIdBy);
        }
        model.addAttribute("listCategory",listCategory);
        model.addAttribute("listContent",listContent);
//        model.addAttribute("catgroyid",catgoryIdBy);
//        List<List<TbContent>> lists = new ArrayList<>();
//        for (TbContentCategory contentCategory: catgoryIdBy) {
//            id = contentCategory.getId();
//            titleByCategoryId = contentService.getTitleByCategoryId(id);
//            lists.add(titleByCategoryId);
//
//        }
//        model.addAttribute("lists",lists);

       // List<TbContent> titleByCategoryId = contentService.getTitleByCategoryId(new Long(301));
        //model.addAttribute("title",titleByCategoryId);
        String label = userInformationById.getLabel();
        JSON json = JSONObject.parseArray(label);
        model.addAttribute("user",userInformationById);
        model.addAttribute("json",json);
        model.addAttribute("academyName",academyName);
        model.addAttribute("professionName",professionName);
        return "index";
    }

    @RequestMapping(value="/ContentCategory/{id}")
    @ResponseBody
    public HebeuResult register(@PathVariable Long id) {
        List<TbContentCategory> catgoryIdBy = contentCategoryService.getCatgoryIdBy(id);
        return HebeuResult.ok(catgoryIdBy);
    }
}
