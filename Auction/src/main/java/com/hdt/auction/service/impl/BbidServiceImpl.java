package com.hdt.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdt.auction.dao.BidMapper;
import com.hdt.auction.entity.Bid;
import com.hdt.auction.service.BidService;
@Service
public class BbidServiceImpl implements BidService {
	@Autowired
	BidMapper bidMapper;
	public List<Bid> getbidByuser_id(Long user_id) {
		// TODO Auto-generated method stub
		return bidMapper.getbidByuser_id(user_id);
	}

	public List<Bid> getbidByart_id(Long art_id) {
		// TODO Auto-generated method stub
		return bidMapper.getbidByart_id(art_id);
	}

	public Bid getbid(Long id) {
		// TODO Auto-generated method stub
		return bidMapper.selectByPrimaryKey(id);
	}

	public void insertBid(Bid bid) {
		// TODO Auto-generated method stub
		bidMapper.insertSelective(bid);
	}

	public void updateBid(Bid bid) {
		// TODO Auto-generated method stub
		bidMapper.updateByPrimaryKeySelective(bid);
	}

	public void deleteBid(Long id) {
		// TODO Auto-generated method stub
		bidMapper.deleteByPrimaryKey(id);
	}

	public List<Long> getArtByUserFromBid(Long user_id) {
		// TODO Auto-generated method stub
		return bidMapper.getArtByUserFromBid(user_id);
	}

}
