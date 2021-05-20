package com.hdt.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdt.auction.dao.NewsMapper;
import com.hdt.auction.entity.News;
import com.hdt.auction.service.NewsService;
@Service
public class NewsServiceImpl implements NewsService {
	 @Autowired
	 NewsMapper newsMapper;
	public void insertNews(News news) {
		// TODO Auto-generated method stub
		newsMapper.insert(news);
	}

	public void updateNews(News news) {
		// TODO Auto-generated method stub
		newsMapper.updateByPrimaryKeySelective(news);
	}

	public void deleteNews(Long id) {
		// TODO Auto-generated method stub
		newsMapper.deleteByPrimaryKey(id);
	}

	public List<News> getAllNews() {
		// TODO Auto-generated method stub
		return newsMapper.getAllnews();
	}

}
