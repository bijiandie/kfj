package com.kfj.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.kfj.dao.inft.BabyDao;
import com.kfj.entity.Baby;

public class BabyDaoImpl implements BabyDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Baby> getAllBaby() {
		String hql = "from Baby order by id DESC";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		return query.list();
	}

	@Override
	public void addBaby(Baby baby) {
		sessionFactory.getCurrentSession().save(baby);
		
	}

	@Override
	public boolean updateBaby(Baby baby) {
		String hql = "update Baby b set b.csbh = ? where b.id = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, baby.getId());
		query.setInteger(1, baby.getId());		
		return (query.executeUpdate() > 0);
	}

	
}
