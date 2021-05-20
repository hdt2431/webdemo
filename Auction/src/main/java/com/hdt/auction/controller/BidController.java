package com.hdt.auction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdt.auction.dto.Msg;
import com.hdt.auction.entity.Art;
import com.hdt.auction.entity.Bid;
import com.hdt.auction.service.ArtService;
import com.hdt.auction.service.BidService;
import com.hdt.auction.service.UserService;

@Controller
public class BidController {
	@Autowired
	ArtService artService;
	@Autowired
	BidService bidService;
	@Autowired
	UserService userService;
	@RequestMapping("/biditem")
	@ResponseBody
	public Msg biditem(@RequestParam(value = "art_id")Long art_id) {
		List<Bid> bids = bidService.getbidByart_id(art_id);
		
		return Msg.success().add("bids", bids);

	}
}
