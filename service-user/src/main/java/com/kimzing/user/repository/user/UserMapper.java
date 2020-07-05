package com.kimzing.user.repository.user;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kimzing.user.domain.user.UserBO;
import com.kimzing.user.domain.user.UserPO;
import com.kimzing.user.domain.user.UserQueryDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 用户信息仓储.
 *
 * @author KimZing - kimzing@163.com
 * @since 2020/7/1 19:58
 */
@Mapper
public interface UserMapper {

    /**
     * 保存用户信息
     * @param userPO
     * @return
     */
    Integer insert(UserPO userPO);

    /**
     * 删除用户信息
     * @param id
     */
    void delete(Integer id);

    /**
     * 根据ID更新用户信息
     * @param userPO
     */
    void update(UserPO userPO);

    /**
     * 根据ID查询用户信息
     * @param id
     * @return
     */
    UserBO select(Integer id);

    /**
     * 分页查询用户信息
     * @param page
     * @param userQueryDTO
     * @return
     */
    IPage<UserBO> selectPage(Page<UserBO> page, @Param("query") UserQueryDTO userQueryDTO);

}