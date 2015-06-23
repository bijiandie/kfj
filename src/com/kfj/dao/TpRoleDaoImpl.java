package com.kfj.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.kfj.dao.inft.TpRoleDao;
import com.kfj.entity.TpRole;

public class TpRoleDaoImpl implements TpRoleDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addTpRole(TpRole tpRole) {
		sessionFactory.getCurrentSession().save(tpRole);
		
	}

	@Override
	public List<TpRole> getTpRoleByopenId(String openId) {
		String hql = "from TpRole where openId like '%"+openId+"%'";	
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

}
