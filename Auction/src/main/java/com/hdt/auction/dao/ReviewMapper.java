package com.hdt.auction.dao;

import com.hdt.auction.entity.Review;

public interface ReviewMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Review record);

    int insertSelective(Review record);

    Review selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Review record);

    int updateByPrimaryKeyWithBLOBs(Review record);

    int updateByPrimaryKey(Review record);
}