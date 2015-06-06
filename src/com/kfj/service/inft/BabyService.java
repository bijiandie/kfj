package com.kfj.service.inft;

import java.util.List;

import com.kfj.entity.Baby;


public interface BabyService {
	
	/**
	 * TODO 得到所有的baby
	 * @return
	 */
	public List<Baby> getAllBaby();
	
	/**
	 * TODO 新增baby
	 * @param baby
	 */
	public void addBaby(Baby baby);
	/**
	 * TODO 更新baby
	 * @param user
	 * @return
	 */
	public boolean updateBaby(Baby baby);
}
