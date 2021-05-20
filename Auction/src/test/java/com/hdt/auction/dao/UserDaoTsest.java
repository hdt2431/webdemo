package com.hdt.auction.dao;

import java.util.Date;

import org.apache.commons.mail.SimpleEmail;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.hdt.auction.BaseTest;
import com.hdt.auction.entity.User;

public class UserDaoTsest extends BaseTest {
	@Autowired
	private UserMapper userMapper;

	public void testInsert() throws Exception {
		User user = new User();
		user.setUser_name("hdt");
		user.setCity("aa");
		user.setDeposit(null);
		user.setGmt_create(null);
		user.setGmt_modified(null);
		user.setHeadURL(null);
		user.setIDnumber(null);
		user.setReputation(null);
		user.setUser_nickname(null);
		user.setUser_password(null);
		user.setUser_phone(null);

		userMapper.insert(user);
	}

	/**
	 * 发送文本邮件
	 * 
	 * @throws Exception
	 */
	@Test
	public void sendTextMail(String to,String content,String title) throws Exception {
		String host = "smtp.qq.com";
		int port = 587;
		String userName = "634423136@qq.com";
		String password = "qqhdkpmbqhbdbcad";

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
