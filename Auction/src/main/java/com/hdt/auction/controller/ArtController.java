package com.hdt.auction.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hdt.auction.dto.Msg;
import com.hdt.auction.entity.Art;
import com.hdt.auction.entity.ArtTypes;
import com.hdt.auction.entity.Bid;
import com.hdt.auction.entity.Follow;
import com.hdt.auction.entity.Information;
import com.hdt.auction.entity.Order;
import com.hdt.auction.entity.ReceiptInformation;
import com.hdt.auction.entity.User;
import com.hdt.auction.service.ArtService;
import com.hdt.auction.service.ArtTypeService;
import com.hdt.auction.service.BidService;
import com.hdt.auction.service.FollowService;
import com.hdt.auction.service.InformationService;
import com.hdt.auction.service.OrderService;
import com.hdt.auction.service.ReceiptInformationService;
import com.hdt.auction.service.UserService;

@Controller
public class ArtController {

	@Autowired
	ArtService artService;
	@Autowired
	UserService userService;
	@Autowired
	ArtTypeService artTypeService;
	@Autowired
	InformationService informationService;
	@Autowired
	ReceiptInformationService repinfo;
	@Autowired
	BidService bidService;
	@Autowired
	OrderService orderService;
	@Autowired
	FollowService followService;

	/**
	 * 搜索跳转
	 * 
	 * @param name
	 * @return
	 */
	@RequestMapping("/queryArt2")
	@ResponseBody
	public Msg queryArt2(@RequestParam(value = "name") String name) {

		return Msg.success().add("name", name);
	}

	/**
	 * 根据艺术品名称模糊查询 只实现了 简单的模糊查询
	 * 
	 * @param name
	 * @return
	 */
	@RequestMapping("/queryArt")
	@ResponseBody
	public Msg queryArt(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "name") String name) {
		PageHelper.startPage(pn, 20);
		List<Art> arts = artService.getArtsByArtName(name);
		PageInfo page = new PageInfo(arts, 5);
		if (arts == null || arts.size() == 0)
			return Msg.success().add("ArtsInfo", null);
		return Msg.success().add("pageInfo", page).add("ArtsInfo", "yes");
	}

	/**
	 * 按照分类获取商品
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/getArtBytype")
	@ResponseBody
	public Msg getArtBytype(@RequestParam(value = "id") Long id, @RequestParam(value = "state_id") Long state_id) {

		List<Art> arts = artService.getArtsByArtTypeId(id, state_id);

		return Msg.success().add("ArtsInfo", arts);
	}

	/**
	 * 发布商品 插入商品信息
	 * 
	 * @param art
	 * @param start_time1
	 * @param end_time2
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/publish")
	@ResponseBody
	public Msg publish(@Valid Art art, @RequestParam(value = "type") Long type) throws Exception {
		// Date start_time = new SimpleDateFormat("yyyy-MM-dd
		// HH:mm").parse(start_time1);
		// Date end_time = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(end_time2);
		art.setArttype_id(type);
		art.setState_id(1l);
		String pictureUrl = art.getPicture_url();
		pictureUrl = pictureUrl.substring(0, pictureUrl.length() - 1);
		art.setPicture_url(pictureUrl);
		long max_price = art.getInit_price();
		art.setMax_price(max_price);
		// art.setStart_time(start_time);
		// art.setEnd_time(end_time);
		Byte a = 0;
		art.setIs_audit(a);
		artService.insertArt(art);
		return Msg.success();
	}

	/**
	 * 查询所有商品信息
	 * 
	 * @param pn
	 * @return
	 */

	@RequestMapping("/Artlist")
	@ResponseBody
	public Msg getAllArt(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		/*
		 * 分页查询
		 */
		PageHelper.startPage(pn, 20);
		List<Art> arts = artService.getAll();
		PageInfo page = new PageInfo(arts, 5);
		return Msg.success().add("pageInfo", page);

	}

	/**
	 * 按照分类获取art
	 * 
	 * @param pn
	 * @param typeid
	 * @return
	 */
	@RequestMapping("/typeArtlist")
	@ResponseBody
	public Msg getArtByTypeid(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "typeid") Long typeid, @RequestParam(value = "state_id") Long state_id) {
		/*
		 * 分页查询
		 */
		PageHelper.startPage(pn, 20);
		List<Art> arts = artService.getArtsByArtTypeId(typeid, state_id);
		PageInfo page = new PageInfo(arts, 5);
		return Msg.success().add("pageInfo", page);

	}

	@RequestMapping("/typeArtlist2")
	@ResponseBody
	public Msg getArtByTypeid(@RequestParam(value = "typeid") Long typeid) {
		List<Art> arts = artService.getArtsByArtTypeId(typeid, 3l);
		return Msg.success().add("artsInfo", arts);

	}
	@RequestMapping("/getArtsbyState")
	@ResponseBody
	public Msg getArtsbyState(@RequestParam(value = "state_id") Long state_id) {
		/*
		 * 分页查询
		 */
		List<Art> arts = artService.getArtsByis_audit(state_id);
		return Msg.success().add("artsInfo", arts);

	}
	@RequestMapping("/getArtsByOwnerId")
	@ResponseBody
	public Msg getArtsByOwnerId(@RequestParam(value = "userId") Long userId,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam(value = "stateId") Long stateId) {
		PageHelper.startPage(pn, 5);
		List<Art> arts = artService.getArtByuserIdAndstateId(userId, stateId);
		PageInfo page = new PageInfo(arts, 5);
		return Msg.success().add("pageInfo", page);
	}

	@RequestMapping("/getArtsByUserId")
	@ResponseBody
	public Msg getArtsByUserId(@RequestParam(value = "userId") Long userId,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Art> arts = artService.getArtsByUserId(userId);
		PageInfo page = new PageInfo(arts, 5);
		return Msg.success().add("pageInfo", page);
	}

	/*
	 * 返回当前竞拍商品信息
	 */
	@RequestMapping("/auction")
	@ResponseBody
	public Msg auction(@RequestParam(value = "id") Long id) {

		Art art = artService.getArt(id);
		User user = userService.getUserById(art.getOwner_id());

		return Msg.success().add("artInfo", art).add("userInfo", user);

	}

	@RequestMapping("/auction2")
	@ResponseBody
	public Msg auction2(@RequestParam(value = "id") Long id) {

		Art art = artService.getArt(id);
		Order order = orderService.selectByArtId(id);
		User owner = userService.getUserById(art.getOwner_id());
		Byte a = 1;
		User winer = userService.getUserById(art.getWinner_id());
		ReceiptInformation rInformation = repinfo.selectByIdandIs_default(winer.getId(), a);
		rInformation.setIs_DefaultAddress(a);
		return Msg.success().add("artInfo", art).add("owner", owner).add("winer", winer)
				.add("rInformation", rInformation).add("ordertype", order.getOrderTypeId()).add("orderInfo", order);

	}

	/**
	 * 点击商品 增加热度
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/add_heat")
	@ResponseBody
	public Msg add_heat(@RequestParam(value = "id") Integer id) {
		Art art = artService.getArt(id);
		if (art.getHeat() == null) {
			art.setHeat(0);
		}
		int heat = art.getHeat() + 1;
		art.setHeat(heat);
		artService.updateArt(art);
		return Msg.success();

	}

	/**
	 * 快速出价 原价基础上加50 也是最低出价
	 * 
	 * @param art_id
	 * @param user_id
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/add_price_50")
	@ResponseBody
	public Msg add_price_50(@RequestParam(value = "art_id") Integer art_id,
			@RequestParam(value = "user_id") Long user_id, @RequestParam(value = "price") Long now_price) throws Exception {
		Art art = artService.getArt(art_id);
		if (art.getMax_price().compareTo(now_price) > 0)
			return Msg.fail();
		User user = userService.getUserById(user_id);
		art.setWinner_id(user.getId());
		if(art.getRank().equals("白银")){
			if(user.getRank().equals("黄铜")) {
				return Msg.fail().add("info", "会员等级不够，请提升您的会员等级再出价");
			}
		}
		if(art.getRank().equals("黄金")){
			if(user.getRank().equals("黄铜会员")) {
				return Msg.fail().add("info", "会员等级不够，请提升您的会员等级再出价");
			}
			if(user.getRank().equals("白银会员")) {
				return Msg.fail().add("info", "会员等级不够，请提升您的会员等级再出价");
			}
		}
		if (art.getMax_price() == null) {
			long a = 0;
			art.setMax_price(a);
		}
		// System.out.println(art.getMax_price());
		long price = art.getMax_price() + 50;
		// System.out.println(price);
		art.setMax_price(price);
		art.setWinner_id(user_id);
		artService.updateArt(art);
		sendTextMail(user.getEmail(), "您竞拍的商品"+art.getArt_name()+"出现新的竞拍者", "竞拍信息");
		Bid bid = new Bid();
		bid.setArt_id(art.getId());
		bid.setBid_date(new Date());
		bid.setBid_price(art.getMax_price());
		bid.setUser_id(user_id);
		bidService.insertBid(bid);
		// System.out.println(art.getMax_price());
		return Msg.success();

	}

	/**
	 * 手动出价
	 * 
	 * @param art_id
	 * @param user_id
	 * @param price
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/offer_price")
	@ResponseBody
	public Msg offer_price(@RequestParam(value = "art_id") Integer art_id,
			@RequestParam(value = "user_id") Integer user_id, @RequestParam(value = "price") Long price) throws Exception {

		long min_price;
		Art art = artService.getArt(art_id);
		User user = userService.getUserById(user_id);
		if(art.getRank().equals("白银")){
			if(user.getRank().equals("黄铜")) {
				return Msg.fail().add("info", "会员等级不够，请提升您的会员等级再出价");
			}
		}
		if(art.getRank().equals("黄金")){
			if(user.getRank().equals("黄铜会员")) {
				return Msg.fail().add("info", "会员等级不够，请提升您的会员等级再出价");
			}
			if(user.getRank().equals("白银会员")) {
				return Msg.fail().add("info", "会员等级不够，请提升您的会员等级再出价");
			}
		}
		min_price = art.getMax_price() + 50;
		if (price >= min_price) {
			art.setWinner_id(user.getId());
			art.setMax_price(price);
			artService.updateArt(art);
			sendTextMail(user.getEmail(), "您竞拍的商品"+art.getArt_name()+"出现新的竞拍者", "竞拍信息");
			return Msg.success().add("INFO", "出价成功");
		} else {
			return Msg.success().add("INFO", "所出价格必须大于等于下个最低出价");
		}

	}

	@RequestMapping("/is_auditArtlist")
	@ResponseBody
	public Msg getArtis_audit(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "state_id") Long state_id) {
		PageHelper.startPage(pn, 7);
		List<Art> arts = artService.getArtsByis_audit(state_id);
		PageInfo page = new PageInfo(arts, 5);
		return Msg.success().add("pageInfo", page);

	}

	@RequestMapping("/audit_success")
	@ResponseBody
	public Msg audit_success(@RequestParam(value = "id") Long id, @RequestParam(value = "manager_id") Long manager_id) throws Exception {
		Art art = null;
		art = artService.getArt(id);
		Byte b = 0;
		art.setState_id(2l);
		User user = userService.getUserById(art.getOwner_id());
		Information information = new Information();
		information.setManager_id(manager_id);
		information.setArt_id(art.getId());
		information.setGmt_create(new Date());
		information.setGmt_modified(new Date());
		information.setIsread(b);
		information.setUser_id(art.getOwner_id());
		information.setTitle("审核信息");
		String content = "您的商品" + art.getArt_name() + "审核已经通过，正在安排拍卖时间";
		sendTextMail(user.getEmail(), content, "审核信息");
		information.setContent(content);
		informationService.insertInfo(information);
		artService.updateArt(art);
		return Msg.success().add("artInfo", art);

	}

	@RequestMapping("/audit_fail")
	@ResponseBody
	public Msg audit_fail(@RequestParam(value = "id") Long id, @RequestParam(value = "manager_id") Long manager_id) throws Exception {
		Art art = null;
		art = artService.getArt(id);
		Byte b = 0;
		art.setState_id(5l);
		User user = userService.getUserById(art.getOwner_id());
		Information information = new Information();
		information.setManager_id(manager_id);
		information.setArt_id(art.getId());
		information.setGmt_create(new Date());
		information.setGmt_modified(new Date());
		information.setIsread(b);
		information.setUser_id(art.getOwner_id());
		information.setTitle("审核信息");
		String content = "您的商品" + art.getArt_name() + "审核未通过，请重新提交相关信息";
		sendTextMail(user.getEmail(), content, "审核信息");
		information.setContent(content);
		informationService.insertInfo(information);
		artService.updateArt(art);
		return Msg.success().add("artInfo", art);

	}

	@RequestMapping("/setArtTime")
	@ResponseBody
	public Msg setArtTime(@RequestParam(value = "id") Long id, @RequestParam(value = "start_time1") String start_time1,
			@RequestParam(value = "end_time1") String end_time1, @RequestParam(value = "type") Long arttype_id,
			@RequestParam(value = "rank") String rank) throws Exception {
		if (start_time1 == "" || end_time1 == "") {
			return Msg.fail();
		}
		Date start_time = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(start_time1);
		Date end_time = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(end_time1);
		if (start_time.compareTo(end_time) > 0)
			return Msg.fail();
		Art art = artService.getArt(id);
		art.setStart_time(start_time);
		art.setEnd_time(end_time);
		art.setState_id(3l);
		art.setArttype_id(arttype_id);
		art.setRank(rank);
		artService.updateArt(art);
		return Msg.success().add("Artinfo", art);

	}

	@RequestMapping("insertFollow")
	@ResponseBody
	public Msg insertFollow(@RequestParam(value = "art_id") Long art_id,
			@RequestParam(value = "user_id") Long user_id) {
		if (followService.selectByUseridAndArtid(user_id, art_id)) {
			Follow follow = new Follow();
			follow.setArt_id(art_id);
			follow.setUser_id(user_id);
			follow.setGmt_create(new Date());
			follow.setGmt_modified(new Date());
			followService.insertFollow(follow);
			return Msg.success();
		} else {
			return Msg.fail();
		}
	}

	@RequestMapping("getMyFollow")
	@ResponseBody
	public Msg getMyFollow(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "user_id") Long user_id) {
		PageHelper.startPage(pn, 7);
		List<Follow> follows = followService.getFollowbyUserid(user_id);
		List<Art> arts = new ArrayList<Art>();
		for (Follow follow : follows) {
			arts.add(artService.getArt(follow.getArt_id()));
		}
		PageInfo page = new PageInfo(arts, 5);
		return Msg.success().add("pageInfo", page);

	}

	@RequestMapping("isFollowed")
	@ResponseBody
	public Msg isFollowed(@RequestParam(value = "art_id") Long art_id, @RequestParam(value = "user_id") Long user_id) {
		if (followService.selectByUseridAndArtid(user_id, art_id))
			return Msg.fail();
		else {
			return Msg.success();
		}
	}

	@RequestMapping("deleteFollowed")
	@ResponseBody
	public Msg deleteFollowed(@RequestParam(value = "art_id") Long art_id,
			@RequestParam(value = "user_id") Long user_id) {
		Follow follow = followService.selectByUseridAndArtid2(user_id, art_id);
		followService.deleteFollow(follow.getId());
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/deletArtrBatch")
	public Msg deleteArtBatch(@RequestParam(value = "ids") String ids) {

		List<Long> del_ids = new ArrayList();
		String[] str_ids = ids.split("-");
		for (String string : str_ids) {
			del_ids.add(Long.parseLong(string));
		}
		artService.deletArtrBatch(del_ids);
		return Msg.success();
	}

	@RequestMapping("/typelist")
	@ResponseBody
	public Msg getAlltype(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		/*
		 * 分页查询
		 */
		PageHelper.startPage(pn, 20);
		List<ArtTypes> artTypes = artTypeService.listallArtTypes();
		PageInfo page = new PageInfo(artTypes, 5);
		return Msg.success().add("pageInfo", page).add("typeInfo", artTypes);

	}

	@RequestMapping("/gettype")
	@ResponseBody
	public Msg gettype(@RequestParam(value = "typeid") Long typeid) {
		/*
		 * 分页查询
		 */
		ArtTypes artTypes = artTypeService.getArtTypeById(typeid);
		return Msg.success().add("typeInfo", artTypes);

	}

	@ResponseBody
	@RequestMapping(value = "/deletetypesBatch")
	public Msg deletetypesBatch(@RequestParam(value = "ids") String ids) {

		List<Long> del_ids = new ArrayList();
		String[] str_ids = ids.split("-");
		for (String string : str_ids) {
			del_ids.add(Long.parseLong(string));
		}
		artTypeService.deletetypesBatch(del_ids);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/addtype")
	public Msg addtype(@RequestParam(value = "type_name") String type_name,
			@RequestParam(value = "type_desc") String type_desc) {

		ArtTypes artTypes = new ArtTypes();
		artTypes.setType_desc(type_desc);
		artTypes.setType_name(type_name);
		artTypes.setGmt_create(new Date());
		artTypes.setGmt_modified(new Date());
		artTypeService.insertTypes(artTypes);
		return Msg.success();
	}
	@RequestMapping("/getMyBidArts")
	@ResponseBody
	public Msg getMyBidArts(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "user_id") Long user_id) {
		PageHelper.startPage(pn, 7);
		List<Long> arts_id = bidService.getArtByUserFromBid(user_id);
		List<Art> arts = new ArrayList<Art>();
		for (Long art_id : arts_id) {
			arts.add(artService.getArt(art_id));
		}
		PageInfo page = new PageInfo(arts, 5);
		return Msg.success().add("pageInfo", page);

	}
	public void sendTextMail(String to, String content, String title) throws Exception {
		String host = "smtp.qq.com";
		int port = 587;
		String userName = "634423136@qq.com";
		String password = "yhmmdhzkckknbdad";

		SimpleEmail mail = new SimpleEmail();
		// 设置邮箱服务器信息
		mail.setSmtpPort(port);
		mail.setHostName(host);
		// 设置密码验证器
		mail.setAuthentication(userName, password);
		// 设置邮件发送者
		mail.setFrom(userName);
		// 设置邮件接收者
		mail.addTo(to);
		// 设置邮件编码
		mail.setCharset("UTF-8");
		// 设置邮件主题
		mail.setSubject(title);
		// 设置邮件内容
		mail.setMsg(content);
		// 设置邮件发送时间
		mail.setSentDate(new Date());
		// 发送邮件
		mail.send();
	}
}
