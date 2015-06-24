package com.kfj.util;

import java.util.List;

import com.kfj.entity.Baby;





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
	public static MSGXml handTextByCsbh(MSGXml msgXml,String csbh,int mc,List<Baby> BabyList,String flag,String openId){
		//当前投票数
		Baby baby = BabyList.get(mc-1);
		int tps = baby.getTps();
		//第1名投票数
		int tps1 = BabyList.get(0).getTps();
		//第5名投票数
		int tps5 = BabyList.get(4).getTps();
		//第20名投票数
		int tps20 = BabyList.get(19).getTps();
		//第120名投票数
		int tps120 = BabyList.get(119).getTps();
		String url = Config.URL;
		if(flag.equals("1")){
			msgXml.setTitle("恭喜您为"+baby.getCsbh()+"号"+baby.getName()+"投票成功");
		}else{
			msgXml.setTitle("快来帮"+baby.getCsbh()+"号"+baby.getName()+"投一票!");
		}
		String description = "当前宝贝排名第"+mc+"名,共有"+tps+"票,";
		if(tps<tps1||mc>1){
			description = description+ "距离第1名相差"+(tps1-tps)+"票,";
		}
		if(tps<tps5||mc>5){
			description = description+ "距离第5名相差"+(tps5-tps)+"票,";
		}
		if(tps<tps20||mc>20){
			description = description+ "距离第20名相差"+(tps20-tps)+"票,";
		}
		if(tps<tps120||mc>120){
			description = description+ "距离第120名相差"+(tps120-tps)+"票,";
		}
		description = description+ "您可以点此进入分享为TA投票。";
		msgXml.setDescription(description);
		msgXml.setPicUrl("http://7xjg0r.com1.z0.glb.clouddn.com/"+baby.getPicture());
		msgXml.setUrl(url+"/baby/getBabyById?csbh="+baby.getCsbh()+"&openId="+openId);	
		return msgXml;			
	}
}
