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

	@SuppressWarnings("unchecked")
	@Override
	public List<Baby> getAllBaby() {
		String hql = "from Baby GROUP BY NAME,jzxm order by tps desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Baby> getAllBabyByTps(int firstResult,int maxResults){
		String hql = "from Baby GROUP BY NAME,jzxm order by tps desc";	
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setMaxResults(maxResults);  
		query.setFirstResult(firstResult); 
		return query.list();
	}
	public List<Baby> getAllBabyById(int firstResult,int maxResults){
		String hql = "from Baby GROUP BY NAME,jzxm order by id asc";	
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setMaxResults(maxResults);  
		query.setFirstResult(firstResult); 
		return query.list();
	}
	
	public List<Baby> getAllBabyByTps(){
		String hql = "from Baby GROUP BY NAME,jzxm  order by tps desc,csbh asc";	
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

	@Override
	public int getLjtp(){
		String hql = "select sum(tps) as tps from Baby ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List ljtpList = query.list();
		int tps = 0;
		if(ljtpList.get(0) != null){
			tps = Integer.parseInt(String.valueOf(ljtpList.get(0)));
		}
		return tps;
	}
	
	public List<Baby> getBabyByCsbh(String csbh){
		//String hql = "from Baby where csbh like '%"+csbh+"%' GROUP BY NAME,jzxm order by id asc";	
		String hql = "from Baby where csbh in (select csbh from Baby GROUP BY NAME,jzxm) and csbh like '%"+csbh+"%' order by id asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public List<Baby> getBabyByBbxm(String bbxm){
		String hql = "from Baby where name like '%"+bbxm+"%' GROUP BY NAME,jzxm order by id asc";	
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	public boolean updateBabyTps(Baby baby){
		String hql = "update Baby b set b.tps = ? where b.id = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, baby.getTps());
		query.setInteger(1, baby.getId());		
		return (query.executeUpdate() > 0);
	}

	@Override
	public List<Baby> getBabyByTps(int firstResult, int maxResults) {
		String hql = "from Baby GROUP BY NAME,jzxm  order by tps desc,csbh asc";	
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setMaxResults(maxResults);  
		query.setFirstResult(firstResult); 
		return query.list();
	}
	
}
