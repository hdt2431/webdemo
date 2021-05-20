package com.hdt.auction.dao;

import java.util.List;

import com.hdt.auction.entity.Information;

public interface InformationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Information record);

    int insertSelective(Information record);

    Information selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Information record);

    int updateByPrimaryKeyWithBLOBs(Information record);

    int updateByPrimaryKey(Information record);
    
    List<Information> getInfoByuserId(Long user_id);
    
    List<Information> getInfoByis_audit(Byte is_audit);
    
    int deleteBatch(List<Long> ids);
}