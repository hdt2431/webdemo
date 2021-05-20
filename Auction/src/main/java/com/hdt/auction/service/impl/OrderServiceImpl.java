package com.hdt.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdt.auction.dao.OrderMapper;
import com.hdt.auction.entity.Order;
import com.hdt.auction.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderMapper orderMapper;
	public List<Order> getOrderByDeliveryStatusId(Long id) {
		// TODO Auto-generated method stub
		return orderMapper.getOrderByDeliveryStatusId(id);
	}

	public List<Order> getOrderByOrderTypeId(Long id) {
		// TODO Auto-generated method stub		
		return orderMapper.getOrderByOrderTypeId(id);
	}

	public List<Order> getAllOrder() {
		// TODO Auto-generated method stub
		return orderMapper.getAllOrder();
	}

	public void insertOrder(Order order) {
		// TODO Auto-generated method stub
		orderMapper.insertSelective(order);
	}

	public void updateOrder(Order order) {
		// TODO Auto-generated method stub
		orderMapper.updateByPrimaryKeySelective(order);
	}

	public void deleteOrderById(Long id) {
		// TODO Auto-generated method stub
		orderMapper.deleteByPrimaryKey(id);
	}

	public List<Order> getOrderByBuyerId(Long id) {
		// TODO Auto-generated method stub
		return orderMapper.getOrderByBuyerId(id);
	}

	public List<Order> getOrderBySellerId(Long id) {
		// TODO Auto-generated method stub
		return orderMapper.getOrderBySellerId(id);
	}

	public Order getOrderById(Long id) {
		// TODO Auto-generated method stub
		return orderMapper.selectByPrimaryKey(id);
	}

	public List<Order> getOrderByBuyerIdandTypeId(Long id, Long typeid) {
		// TODO Auto-generated method stub
		return orderMapper.getOrderByBuyerIdandTypeId(id, typeid);
	}

	public List<Order> getOrderBySellerIdandTypeId(Long id, Long typeid) {
		// TODO Auto-generated method stub
		return orderMapper.getOrderBySellerIdandTypeId(id, typeid);
	}

	public Order selectByArtId(Long art_id) {
		// TODO Auto-generated method stub
		return orderMapper.selectByArtId(art_id);
	}

	public int deleteOrderBatch(List<Long> ids) {
		// TODO Auto-generated method stub
		orderMapper.deleteOrderBatch(ids);
		return 0;
	}

}
