package com.sen.hebeu.mapper;

import com.sen.hebeu.pojo.TbUserInformation;
import com.sen.hebeu.pojo.TbUserInformationExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TbUserInformationMapper {
    int countByExample(TbUserInformationExample example);

    int deleteByExample(TbUserInformationExample example);

    int deleteByPrimaryKey(Long userId);

    int insert(TbUserInformation record);

    int insertSelective(TbUserInformation record);

    List<TbUserInformation> selectByExample(TbUserInformationExample example);

    TbUserInformation selectByPrimaryKey(Long userId);

    int updateByExampleSelective(@Param("record") TbUserInformation record, @Param("example") TbUserInformationExample example);

    int updateByExample(@Param("record") TbUserInformation record, @Param("example") TbUserInformationExample example);

    int updateByPrimaryKeySelective(TbUserInformation record);

    int updateByPrimaryKey(TbUserInformation record);
}