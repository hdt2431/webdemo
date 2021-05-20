package com.hdt.auction.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hdt.auction.dto.Msg;
import com.hdt.auction.entity.User;
import com.hdt.auction.service.ArtService;
import com.hdt.auction.service.UserService;

@Controller
public class UploadController {
	@Autowired
	ArtService artService;
	@Autowired
	UserService userService;
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public Msg upload(MultipartFile file, HttpServletRequest request,@RequestParam(value = "id") Long id) throws IOException {
		String path = request.getSession().getServletContext().getRealPath("/images") + "/" + id +"/head";
		String fileName = file.getOriginalFilename();
		User user = new User();
		user = userService.getUserById(id);
		user.setHeadURL("/images"  + "/" + id + "/"+ "head" + "/"+ fileName);
		userService.update(user);
		File dir = new File(path, fileName);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		file.transferTo(dir);
		return Msg.success();

	}
	@RequestMapping(value = "/uploadArtpicture", method = RequestMethod.POST)
	@ResponseBody
	public Msg uploadArtpicture(@RequestParam(value = "kartik-input-700[]")MultipartFile file, HttpServletRequest request,@RequestParam(value = "id") Long id) throws IOException {
		String path = request.getSession().getServletContext().getRealPath("/images")+ "/" +id+"/artPicture";
			String fileName = file.getOriginalFilename();
			String url = "/images" +"/artPicture" + "/" + id  + "/"+ fileName;
			File dir = new File(path, fileName);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			file.transferTo(dir);
		
		
		return Msg.success().add("name", url);

	}
}
