package com.hdt.auction.service;

import java.util.List;

import com.hdt.auction.entity.Bid;

public interface BidService {
	List<Bid> getbidByuser_id(Long user_id);

	List<Bid> getbidByart_id(Long art_id);

	Bid getbid(Long id);

	void insertBid(Bid bid);

	void updateBid(Bid bid);

	void deleteBid(Long id);
	
	List<Long> getArtByUserFromBid(Long user_id);
}
