package com.sen.hebeu.mapper;

import com.sen.hebeu.pojo.TbContentDesc;
import com.sen.hebeu.pojo.TbContentDescExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TbContentDescMapper {
    int countByExample(TbContentDescExample example);

    int deleteByExample(TbContentDescExample example);

    int deleteByPrimaryKey(Long contentId);

    int insert(TbContentDesc record);

    int insertSelective(TbContentDesc record);

    List<TbContentDesc> selectByExampleWithBLOBs(TbContentDescExample example);

    List<TbContentDesc> selectByExample(TbContentDescExample example);

    TbContentDesc selectByPrimaryKey(Long contentId);

    int updateByExampleSelective(@Param("record") TbContentDesc record, @Param("example") TbContentDescExample example);

    int updateByExampleWithBLOBs(@Param("record") TbContentDesc record, @Param("example") TbContentDescExample example);

    int updateByExample(@Param("record") TbContentDesc record, @Param("example") TbContentDescExample example);

    int updateByPrimaryKeySelective(TbContentDesc record);

    int updateByPrimaryKeyWithBLOBs(TbContentDesc record);

    int updateByPrimaryKey(TbContentDesc record);
}