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
	 * TODO 得到所有的baby
	 * @return
	 */
	@Override
	public List<Baby> getAllBaby() {
		return babyDao.getAllBaby();
	}

	@Override
	public void addBaby(Baby baby) {
		babyDao.addBaby(baby);
		
	}

	@Override
	public boolean updateBaby(Baby baby) {
		return babyDao.updateBaby(baby);
	}


	
}
