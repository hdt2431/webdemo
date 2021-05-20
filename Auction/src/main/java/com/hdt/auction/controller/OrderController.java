package com.hdt.auction.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hdt.auction.dto.Msg;
import com.hdt.auction.entity.Art;
import com.hdt.auction.entity.Information;
import com.hdt.auction.entity.Order;
import com.hdt.auction.entity.ReceiptInformation;
import com.hdt.auction.entity.User;
import com.hdt.auction.service.ArtService;
import com.hdt.auction.service.InformationService;
import com.hdt.auction.service.OrderService;
import com.hdt.auction.service.ReceiptInformationService;
import com.hdt.auction.service.UserService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	ArtService artService;
	@Autowired
	ReceiptInformationService receiptInformationService;
	@Autowired
	UserService userService;
	@Autowired
	InformationService informationService;

	/**
	 * 获取所有订单，可以供管理员后台操作使用
	 * 
	 * @param startIndex
	 * @param singleSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getAllOrder")
	private Msg getAllOrder(@RequestParam(value = "startIndex", defaultValue = "1") Integer startIndex,
			@RequestParam(value = "singleSize") Integer singleSize) {
		// TODO Auto-generated method stub

		PageHelper.startPage(startIndex, singleSize);
		List<Order> orders = orderService.getAllOrder();
		PageInfo page = new PageInfo(orders, 5);

		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 查询代发货订单，已发货订单，
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getOrderByDeliveryStatusId")
	private Msg getOrderByDeliveryStatusId(@RequestParam(value = "id") Long id) {
		// TODO Auto-generated method stub

		List<Order> orders = orderService.getOrderByDeliveryStatusId(id);

		return Msg.success().add("OrderInfo", orders);
	}

	/**
	 * 查询待付款订单 待评价订单
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getOrderByOrderTypeId")
	private Msg getOrderByOrderTypeId(@RequestParam(value = "id") Long id) {
		// TODO Auto-generated method stub

		List<Order> orders = orderService.getOrderByOrderTypeId(id);

		return Msg.success().add("OrderInfo", orders);
	}

	/**
	 * 查询买家历史订单
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getOrderByBuerId")
	private Msg getOrderByBuerId(@RequestParam(value = "id") Long id) {
		// TODO Auto-generated method stub

		List<Order> orders = orderService.getOrderByBuyerId(id);

		return Msg.success().add("OrderInfo", orders);
	}

	@ResponseBody
	@RequestMapping("/getOrderByBuerIdandTypeId")
	private Msg getOrderByBuerIdandTypeId(@RequestParam(value = "id") Long id,
			@RequestParam(value = "typeid") Long typeid) {
		// TODO Auto-generated method stub

		List<Order> orders = orderService.getOrderByBuyerIdandTypeId(id, typeid);

		return Msg.success().add("OrderInfo", orders);
	}

	/**
	 * 查询卖家 相关订单
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getOrderBySellerId")
	private Msg getOrderBySellerId(@RequestParam(value = "id") Long id) {
		// TODO Auto-generated method stub

		List<Order> orders = orderService.getOrderBySellerId(id);

		return Msg.success().add("OrderInfo", orders);
	}

	/**
	 * 更新订单 修改地址等信息
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updatetOrder")
	private Msg updateOrderById(Order order) {
		// TODO Auto-generated method stub
		orderService.updateOrder(order);

		return Msg.success().add("OrderInfo", order);
	}

	@ResponseBody
	@RequestMapping("/insertOrder")
	private Msg insertOrderById(Order order) {
		// TODO Auto-generated method stub
		orderService.insertOrder(order);

		return Msg.success().add("OrderInfo", order);
	}

	/**
	 * 删除订单
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteOrder")
	private Msg deleteOrderById(@RequestParam(value = "id") Long id) {
		// TODO Auto-generated method stub
		orderService.deleteOrderById(id);

		return Msg.success();
	}

	@ResponseBody
	@RequestMapping("/getOrderByArtId")
	private Msg getOrderByArtId(@RequestParam(value = "artId") Long art_id) {
		Order rOrder = orderService.selectByArtId(art_id);

		return Msg.success().add("orderInfo", rOrder);
	}

	@ResponseBody
	@RequestMapping("/pay")
	private Msg pay(@RequestParam(value = "artId") Long art_id) {
		Order rOrder = orderService.selectByArtId(art_id);
		rOrder.setOrderTypeId(3l);
		orderService.updateOrder(rOrder);

		return Msg.success();
	}
	@ResponseBody
	@RequestMapping("/take_over")
	private Msg take_over(@RequestParam(value = "artId") Long art_id) {
		Order rOrder = orderService.selectByArtId(art_id);
		rOrder.setOrderTypeId(2l);
		orderService.updateOrder(rOrder);

		return Msg.success();
	}

	@ResponseBody
	@RequestMapping("/setlogistics")
	private Msg setlogistics(@RequestParam(value = "artId") Long art_id,
			@RequestParam(value = "logistics_company") String logistics_company,
			@RequestParam(value = "logistics_number") String logistics_number) {
		Order rOrder = orderService.selectByArtId(art_id);
		rOrder.setLogisticsCompany(logistics_company);
		rOrder.setLogisticsNumber(logistics_number);
		rOrder.setOrderTypeId(4l);
		orderService.updateOrder(rOrder);
		return Msg.success().add("orderInfo", rOrder);
	}
	@ResponseBody
	@RequestMapping("/comment")
	private Msg comment(@RequestParam(value = "artId") Long art_id,@RequestParam(value = "comment") String comment) {
		Order rOrder = orderService.selectByArtId(art_id);
		rOrder.setComment(comment);
		rOrder.setOrderTypeId(5l);
		orderService.updateOrder(rOrder);
		return Msg.success().add("orderInfo", rOrder);
	}
	@ResponseBody
	@RequestMapping(value = "/insertOrder2")
	private Msg insertOrder2(@RequestParam(value = "id") Long id) throws Exception {
		// TODO Auto-generated method stub
		Art art = artService.getArt(id);
		if(!art.getState_id().equals(3l))
			return Msg.fail();
		art.setState_id(4l);
		artService.updateArt(art);
		User user = userService.getUserById(art.getOwner_id());
		
		if(art.getWinner_id()==null) {
			Byte b = 0;
			Information information = new Information();
			information.setManager_id(1l);
			information.setArt_id(art.getId());
			information.setGmt_create(new Date());
			information.setGmt_modified(new Date());
			information.setIsread(b);
			information.setUser_id(art.getOwner_id());			
			information.setTitle("拍卖信息信息");
			String content = "您的商品"+art.getArt_name()+"拍卖已经结束，但是无人出价，已流拍。若想再次拍卖，请重新上传拍品信息";
			sendTextMail(user.getEmail(), content, "拍卖信息");
			information.setContent(content);
			informationService.insertInfo(information);
			return Msg.fail();
		}
		User user2 = userService.getUserById(art.getOwner_id());
		Byte a = 1;
		ReceiptInformation repinfo = receiptInformationService.selectByIdandIs_default(art.getOwner_id(), a);
		Order order = new Order();
		order.setOrderTypeId(1l);
		order.setAdressId(repinfo.getId());
		order.setArtId(art.getId());
		order.setBuyerId(art.getWinner_id());
		order.setDeliveryStatusId(1l);
		order.setSellerId(art.getOwner_id());
		order.setStartTime(art.getEnd_time());
		orderService.insertOrder(order);
		Byte b = 0;
		Information information = new Information();
		information.setManager_id(1l);
		information.setArt_id(art.getId());
		information.setGmt_create(new Date());
		information.setGmt_modified(new Date());
		information.setIsread(b);
		information.setUser_id(art.getOwner_id());
		information.setTitle("拍卖信息");
		String content = "您的商品"+art.getArt_name()+"拍卖已经结束，竞拍者"+art.getWinner_id()+"拍走了您的商品，请及时确认订单并与买家联系";
		sendTextMail(user.getEmail(), content, "拍卖信息");
		information.setContent(content);
		informationService.insertInfo(information);
		Information information2 = new Information();
		information2.setManager_id(1l);
		information2.setArt_id(art.getId());
		information2.setGmt_create(new Date());
		information2.setGmt_modified(new Date());
		information2.setIsread(b);
		information2.setUser_id(art.getWinner_id());
		information2.setTitle("拍卖信息");
		String content2 = "恭喜您，您是商品"+art.getArt_name()+"最后的中标者，请及时确认订单付款并与卖家联系";
		sendTextMail(user2.getEmail(), content2, "拍卖信息");
		information.setContent(content2);
		informationService.insertInfo(information2);
		return Msg.success().add("orderInfo", order);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteOrderBatch")
	public Msg deleteArtBatch(@RequestParam(value="ids")String ids) {
		
		List<Long> del_ids = new ArrayList();
		String[] str_ids = ids.split("-");
		System.out.println(ids);
		for (String string : str_ids) {
			del_ids.add(Long.parseLong(string));
		}
		orderService.deleteOrderBatch(del_ids);
		return Msg.success();
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
