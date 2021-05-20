package com.hdt.auction.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdt.auction.entity.Follow;

public interface FollowMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Follow record);

    int insertSelective(Follow record);

    Follow selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Follow record);

    int updateByPrimaryKey(Follow record);
    
    List<Follow> getFollowbyUserid(Long user_id);
    
    Follow selectByUseridAndArtid(@Param("user_id")Long user_id,@Param("art_id")Long art_id);
}