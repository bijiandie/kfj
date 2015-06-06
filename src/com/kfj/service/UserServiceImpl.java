package com.kfj.service;

import com.kfj.dao.inft.UserDao;
import com.kfj.entity.User;
import com.kfj.service.inft.UserService;

public class UserServiceImpl implements UserService {
	
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * TODO 根据userName得到User
	 * @param userName
	 * @return User
	 */
	@Override
	public User getUserByUserName(String userName) {
		return userDao.getUserByUserName(userName);
	}

	
}
