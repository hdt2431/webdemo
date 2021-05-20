package com.hdt.auction.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdt.auction.dto.Msg;
import com.hdt.auction.entity.News;
import com.hdt.auction.service.NewsService;

@Controller
public class NewsController {
	@Autowired
	NewsService newsService;
	@RequestMapping(value="/insertNews")
	@ResponseBody
	public Msg insertNews(News news) {
		news.setPublish_time(new Date());
		news.setGmt_create(new Date());
		news.setGmt_modified(new Date());
		newsService.insertNews(news);
		
		return Msg.success().add("newsInfo", news);
	}
	@RequestMapping(value="/getAllnews")
	@ResponseBody
	public Msg getAllnews() {
		List<News> news = newsService.getAllNews();
		
		return Msg.success().add("newsInfo", news);
	}
}
