package com.hdt.auction.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.fasterxml.jackson.databind.deser.DataFormatReaders.Match;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hdt.auction.dto.Msg;
import com.hdt.auction.entity.Manager;
import com.hdt.auction.entity.User;
import com.hdt.auction.service.UserService;
import com.mysql.jdbc.StringUtils;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	/**
	 * ������Ϣ���� ���¸�����Ϣ
	 * 
	 * @param user_password
	 * @param user_nickname
	 * @param user_phone
	 * @param IDnumber
	 * @param city
	 * @param headURL
	 * @param real_name
	 * @param id
	 * @return
	 */
	@RequestMapping("/updateUser")
	@ResponseBody
	public Msg updateUser(@RequestParam("user_password") String user_password,
			@RequestParam("user_nickname") String user_nickname, @RequestParam("user_phone") String user_phone,
			@RequestParam("IDnumber") String IDnumber, @RequestParam("city") String city,
			@RequestParam("headURL") String headURL, @RequestParam("real_name") String real_name,
			@RequestParam(value = "id") Long id) {

		User user = userService.getUserById(id);
		user.setCity(city);
		user.setHeadURL(headURL);
		user.setIDnumber(IDnumber);
		user.setReal_name(real_name);
		user.setUser_password(user_password);
		user.setUser_phone(user_phone);
		user.setUser_nickname(user_nickname);
		userService.update(user);
		return Msg.success().add("UserInfo", user);

	}

	/**
	 * �û�ע��
	 * 
	 * @param user
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/regist")
	@ResponseBody
	public Msg regist(@Valid User user) throws Exception {
		if (userService.checkUser(user.getUser_name())) {
			return Msg.fail();
		} else {
			Date gmt_create = new Date();
			user.setGmt_create(gmt_create);
			user.setGmt_modified(gmt_create);
			user.setRank("��ͭ��Ա");
			user.setDeposit(0l);
			user.setHeadURL("/images/111.jpg");
			userService.regist(user);
			sendTextMail(user.getEmail(), "��л��ע�����ǵ���վ��ף���������", "ע��ɹ�");
			return Msg.success();
		}
	}

	/**
	 * �û���¼
	 * 
	 * @param session
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/login")
	@ResponseBody
	public Msg vail(HttpSession session, User user) {

		if (!StringUtils.isNullOrEmpty(user.getUser_name()) && !StringUtils.isNullOrEmpty(user.getUser_password())) {
			// �жϴ��������ֵ�Ƿ�Ϊ�գ���Ϊ�ղŽ��в�ѯ
			boolean b = userService.checkUser2(user.getUser_name(), user.getUser_password());
			if (!b) {
				// û�е�¼�ɹ�
				return Msg.fail();
			} else {
				User user2 = userService.findUserbyNameAndPassword(user.getUser_name(), user.getUser_password());
				String id = String.valueOf(user2.getId());
				session.setAttribute("USER_INFO", id);
				return Msg.success();
			}
		} else {
			return Msg.fail();
		}
	}

	/**
	 * ����Ա��¼
	 * 
	 * @param session
	 * @param manager
	 * @return
	 */
	@RequestMapping(value = "/Mlogin", method = RequestMethod.POST)
	@ResponseBody
	public Msg login(HttpSession session, Manager manager) {
		if (!StringUtils.isNullOrEmpty(manager.getManager_name())
				&& !StringUtils.isNullOrEmpty(manager.getManager_password())) {
			// �жϴ��������ֵ�Ƿ�Ϊ�գ���Ϊ�ղŽ��в�ѯ
			boolean b = userService.checkManager(manager.getManager_name(), manager.getManager_password());
			if (!b) {
				// û�е�¼�ɹ�
				return Msg.fail();
			} else {
				Manager manager2 = userService.findManagerbyNameAndPassword(manager.getManager_name(),
						manager.getManager_password());
				Integer Authority = manager2.getAuthority();
				String id = String.valueOf(manager2.getId());
				session.setAttribute("Manager_INFO", id);
				return Msg.success().add("Manager_INFO", Authority);
			}
		} else {
			return Msg.fail();
		}
	}

	@RequestMapping(value = "managerList")
	@ResponseBody
	public Msg managerList(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {

		PageHelper.startPage(pn, 5);
		List<Manager> managers = userService.findManagerByAuthority(2);
		PageInfo page = new PageInfo(managers, 5);
		return Msg.success().add("pageInfo", page);
	}

	@RequestMapping(value = "add_manager")
	@ResponseBody
	public Msg add_manager(@RequestParam(value = "manager_name") String manager_name,
			@RequestParam(value = "manager_password") String manager_password) {
		Manager manager = new Manager();
		manager.setManager_name(manager_name);
		manager.setManager_password(manager_password);
		manager.setAuthority(2);
		manager.setGmt_create(new Date());
		manager.setGmt_modified(new Date());
		userService.addManager(manager);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/deletemanagerBatch")
	public Msg deletemanagerBatch(@RequestParam(value = "ids") String ids) {

		List<Long> del_ids = new ArrayList();
		String[] str_ids = ids.split("-");
		for (String string : str_ids) {
			del_ids.add(Long.parseLong(string));
		}
		userService.deleteManagerbatch(del_ids);
		return Msg.success();
	}

	/**
	 * �û��ǳ�
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	@ResponseBody
	public Msg logout(HttpSession session) {

		session.invalidate();
		return Msg.success();
	}

	@RequestMapping(value = "/getUser", method = RequestMethod.GET)
	@ResponseBody
	public Msg getUser(@RequestParam(value = "id") Long id) {
		User user = null;
		user = userService.getUserById(id);
		return Msg.success().add("user", user);
	}

	@RequestMapping(value = "/updatePassword")
	@ResponseBody
	public Msg updatePassword(@RequestParam(value = "oldPassword") String oldPassword,
			@RequestParam(value = "newPassword") String newPassword, @RequestParam(value = "id") Long id) {
		User user = null;
		user = userService.getUserById(id);
		if (user.getUser_password().equals(oldPassword)) {
			user.setUser_password(newPassword);
			userService.update(user);
			return Msg.success();
		} else {
			System.out.println(111);
			return Msg.fail();
		}
	}

	@RequestMapping(value = "/updateNickname")
	@ResponseBody
	public Msg updateNickname(@RequestParam(value = "user_nickname") String user_nickname,
			@RequestParam(value = "id") Long id) {
		User user = null;
		user = userService.getUserById(id);
		if (user_nickname.isEmpty()) {
			return Msg.fail();
		} else {
			user.setUser_nickname(user_nickname);
			userService.update(user);
			return Msg.success();
		}

	}

	@RequestMapping(value = "/updatePhone")
	@ResponseBody
	public Msg updatePhone(@RequestParam(value = "user_phone") String user_phone, @RequestParam(value = "id") Long id) {
		User user = null;
		user = userService.getUserById(id);
		if (user_phone.isEmpty()) {
			return Msg.fail();
		} else {
			user.setUser_phone(user_phone);
			;
			userService.update(user);
			return Msg.success();
		}

	}

	@RequestMapping(value = "/updateCity")
	@ResponseBody
	public Msg updateCity(@RequestParam(value = "city") String city, @RequestParam(value = "id") Long id) {
		User user = null;
		user = userService.getUserById(id);
		if (city.isEmpty()) {
			return Msg.fail();
		} else {
			user.setCity(city);
			userService.update(user);
			return Msg.success();
		}

	}

	@RequestMapping(value = "/updateDeposit")
	@ResponseBody
	public Msg updateDeposit(@RequestParam(value = "deposit") Long deposit, @RequestParam(value = "id") Long id) {
		User user = null;
		user = userService.getUserById(id);
		if (deposit == null) {
			return Msg.fail();
		} else {
			deposit = deposit + user.getDeposit();
			System.out.println(deposit);
			if (deposit.compareTo(500l) < 0) {
				user.setRank("��ͭ��Ա");
			} else if (deposit.compareTo(500l) > 0 && deposit.compareTo(1000l) < 0) {
				user.setRank("������Ա");
			} else {
				user.setRank("�ƽ��Ա");
			}
			user.setDeposit(deposit);
			userService.update(user);
			return Msg.success();
		}

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
