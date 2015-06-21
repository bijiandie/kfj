package com.kfj.service;

import java.util.List;

import com.kfj.dao.inft.BabyDao;
import com.kfj.entity.Baby;
import com.kfj.service.inft.BabyService;

public class BabyServiceImpl implements BabyService {
	
	private BabyDao babyDao;
	
	public void setBabyDao(BabyDao babyDao) {
		this.babyDao = babyDao;
	}

	/**
	 * TODO �õ����е�baby
	 * @return
	 */
	@Override
	public List<Baby> getAllBaby() {
		return babyDao.getAllBaby();
	}
	
	public List<Baby> getAllBabyByTps(int firstResult,int maxResults){
		return babyDao.getAllBabyByTps(firstResult,maxResults);
	}

	@Override
	public void addBaby(Baby baby) {
		babyDao.addBaby(baby);
		
	}
	
	@Override
	public int getLjtp(){
		return babyDao.getLjtp();
	}

	@Override
	public boolean updateBaby(Baby baby) {
		return babyDao.updateBaby(baby);
	}
	@Override
	public List<Baby> getAllBabyByTps(){
		return babyDao.getAllBabyByTps();
	}

	@Override
	public List<Baby> getBabyByCsbh(String csbh){
		return babyDao.getBabyByCsbh(csbh);
	}
	@Override
	public List<Baby> getBabyByBbxm(String bbxm){
		return babyDao.getBabyByBbxm(bbxm);
	}
	@Override
	public boolean updateBabyTps(Baby baby){
		return babyDao.updateBabyTps(baby);
	}
}
