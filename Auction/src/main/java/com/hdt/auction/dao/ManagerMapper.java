package com.hdt.auction.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdt.auction.entity.Manager;

public interface ManagerMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
    
    Manager findManagerByNameAndPwd(@Param("manager_name") String manager_name, @Param("manager_password") String manager_password);
    
    List<Manager> findManagerByAuthority(Integer authority);
    
    int deleteBatch(List<Long> ids);
}