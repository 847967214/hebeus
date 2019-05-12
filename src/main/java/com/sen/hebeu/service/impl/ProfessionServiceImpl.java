package com.sen.hebeu.service.impl;

import com.sen.hebeu.mapper.TbProfessionMapper;
import com.sen.hebeu.pojo.TbProfession;
import com.sen.hebeu.pojo.TbProfessionExample;
import com.sen.hebeu.service.ProfessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProfessionServiceImpl implements ProfessionService {

    @Autowired
    private TbProfessionMapper professionMapper;

    /**
     * 通过用户id获取用户专业
     *
     * @param id
     * @return String ProfessionName
     */
    @Override
    public String getProfessionById(Integer id) {

        TbProfession tbProfession = professionMapper.selectByPrimaryKey(id);
        if (tbProfession==null)
            return "";
        return tbProfession.getProfessionName();
    }

    @Override
    public List<TbProfession> getProfessionByAcademyId(Integer academyId) {
        TbProfessionExample tbProfessionExample = new TbProfessionExample();
        TbProfessionExample.Criteria criteria = tbProfessionExample.createCriteria();
        criteria.andAcademyIdEqualTo(academyId);

        List<TbProfession> tbProfessions = professionMapper.selectByExample(tbProfessionExample);
        return tbProfessions;
    }
}
