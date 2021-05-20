package com.hdt.auction.service;

import java.util.List;

import com.hdt.auction.entity.Manager;
import com.hdt.auction.entity.User;

public interface UserService {
	// ÓÃ»§×¢²á
	void regist(User user);

	User login(String name, String password);

	boolean checkUser(String user_name);

	boolean checkUser2(String user_name, String user_password);

	boolean checkManager(String manager_name,String manager_password);

	User findUserbyNameAndPassword(String user_name, String user_password);

	User getUserById(long id);

	void update(User user);

	Manager findManagerbyNameAndPassword(String manager_name, String manager_password);
	
	List<Manager> findManagerByAuthority(Integer authority);
	
	void addManager(Manager manager);
	
	void deleteManagerbatch(List<Long> ids);
}
