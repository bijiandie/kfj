package com.kfj.dao.inft;

import java.util.List;

import com.kfj.entity.WxUser;

public interface WxUserDao {
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
	 * TODO 投票
	 * @param user
	 * @return
	 */
	public boolean updateWxUserTpState(WxUser wxUser);

}
