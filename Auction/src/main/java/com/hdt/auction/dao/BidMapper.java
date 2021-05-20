package com.hdt.auction.dao;

import java.util.List;

import com.hdt.auction.entity.Bid;

public interface BidMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Bid record);

    int insertSelective(Bid record);

    Bid selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Bid record);

    int updateByPrimaryKey(Bid record);
    
    List<Bid> getbidByuser_id(Long user_id);
    
    List<Bid> getbidByart_id(Long art_id);
    
    List<Long> getArtByUserFromBid(Long user_id);
}