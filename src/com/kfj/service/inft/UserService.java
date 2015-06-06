package com.kfj.service.inft;

import com.kfj.entity.User;


public interface UserService {
	
	/**
	 * TODO 根据userName得到User
	 * @param userName
	 * @return User
	 */
	public User getUserByUserName(String userName);
	
}
