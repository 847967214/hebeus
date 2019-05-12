package com.sen.hebeu.service.impl;

import com.sen.hebeu.mapper.TbAcademyMapper;
import com.sen.hebeu.pojo.TbAcademy;
import com.sen.hebeu.pojo.TbAcademyExample;
import com.sen.hebeu.service.AcademyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AcademyServiceImpl implements AcademyService {

    @Autowired
    private TbAcademyMapper tbAcademyMapper;

    /**
     * 通过用户id获取学院名称
     *
     * @param id
     * @return academyName
     */
    @Override
    public String getAcademyById(Integer id) {
        TbAcademy tbAcademy = tbAcademyMapper.selectByPrimaryKey(id);
        if (tbAcademy==null)
            return "";
        return tbAcademy.getAcademyName();
    }

    /**
     * 获取所有学院所有信息
     *
     * @return
     */
    @Override
    public List<TbAcademy> getListAcademy() {
        TbAcademyExample tbAcademyExample = new TbAcademyExample();
        tbAcademyExample.createCriteria();
        List<TbAcademy> tbAcademies = tbAcademyMapper.selectByExample(tbAcademyExample);
        return tbAcademies;
    }
}
