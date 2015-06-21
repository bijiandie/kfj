package com.kfj.service;

import java.util.List;

import com.kfj.dao.WxUserDaoImpl;
import com.kfj.dao.inft.WxUserDao;
import com.kfj.entity.WxUser;
import com.kfj.service.inft.WxUserService;

public class WxUserServiceImpl implements WxUserService {
	
	private WxUserDao wxUserDao;

	public void setWxUserDao(WxUserDao wxUserDao) {
		this.wxUserDao = wxUserDao;
	}

	@Override
	public List<WxUser> getWxUserByOpenId(String openId) {
		return wxUserDao.getWxUserByOpenId(openId);
	}

	@Override
	public void addWxUser(WxUser wxUser) {		
		wxUserDao.addWxUser(wxUser);
	}
	@Override
	public boolean updateWxUserTpState(WxUser wxUser){
		return wxUserDao.updateWxUserTpState(wxUser);
	}

}
