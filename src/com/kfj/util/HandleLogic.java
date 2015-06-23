package com.kfj.util;





public class HandleLogic {	
	public static MSGXml handEvent(MSGXml msgXml,String openId){
		if(Config.EVE_WSXMX.equals(msgXml.getEventKey())){
			String url = Config.URL;
			msgXml.setTitle("我是小明星网络票选正式开始啦！快为您心中的小明星投上一票");
			msgXml.setDescription("我是小明星网络票选正式开始啦！快为您心中的小明星投上一票");
			msgXml.setPicUrl(url+"/prefer/p1/style/p1_01.jpg");
			msgXml.setUrl(url+"/baby/getAllBabyList?openId="+openId);
		}
		return msgXml;			
	}
	/**
	 * 
	 * @param msgXml
	 * @param csbh参赛编号
	 * @param mc名次
	 * @param tps投票数
	 * @param firsttps跟第一名的投票数
	 * @param symtps跟上一名的投票数
	 * @param openId
	 * @return
	 */
	public static MSGXml handTextByCsbh(MSGXml msgXml,String csbh,int mc,int tps,int firsttps,int symtps,String openId){
		String url = Config.URL;
		msgXml.setTitle("我是小明星网络票选正式开始啦！快为您心中的小明星投上一票");
		msgXml.setDescription("目前"+csbh+"号排名第"+mc+",共有"+tps+"票,与第一名还差"+(firsttps-tps)+"票,跟上一名还差"+(symtps-tps)+"票,您可以点此进入分享为TA投票");
		msgXml.setPicUrl(url+"/prefer/p1/style/p1_01.jpg");
		msgXml.setUrl(url+"/baby/getAllBabyList?openId="+openId);
	
		return msgXml;			
	}
}
