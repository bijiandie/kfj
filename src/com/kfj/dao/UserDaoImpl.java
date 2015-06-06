package com.kfj.dao;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.kfj.dao.inft.UserDao;
import com.kfj.entity.User;

public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * TODO 根据userName得到User
	 * @param userName
	 * @return User
	 */
	@Override
	public User getUserByUserName(String userName) {
		String hql = "from User u where u.userName=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, userName);	
		return (User)query.uniqueResult();
	}
	
	
}
