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

}
