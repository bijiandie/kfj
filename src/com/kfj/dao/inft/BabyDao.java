package com.kfj.dao.inft;

import java.util.List;

import com.kfj.entity.Baby;


public interface BabyDao {

	/**
	 * TODO �õ����е�baby
	 * @return
	 */
	public List<Baby> getAllBaby();
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
	/**
	 * TODO 
	 * @param 
	 * @return
	 */
	public List<Baby> getAllBabyByTps(int firstResult,int maxResults);
	/**
	 * TODO 
	 * @param 
	 * @return
	 */
	public List<Baby> getAllBabyById(int firstResult,int maxResults);
	/**
	 * TODO 
	 * @param 
	 * @return
	 */
	public List<Baby> getBabyByTps(int firstResult,int maxResults);
	/**
	 * 根据投票数获取
	 * @return
	 */
	public List<Baby> getAllBabyByTps();
	/**
	 * 根据参赛编号获取
	 * @param csbh
	 * @return
	 */
	public List<Baby> getBabyByCsbh(String csbh);
	/**
	 * 根据宝贝姓名获取
	 * @param bbxm
	 * @return
	 */
	public List<Baby> getBabyByBbxm(String bbxm);
	/**
	 * TODO 投票
	 * @param user
	 * @return
	 */
	public boolean updateBabyTps(Baby baby);

}
