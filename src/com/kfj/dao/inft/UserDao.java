package com.kfj.dao.inft;

import com.kfj.entity.User;


public interface UserDao {

	/**
	 * TODO ����userName�õ�User
	 * @param userName
	 * @return User
	 */
	public User getUserByUserName(String userName);

}
