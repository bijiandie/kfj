package com.kfj.entity;


public class WxUser {

	/**
	 * ID
	 */
	private int id;
	/**
	 * 微信公众号标识
	 */
	private int OPENID;
	/**
	 * 关注状态(0未关注，1已关注，2取消关注)
	 */
	private int gzState;
	/**
	 * 投票状态(0未投票，1已投票)
	 */
	private int tpstate;
	/**
	 * 投票时间
	 */
	private int tptime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOPENID() {
		return OPENID;
	}
	public void setOPENID(int oPENID) {
		OPENID = oPENID;
	}
	public int getGzState() {
		return gzState;
	}
	public void setGzState(int gzState) {
		this.gzState = gzState;
	}
	public int getTpstate() {
		return tpstate;
	}
	public void setTpstate(int tpstate) {
		this.tpstate = tpstate;
	}
	public int getTptime() {
		return tptime;
	}
	public void setTptime(int tptime) {
		this.tptime = tptime;
	}
	
}
