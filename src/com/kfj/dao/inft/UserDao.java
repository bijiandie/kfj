package com.kfj.dao.inft;

import com.kfj.entity.User;


public interface UserDao {

	/**
	 * TODO 根据userName得到User
	 * @param userName
	 * @return User
	 */
	public User getUserByUserName(String userName);

}
