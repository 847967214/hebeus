package com.sen.hebeu.controller;

import com.sen.hebeu.pojo.TbAcademy;
import com.sen.hebeu.pojo.TbContent;
import com.sen.hebeu.pojo.TbProfession;
import com.sen.hebeu.service.AcademyService;
import com.sen.hebeu.service.ContentService;
import com.sen.hebeu.service.ProfessionService;
import com.sen.hebeu.util.HebeuResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
public class PublishController {

    @Autowired
    private AcademyService academyService;
    @Autowired
    private ProfessionService professionService;
    @Autowired
    private ContentService contentService;

    @RequestMapping("/academy/list")
    @ResponseBody
    public HebeuResult getUserByToken() {

        List<TbAcademy> listAcademy = academyService.getListAcademy();
        return HebeuResult.ok(listAcademy);
    }

    @RequestMapping("/profession/{academyId}")
    @ResponseBody
    public HebeuResult getUserByToken(@PathVariable Integer academyId) {
        List<TbProfession> professionByAcademyId = professionService.getProfessionByAcademyId(academyId);

        return HebeuResult.ok(professionByAcademyId);
    }

    @RequestMapping("/publish")
    @ResponseBody
    public HebeuResult publishContent(TbContent content){
        System.out.println(content.getTitle());
        System.out.println("用户id:"+content.getUserId());
        Boolean aBoolean = contentService.publishByContent(content);
        return HebeuResult.ok(aBoolean);
    }
}
