package com.kfj.service;

import com.kfj.dao.inft.WxUserDao;
import com.kfj.service.inft.WxUserService;

public class WxUserServiceImpl implements WxUserService {
	
	private WxUserDao wxUserDao;

	public void setWxUserDao(WxUserDao wxUserDao) {
		this.wxUserDao = wxUserDao;
	}


}
