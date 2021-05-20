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
	 * ��ȡ���ж��������Թ�����Ա��̨����ʹ��
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
	 * ��ѯ�������������ѷ���������
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
	 * ��ѯ������� �����۶���
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
	 * ��ѯ�����ʷ����
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
	 * ��ѯ���� ��ض���
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
	 * ���¶��� �޸ĵ�ַ����Ϣ
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
	 * ɾ������
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
			information.setTitle("������Ϣ��Ϣ");
			String content = "������Ʒ"+art.getArt_name()+"�����Ѿ��������������˳��ۣ������ġ������ٴ��������������ϴ���Ʒ��Ϣ";
			sendTextMail(user.getEmail(), content, "������Ϣ");
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
		information.setTitle("������Ϣ");
		String content = "������Ʒ"+art.getArt_name()+"�����Ѿ�������������"+art.getWinner_id()+"������������Ʒ���뼰ʱȷ�϶������������ϵ";
		sendTextMail(user.getEmail(), content, "������Ϣ");
		information.setContent(content);
		informationService.insertInfo(information);
		Information information2 = new Information();
		information2.setManager_id(1l);
		information2.setArt_id(art.getId());
		information2.setGmt_create(new Date());
		information2.setGmt_modified(new Date());
		information2.setIsread(b);
		information2.setUser_id(art.getWinner_id());
		information2.setTitle("������Ϣ");
		String content2 = "��ϲ����������Ʒ"+art.getArt_name()+"�����б��ߣ��뼰ʱȷ�϶��������������ϵ";
		sendTextMail(user2.getEmail(), content2, "������Ϣ");
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
		// ���������������Ϣ
		mail.setSmtpPort(port);
		mail.setHostName(host);
		// ����������֤��
		mail.setAuthentication(userName, password);
		// �����ʼ�������
		mail.setFrom(userName);
		// �����ʼ�������
		mail.addTo(to);
		// �����ʼ�����
		mail.setCharset("UTF-8");
		// �����ʼ�����
		mail.setSubject(title);
		// �����ʼ�����
		mail.setMsg(content);
		// �����ʼ�����ʱ��
		mail.setSentDate(new Date());
		// �����ʼ�
		mail.send();
	}
}
