package com.hdt.auction.service;

import java.util.List;

import com.hdt.auction.entity.Follow;

public interface FollowService {
	void insertFollow(Follow follow);

	void deleteFollow(Long id);

	void updateFollow(Follow follow);

	List<Follow> getFollowbyUserid(Long user_id);
	
	Boolean selectByUseridAndArtid(Long user_id,Long art_id);
	
	Follow selectByUseridAndArtid2(Long user_id,Long art_id);
}
