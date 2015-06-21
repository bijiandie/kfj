package com.kfj.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.kfj.dao.inft.WxUserDao;
import com.kfj.entity.WxUser;

public class WxUserDaoImpl implements WxUserDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<WxUser> getWxUserByOpenId(String openId) {
			String hql = "from WxUser where openId='"+openId+"'";	
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			return query.list();
	}

	@Override
	public void addWxUser(WxUser wxUser) {
		sessionFactory.getCurrentSession().save(wxUser);		
	}
	
	public boolean updateWxUserTpState(WxUser wxUser){
		String hql = "update WxUser w set w.tpstate = ? where w.id = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, wxUser.getTpstate());
		query.setInteger(1, wxUser.getId());		
		return (query.executeUpdate() > 0);
	}
}
