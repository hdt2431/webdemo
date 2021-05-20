package com.hdt.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdt.auction.dao.FollowMapper;
import com.hdt.auction.entity.Follow;
import com.hdt.auction.service.FollowService;
@Service
public class FollowServiceImpl implements FollowService {
	 @Autowired
	 FollowMapper followMapper;
	public void insertFollow(Follow follow) {
		// TODO Auto-generated method stub
		followMapper.insert(follow);
	}

	public void deleteFollow(Long id) {
		// TODO Auto-generated method stub
		followMapper.deleteByPrimaryKey(id);
	}

	public void updateFollow(Follow follow) {
		// TODO Auto-generated method stub
		followMapper.updateByPrimaryKeySelective(follow);
	}

	public List<Follow> getFollowbyUserid(Long user_id) {
		// TODO Auto-generated method stub
		return followMapper.getFollowbyUserid(user_id);
	}

	public Boolean selectByUseridAndArtid(Long user_id, Long art_id) {
		// TODO Auto-generated method stub
		Follow follow =null;
		follow = followMapper.selectByUseridAndArtid(user_id, art_id);
		if(follow==null)
			return true;
		else {
			return false;
		}
		
	}

	public Follow selectByUseridAndArtid2(Long user_id, Long art_id) {
		// TODO Auto-generated method stub
		return followMapper.selectByUseridAndArtid(user_id, art_id);
	}

}
