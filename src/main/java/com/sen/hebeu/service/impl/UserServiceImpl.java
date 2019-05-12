package com.sen.hebeu.service.impl;

import com.sen.hebeu.mapper.TbUserCookieMapper;
import com.sen.hebeu.mapper.TbUserMapper;
import com.sen.hebeu.pojo.TbUser;
import com.sen.hebeu.pojo.TbUserCookie;
import com.sen.hebeu.pojo.TbUserCookieExample;
import com.sen.hebeu.pojo.TbUserExample;
import com.sen.hebeu.service.UserService;
import com.sen.hebeu.util.HebeuResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private TbUserMapper userMapper;
    @Autowired
    private TbUserCookieMapper userCookieMapper;

    /**
     * 检查数据是否存在 用户名
     * @param param
     * @param type
     * @return
     */
    @Override
    public Boolean checkData(String param, Integer type) {
        Boolean flag =true;
        if (type==1){
            TbUserExample tbUserExample = new TbUserExample();
            TbUserExample.Criteria criteria = tbUserExample.createCriteria();
            criteria.andUserNameEqualTo(param);
            int i = userMapper.countByExample(tbUserExample);
            flag = i > 0 ? false : true;
        }
        return flag;
    }


    /**
     * 用户注册
     * @param user
     * @return
     */
    @Override
    public Boolean registerUser(String userName, String password) {

        TbUser tbUser = new TbUser();
        tbUser.setUserName(userName);
        tbUser.setUserPassword(password);
        tbUser.setRegistrationDate(new Date());
        int i = userMapper.insertSelective(tbUser);
        return i>0?true:false;
    }


    /**
     * 用户登录
     * @param userName
     * @param password
     * @return
     */
    @Override
    public HebeuResult login(String userName, String password) {
        TbUserExample example = new TbUserExample();
        TbUserExample.Criteria criteria = example.createCriteria();
        criteria.andUserNameEqualTo(userName);
        criteria.andUserPasswordEqualTo(password);
        List<TbUser> tbUsers = userMapper.selectByExample(example);
        if (tbUsers.size()>0){
            // 2、登录成功后生成token。Token相当于原来的jsessionid，字符串，可以使用uuid。
            String token = UUID.randomUUID().toString();
            TbUserCookie tbUserCookie = new TbUserCookie();
            tbUserCookie.setCookie(token);
            tbUserCookie.setUserId(tbUsers.get(0).getUserId());
            TbUserCookie tbUserCookie1 = userCookieMapper.selectByPrimaryKey(tbUsers.get(0).getUserId());
            if (tbUserCookie1!=null)
                userCookieMapper.updateByPrimaryKeySelective(tbUserCookie);
            else
                userCookieMapper.insertSelective(tbUserCookie);
            return HebeuResult.ok(token);

        }
        return HebeuResult.build(400,"用户名或密码错误！！");
    }

    @Override
    public HebeuResult getUserByToken(String token) {
        TbUserCookieExample tbUserCookieExample = new TbUserCookieExample();
        TbUserCookieExample.Criteria criteria = tbUserCookieExample.createCriteria();
        criteria.andCookieEqualTo(token);

        List<TbUserCookie> tbUserCookies = userCookieMapper.selectByExample(tbUserCookieExample);
        if (tbUserCookies.size()>0){
            TbUser tbUser = userMapper.selectByPrimaryKey(tbUserCookies.get(0).getUserId());
            tbUser.setUserPassword(null);
            return HebeuResult.ok(tbUser);
        }
        return HebeuResult.build(400,"登陆失败");
    }

    /**
     * 通过id 获取用户名
     *
     * @param id
     * @return
     */
    @Override
    public String getUserNameById(Long id) {
        TbUser tbUser = userMapper.selectByPrimaryKey(id);
        return tbUser.getUserName();
    }
}
