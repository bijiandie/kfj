package com.kfj.dao.inft;

import java.util.List;

import com.kfj.entity.Baby;
import com.kfj.entity.TpRole;



public interface TpRoleDao {
	/**
	 * 
	 * @param baby
	 */
	public void addTpRole(TpRole tpRole);
	/**
	 * 
	 * @param openId
	 * @return
	 */
	public List<TpRole> getTpRoleByopenId(String openId);

}
