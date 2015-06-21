package com.kfj.service.inft;

import java.util.List;

import com.kfj.entity.Baby;
import com.kfj.entity.WxUser;



public interface WxUserService {
	
	/**
	 * 根据openId获得wxUser
	 * @param openId
	 * @return
	 */
	public List<WxUser> getWxUserByOpenId(String openId);
	/**
	 * TODO 新增微信用户
	 * @param baby
	 */
	public void addWxUser(WxUser wxUser);
	
	/**
	 * TODO 更改投票状态
	 * @param user
	 * @return
	 */
	public boolean updateWxUserTpState(WxUser wxUser);
}
