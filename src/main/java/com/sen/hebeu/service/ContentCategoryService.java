package com.sen.hebeu.service;


import com.sen.hebeu.pojo.TbContentCategory;

import java.util.List;

public interface ContentCategoryService {


    /**
     * 获得子标签 返回id数组
     * @param id
     * @return List<TbContentCategory>
     */
    List<TbContentCategory> getCatgoryIdBy(Long id);

    /**
     * 通过id获取名称
     * @param id
     * @return
     */
    String getCatgoryById(Long id);

}
