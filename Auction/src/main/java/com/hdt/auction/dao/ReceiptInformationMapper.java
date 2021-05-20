package com.hdt.auction.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdt.auction.entity.ReceiptInformation;

public interface ReceiptInformationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ReceiptInformation record);

    int insertSelective(ReceiptInformation record);

    ReceiptInformation selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ReceiptInformation record);

    int updateByPrimaryKey(ReceiptInformation record);
    
     List<ReceiptInformation> getReceiptInfoByUserId(Long user_id);
     
     ReceiptInformation selectByIdandIs_default(@Param("user_id") Long user_id,@Param("is_DefaultAddress")Byte is_DefaultAddress);
}