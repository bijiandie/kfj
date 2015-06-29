package com.kfj.util;

/**
 * The Config class is a global configuration file for the sdk, used for serve
 * side only.
 */
public class Config {
		
	
	/**
	 * 微信参数
	 */
	public static String URL = "http://kfj.weixin.iflydo.com/kfj";
	public static String ACCESS_KEY = "7QkB-BXcR1JP2HLJXLoOmsByUVza72lBm_rTNeza";
	public static String SECRET_KEY = "FeK2rcR_hiZ1e6cl1zJq4c2KJ2yQQsLcrptMXyBW";
	public static String BUCKETNAME = "wsxmx";
	public static String TOKEN = "wsxmx";
	
	/**
	 * 图片压缩参数
	 */
	public static Integer IMG_WIDTH = 1000;
	public static Integer IMG_HIGTH = 1000;
	
	
	/**
	 * 微信参数
	 */
	public static String EVE_SUBSCRIBE				= "subscribe";
	public static String EVE_UNSUBSCRIBE			= "unsubscribe";
	public static String EVE_CLICK					= "CLICK";
	
	//消息类型
	public static String MSG_TYPE_TEXT 		= "text";		//文本消息
	public static String MSG_TYPE_EVENT 	= "event";     	//事件信息
	public static String MSG_TYPE_LINK 		= "link";		//链接消息
	public static String MSG_TYPE_IMAGE   	= "image";		//图片消息
	public static String MSG_TYPE_LOCATION 	= "location";	//地理位置消息
	public static String MSG_TYPE_NEWS 		= "news";		//音乐信息
	public static String MSG_TYPE_MUSIC 	= "music";		//图文信息
	
	//事件值
	public static String EVE_WSXMX    = "2004";//
	
	
	//常量
	public static String GZSTATE_0 = "0";//(0未关注，1已关注，2取消关注)
	public static String GZSTATE_1 = "1";
	public static String GZSTATE_2 = "2";
	
	public static String TPSTATE_0 = "0";//(0未投票,1已投票)
	public static String TPSTATE_1 = "1";
	
	//错误信息
	public static String ERROR_0 = "输入编号为选手参赛编号(例如：000001)";
}
