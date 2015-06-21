package com.kfj.entity;


public class WxUser {

	/**
	 * ID
	 */
	private int id;
	/**
	 * 微信公众号标识
	 */
	private String OPENID;
	/**
	 * 关注状态(0未关注，1已关注，2取消关注)
	 */
	private String gzState;
	/**
	 * 投票状态(0未投票，1已投票)
	 */
	private String tpstate;
	/**
	 * 投票时间
	 */
	private String tptime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOPENID() {
		return OPENID;
	}
	public void setOPENID(String oPENID) {
		OPENID = oPENID;
	}
	public String getGzState() {
		return gzState;
	}
	public void setGzState(String gzState) {
		this.gzState = gzState;
	}
	public String getTpstate() {
		return tpstate;
	}
	public void setTpstate(String tpstate) {
		this.tpstate = tpstate;
	}
	public String getTptime() {
		return tptime;
	}
	public void setTptime(String tptime) {
		this.tptime = tptime;
	}
	
}
