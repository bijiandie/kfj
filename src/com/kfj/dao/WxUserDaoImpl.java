package com.kfj.dao;

import org.hibernate.SessionFactory;

import com.kfj.dao.inft.WxUserDao;

public class WxUserDaoImpl implements WxUserDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
