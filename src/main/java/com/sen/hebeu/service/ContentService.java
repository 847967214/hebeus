package com.sen.hebeu.service;

import com.sen.hebeu.pojo.TbContent;
import com.sen.hebeu.util.HebeuResult;

import java.util.List;

public interface ContentService {


    /**
     * 获取标题列表
     * @param categoryId
     * @return
     */
    List<TbContent> getTitleByCategoryId(Long categoryId);

    String getTitleById(Long id);

    /**
     * 获取详细信息
     * @param id
     * @return
     */
    TbContent getContentById(Long id);

    /**
     * 发布信息
     * @param content
     * @return
     */
    Boolean publishByContent(TbContent content);

    /**
     * 通过给定条件查询列表
     * @param content
     * @return
     */
    HebeuResult downloadList(TbContent content);
}
