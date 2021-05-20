package com.hdt.auction.dao;

import java.util.List;

import com.hdt.auction.entity.Show;

public interface ShowMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Show record);

	int insertSelective(Show record);

	Show selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Show record);

	int updateByPrimaryKey(Show record);

	List<Show> getShowByname(String name);
	
	void deletArtrBatch(List<Long> ids);
}