package com.hdt.auction.dao;

import org.apache.ibatis.annotations.Param;

import com.hdt.auction.entity.User;

public interface UserMapper {
	int deleteByPrimaryKey(Long id);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	User findUserByNameAndPwd(@Param("user_name") String user_name, @Param("user_password") String user_password);

	User findUserByName(@Param("user_name") String user_name);

}