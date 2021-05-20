package com.hdt.auction.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hdt.auction.dto.Msg;
import com.hdt.auction.entity.Information;
import com.hdt.auction.service.InformationService;

@Controller
public class InfoController {
	@Autowired
	InformationService informationService;

	@ResponseBody
	@RequestMapping("/getInfoByuser_id")
	public Msg getRptInfo(@RequestParam(value = "id") long id,@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 7);
		
		List<Information> informations = informationService.getInfoByuserId(id);
		PageInfo page = new PageInfo(informations,5);
		if(informations == null||informations.size()==0)
			return Msg.success().add("ArtsInfo", null);
		return Msg.success().add("pageInfo", page);
	}
	@ResponseBody
	@RequestMapping(value="/deleteBatch")
	public Msg deleteBatch(@RequestParam(value="ids")String ids) {
		
		List<Long> del_ids = new ArrayList();
		String[] str_ids = ids.split("-");
		for (String string : str_ids) {
			del_ids.add(Long.parseLong(string));
		}
		informationService.deleteBatch(del_ids);
		return Msg.success();
	}
	@ResponseBody
	@RequestMapping(value="/isread")
	public Msg isread(@RequestParam(value="id")Long id) {
		
		Information information = informationService.getInfo(id);
		Byte a = 1; 
		information.setIsread(a);
		informationService.updateInfo(information);
		return Msg.success().add("info", information);
	}
	
}
