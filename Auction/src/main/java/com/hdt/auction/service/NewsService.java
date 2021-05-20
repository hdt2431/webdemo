package com.hdt.auction.service;

import java.util.List;

import com.hdt.auction.entity.News;
public interface NewsService {
	void insertNews(News news);
	
	void updateNews(News news);
	
	void deleteNews(Long id);
	
	List<News> getAllNews();
}
