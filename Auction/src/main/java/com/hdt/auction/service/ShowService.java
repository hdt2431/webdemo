package com.hdt.auction.service;

import java.util.List;

import com.hdt.auction.entity.Show;

public interface ShowService {
	void insertShow(Show show);

	void deleteShow(Long id);

	void updateShow(Show show);

	List<Show> getShowByname(String name);
	
	int deleteShowOrderBatch(List<Long> ids);
}
