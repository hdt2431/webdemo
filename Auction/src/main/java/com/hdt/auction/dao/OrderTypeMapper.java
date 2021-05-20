package com.hdt.auction.dao;

import com.hdt.auction.entity.OrderType;
import com.hdt.auction.entity.OrderTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderTypeMapper {
    long countByExample(OrderTypeExample example);

    int deleteByExample(OrderTypeExample example);

    int deleteByPrimaryKey(Long id);

    int insert(OrderType record);

    int insertSelective(OrderType record);

    List<OrderType> selectByExample(OrderTypeExample example);

    OrderType selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") OrderType record, @Param("example") OrderTypeExample example);

    int updateByExample(@Param("record") OrderType record, @Param("example") OrderTypeExample example);

    int updateByPrimaryKeySelective(OrderType record);

    int updateByPrimaryKey(OrderType record);
}