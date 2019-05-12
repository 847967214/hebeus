package com.sen.hebeu.mapper;

import com.sen.hebeu.pojo.TbUserCookie;
import com.sen.hebeu.pojo.TbUserCookieExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TbUserCookieMapper {
    int countByExample(TbUserCookieExample example);

    int deleteByExample(TbUserCookieExample example);

    int deleteByPrimaryKey(Long userId);

    int insert(TbUserCookie record);

    int insertSelective(TbUserCookie record);

    List<TbUserCookie> selectByExample(TbUserCookieExample example);

    TbUserCookie selectByPrimaryKey(Long userId);

    int updateByExampleSelective(@Param("record") TbUserCookie record, @Param("example") TbUserCookieExample example);

    int updateByExample(@Param("record") TbUserCookie record, @Param("example") TbUserCookieExample example);

    int updateByPrimaryKeySelective(TbUserCookie record);

    int updateByPrimaryKey(TbUserCookie record);
}