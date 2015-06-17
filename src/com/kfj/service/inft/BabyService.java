package com.kfj.service.inft;

import java.util.List;

import com.kfj.entity.Baby;


public interface BabyService {
	
	/**
	 * TODO �õ����е�baby
	 * @return
	 */
	public List<Baby> getAllBaby();
	
	/**
	 * TODO �õ����е�baby
	 * @return
	 */
	public List<Baby> getAllBabyByTps(int firstResult,int maxResults);
	
	/**
	 * TODO ����baby
	 * @param baby
	 */
	public void addBaby(Baby baby);
	/**
	 * TODO ����baby
	 * @param user
	 * @return
	 */
	public boolean updateBaby(Baby baby);
	/**
	 * TODO 得到累积投票
	 * @param 
	 * @return
	 */
	public int getLjtp();
	public List<Baby> getAllBabyByTps();
	public Baby getBabyByCsbh(String csbh);
}
