package com.hdt.auction.dao;

import com.hdt.auction.entity.DeliveryStatus;
import com.hdt.auction.entity.DeliveryStatusExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeliveryStatusMapper {
    long countByExample(DeliveryStatusExample example);

    int deleteByExample(DeliveryStatusExample example);

    int deleteByPrimaryKey(Long id);

    int insert(DeliveryStatus record);

    int insertSelective(DeliveryStatus record);

    List<DeliveryStatus> selectByExample(DeliveryStatusExample example);

    DeliveryStatus selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") DeliveryStatus record, @Param("example") DeliveryStatusExample example);

    int updateByExample(@Param("record") DeliveryStatus record, @Param("example") DeliveryStatusExample example);

    int updateByPrimaryKeySelective(DeliveryStatus record);

    int updateByPrimaryKey(DeliveryStatus record);
}