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
	 * �����ı��ʼ�
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
