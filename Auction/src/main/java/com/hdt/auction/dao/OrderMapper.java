package com.hdt.auction.dao;

import com.hdt.auction.entity.Order;
import com.hdt.auction.entity.OrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
	long countByExample(OrderExample example);

	int deleteByExample(OrderExample example);

	int deleteByPrimaryKey(Long id);

	int insert(Order record);

	int insertSelective(Order record);

	List<Order> selectByExample(OrderExample example);

	Order selectByPrimaryKey(Long id);
	
	Order selectByArtId(Long art_id);

	int updateByExampleSelective(@Param("record") Order record, @Param("example") OrderExample example);

	int updateByExample(@Param("record") Order record, @Param("example") OrderExample example);

	int updateByPrimaryKeySelective(Order record);

	int updateByPrimaryKey(Order record);

	List<Order> getOrderByDeliveryStatusId(long id);

	List<Order> getAllOrder();

	List<Order> getOrderByOrderTypeId(long id);

	List<Order> getOrderByBuyerId(long id);

	List<Order> getOrderBySellerId(long id);
	
	List<Order> getOrderByBuyerIdandTypeId(@Param("id") Long id, @Param("typeid") Long typeid);
	
	List<Order> getOrderBySellerIdandTypeId(@Param("id") Long id, @Param("typeid") Long typeid);
	
	int deleteOrderBatch(List<Long> ids);
	

}