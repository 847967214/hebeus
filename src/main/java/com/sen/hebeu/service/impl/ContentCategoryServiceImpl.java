package com.sen.hebeu.service.impl;

import com.sen.hebeu.mapper.TbContentCategoryMapper;
import com.sen.hebeu.pojo.TbContentCategory;
import com.sen.hebeu.pojo.TbContentCategoryExample;
import com.sen.hebeu.service.ContentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentCategoryServiceImpl implements ContentCategoryService {

    @Autowired
    private TbContentCategoryMapper contentCategoryMapper;

    /**
     * 获得子标签 返回id数组
     *
     * @param id
     * @return
     */
    @Override
    public List<TbContentCategory> getCatgoryIdBy(Long id) {
        TbContentCategoryExample example = new TbContentCategoryExample();
        TbContentCategoryExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(id);
        List<TbContentCategory> tbContentCategories = contentCategoryMapper.selectByExample(example);
        return tbContentCategories;
    }

    /**
     * 通过id获取名称
     *
     * @param id
     * @return
     */
    @Override
    public String getCatgoryById(Long id) {
        TbContentCategory tbContentCategory = contentCategoryMapper.selectByPrimaryKey(id);
        if (tbContentCategory==null)
            return "";
        return tbContentCategory.getName();
    }
}
