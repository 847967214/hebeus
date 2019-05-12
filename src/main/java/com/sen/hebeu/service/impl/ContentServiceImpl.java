package com.sen.hebeu.service.impl;

import com.sen.hebeu.mapper.TbContentMapper;
import com.sen.hebeu.pojo.TbContent;
import com.sen.hebeu.pojo.TbContentExample;
import com.sen.hebeu.service.ContentService;
import com.sen.hebeu.util.HebeuResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ContentServiceImpl implements ContentService {
    @Autowired
    private TbContentMapper contentMapper;

    /**
     * 获取标题列表
     *
     * @param categoryId
     * @return
     */
    @Override
    public List<TbContent> getTitleByCategoryId(Long categoryId) {

        TbContentExample example =  new TbContentExample();
        TbContentExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryIdEqualTo(categoryId);

        List<TbContent> tbContents = contentMapper.selectByExampleWithBLOBs(example);

        return tbContents;
    }


    @Override
    public String getTitleById(Long id) {
        TbContent tbContent = contentMapper.selectByPrimaryKey(id);
        return tbContent.getTitle();
    }

    /**
     * 获取详细信息
     *
     * @param id
     * @return
     */
    @Override
    public TbContent getContentById(Long id) {
        TbContent content = contentMapper.selectByPrimaryKey(id);
        return content;
    }

    /**
     * 发布信息
     *
     * @param content
     * @return
     */
    @Override
    public Boolean publishByContent(TbContent content) {
        content.setUpdated(new Date());
        int i = contentMapper.insertSelective(content);
        return i>0?true:false;
    }

    /**
     * 通过给定条件查询列表
     *
     * @param content
     * @return
     */
    @Override
    public HebeuResult downloadList(TbContent content) {
        TbContentExample example = new TbContentExample();
        TbContentExample.Criteria criteria = example.createCriteria();
        if (content.getAcademyId()!=null&&!content.getAcademyId().toString().isEmpty())
            criteria.andAcademyIdEqualTo(content.getAcademyId());
        if (content.getProfessionId()!=null&&!content.getProfessionId().toString().isEmpty())
            criteria.andProfessionIdEqualTo(content.getProfessionId());
        if (content.getCategoryId()!=null &&!content.getCategoryId().toString().isEmpty())
        criteria.andCategoryIdEqualTo(content.getCategoryId());
        if (content.getGradeLevel()!=null &&!content.getGradeLevel().toString().isEmpty())
        criteria.andGradeLevelEqualTo(content.getGradeLevel());
        if (content.getMacrotaxonomy()!=null &&!content.getMacrotaxonomy().toString().isEmpty() )
        criteria.andMacrotaxonomyEqualTo(content.getMacrotaxonomy());
        if (content.getClassify()!=null &&!content.getClassify().toString().isEmpty())
        criteria.andClassifyEqualTo(content.getClassify());
        if (content.getFormat()!=null &&!content.getFormat().toString().isEmpty())
        criteria.andFormatEqualTo(content.getFormat());
        List<TbContent> tbContents = contentMapper.selectByExampleWithBLOBs(example);
        if (tbContents.size()>0)
            return HebeuResult.ok(tbContents);
        return HebeuResult.build(400,"没有查询结果");
    }
}
