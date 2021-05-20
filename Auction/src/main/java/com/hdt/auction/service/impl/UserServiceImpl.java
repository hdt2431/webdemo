package com.hdt.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdt.auction.dao.ManagerMapper;
import com.hdt.auction.dao.UserMapper;
import com.hdt.auction.entity.Manager;
import com.hdt.auction.entity.User;
import com.hdt.auction.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ManagerMapper managerMapper;
	
	public void regist(User user) {
		// TODO Auto-generated method stub
		userMapper.insertSelective(user);
	}

	public User login(String name, String password) {
		// TODO Auto-generated method stub
		 return userMapper.findUserByNameAndPwd(name, password);
	}

	public boolean checkUser(String user_name) {
		// TODO Auto-generated method stub
		User user = null;
		user = userMapper.findUserByName(user_name);
		if(user==null) {
		return false;
		}else {
			return true;
		}
	}
	public boolean checkUser2(String user_name,String user_password) {
		// TODO Auto-generated method stub
		User user = null;
		user = userMapper.findUserByNameAndPwd(user_name, user_password);
		if(user==null) {
		return false;
		}else {
			return true;
		}
	}
	public boolean checkManager(String manager_name,String manager_password) {
		// TODO Auto-generated method stub
		Manager manager = null;
		manager = managerMapper.findManagerByNameAndPwd(manager_name, manager_password);
		if(manager==null) {
		return false;
		}else {
			return true;
		}
	}
	public User findUserbyNameAndPassword(String user_name, String user_password) {
		// TODO Auto-generated method stub
		User user = null;
		user = userMapper.findUserByNameAndPwd(user_name, user_password);
		return user;
	}

	public User getUserById(long id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKeySelective(user);
	}

	public Manager findManagerbyNameAndPassword(String manager_name, String manager_password) {
		// TODO Auto-generated method stub
		Manager manager =null;
		manager = managerMapper.findManagerByNameAndPwd(manager_name, manager_password);
		return manager;
	}

	public List<Manager> findManagerByAuthority(Integer authority) {
		// TODO Auto-generated method stub
		return managerMapper.findManagerByAuthority(authority);
	}

	public void addManager(Manager manager) {
		// TODO Auto-generated method stub
		managerMapper.insertSelective(manager);
	}

	public void deleteManagerbatch(List<Long> ids) {
		// TODO Auto-generated method stub
		managerMapper.deleteBatch(ids);
	}

}
