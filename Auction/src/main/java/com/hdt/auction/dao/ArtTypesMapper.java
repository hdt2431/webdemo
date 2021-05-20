package com.hdt.auction.dao;

import java.util.List;

import com.hdt.auction.entity.ArtTypes;

public interface ArtTypesMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ArtTypes record);

    int insertSelective(ArtTypes record);

    ArtTypes selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ArtTypes record);

    int updateByPrimaryKeyWithBLOBs(ArtTypes record);

    int updateByPrimaryKey(ArtTypes record);
    
    List<ArtTypes> listallArtTypes();
    
    int deletetypesBatch(List<Long> ids);
}