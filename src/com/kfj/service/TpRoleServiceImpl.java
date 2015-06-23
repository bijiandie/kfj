package com.kfj.service;

import java.util.List;

import com.kfj.dao.inft.TpRoleDao;
import com.kfj.entity.TpRole;
import com.kfj.service.inft.TpRoleService;

public class TpRoleServiceImpl implements TpRoleService {
	
	private TpRoleDao tpRoleDao;

	public void setTpRoleDao(TpRoleDao tpRoleDao) {
		this.tpRoleDao = tpRoleDao;
	}

	@Override
	public void addTpRole(TpRole tpRole) {
		tpRoleDao.addTpRole(tpRole);
		
	}

	@Override
	public List<TpRole> getTpRoleByopenId(String openId) {
		
		return tpRoleDao.getTpRoleByopenId(openId);
	}
	
	

}
