package com.hdt.auction.service;

import java.util.List;

import com.hdt.auction.entity.Order;

public interface OrderService {
	List<Order> getOrderByDeliveryStatusId(Long id);

	List<Order> getOrderByOrderTypeId(Long id);

	List<Order> getAllOrder();

	List<Order> getOrderByBuyerId(Long id);

	List<Order> getOrderBySellerId(Long id);

	Order getOrderById(Long id);
	
	Order selectByArtId(Long art_id);

	void insertOrder(Order order);

	void updateOrder(Order order);

	void deleteOrderById(Long id);
	
	List<Order> getOrderByBuyerIdandTypeId(Long id,Long typeid);
	
	List<Order> getOrderBySellerIdandTypeId(Long id,Long typeid);
	
	int deleteOrderBatch(List<Long> ids);
}
