package com.sen.hebeu.service;

import com.sen.hebeu.pojo.TbProfession;

import java.util.List;

public interface ProfessionService {


    /**
     * 通过用户id获取用户专业
     * @param id
     * @return String Profession
     */
    String getProfessionById(Integer id);

    List<TbProfession> getProfessionByAcademyId(Integer academyId);

}
