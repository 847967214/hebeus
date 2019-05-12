package com.sen.hebeu.service;



import com.sen.hebeu.pojo.TbContent;
import com.sen.hebeu.util.HebeuResult;

public interface UserService {

    Boolean checkData(String param, Integer type);
    Boolean registerUser(String userName, String password);
    HebeuResult login(String userName, String password);
    HebeuResult getUserByToken(String token) ;

    /**
     * 通过id 获取用户名
     * @param id
     * @return
     */
    String getUserNameById(Long id);


}
