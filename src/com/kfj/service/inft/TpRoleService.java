package com.kfj.service.inft;

import java.util.List;

import com.kfj.entity.TpRole;



public interface TpRoleService {
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
