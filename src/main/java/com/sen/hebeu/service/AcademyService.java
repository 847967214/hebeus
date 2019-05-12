package com.sen.hebeu.service;

import com.sen.hebeu.pojo.TbAcademy;

import java.util.List;

public interface AcademyService {


    /**
     * 通过用户id获取学院名称
     * @param id
     * @return
     */
    String getAcademyById(Integer id);

    /**
     * 获取所有学院所有信息
     * @return
     */
    List<TbAcademy> getListAcademy();

}
