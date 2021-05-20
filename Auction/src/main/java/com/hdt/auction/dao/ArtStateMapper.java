package com.hdt.auction.dao;

import com.hdt.auction.entity.ArtState;

public interface ArtStateMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ArtState record);

    int insertSelective(ArtState record);

    ArtState selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ArtState record);

    int updateByPrimaryKey(ArtState record);
}