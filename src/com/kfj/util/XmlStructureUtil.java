package com.kfj.util;

public class XmlStructureUtil {

	public static String Structure(MSGXml mx ,String content) {
		String res = "";
		StringBuffer sb = new StringBuffer();
		try{
			sb.append("<xml>")
			.append("<ToUserName><![CDATA[" + mx.getFromUserName() + "]]></ToUserName>\n")
			.append("<FromUserName><![CDATA[" + mx.getToUserName() + "]]></FromUserName>\n")
			.append("<CreateTime>" + System.currentTimeMillis() + "</CreateTime>\n")
			.append("<MsgType><![CDATA[text]]></MsgType>\n")
			.append("<Content><![CDATA[" + content + "]]></Content>\n")
			.append("</xml>");
			//.append("<FuncFlag>" + funcFlag + "</FuncFlag>")
		}catch(Exception e){
			e.printStackTrace();
		}

		res = sb.toString();

		return res;

	}
	
	public static String NewStructure(MSGXml mx) {
		String res = "";
		StringBuffer sb = new StringBuffer();
		try{
			sb.append("<xml>")
			.append("<ToUserName><![CDATA[" + mx.getFromUserName() + "]]></ToUserName>\n")
			.append("<FromUserName><![CDATA[" + mx.getToUserName() + "]]></FromUserName>\n")
			.append("<CreateTime>" + System.currentTimeMillis() + "</CreateTime>\n")
			.append("<MsgType><![CDATA[news]]></MsgType>\n")
			.append("<ArticleCount>1</ArticleCount>\n")
			.append("<Articles><item>\n")
			.append("<Title><![CDATA["+mx.getTitle()+"]]></Title> \n")
			.append("<Description><![CDATA["+mx.getDescription()+"]]></Description>\n")
			.append("<PicUrl><![CDATA["+mx.getPicUrl()+"]]></PicUrl>\n")
			.append("<Url><![CDATA["+mx.getUrl()+"]]></Url>\n")
			.append("</item></Articles></xml>");
			//.append("<FuncFlag>" + funcFlag + "</FuncFlag>")
		}catch(Exception e){
			e.printStackTrace();
		}

		res = sb.toString();

		return res;

	}
	public static String StructureService(MSGXml mx ,String content) {
		String res = "";
		StringBuffer sb = new StringBuffer();
		try{
			sb.append("<xml>")
			.append("<ToUserName><![CDATA[" + mx.getFromUserName() + "]]></ToUserName>\n")
			.append("<FromUserName><![CDATA[" + mx.getToUserName() + "]]></FromUserName>\n")
			.append("<CreateTime>" + System.currentTimeMillis() + "</CreateTime>\n")
			.append("<MsgType><![CDATA[transfer_customer_service]]></MsgType>\n")
			.append("</xml>");
			//.append("<FuncFlag>" + funcFlag + "</FuncFlag>")
		}catch(Exception e){
			e.printStackTrace();
		}

		res = sb.toString();

		return res;

	}
	/**
		//图文消息
		else if ("news".equals(content)) {
			String responseStr = "<xml>";
			responseStr += "<ToUserName><![CDATA[" + fromUserName
			+ "]]></ToUserName>";
			responseStr += "<FromUserName><![CDATA[" + toUserName
			+ "]]></FromUserName>";
			responseStr += "<CreateTime>" + System.currentTimeMillis()
			+ "</CreateTime>";
			responseStr += "<MsgType><![CDATA[news]]></MsgType>";
			responseStr += "<Content><![CDATA[]]></Content>";

			responseStr += "<ArticleCount>2</ArticleCount>";

			responseStr += "<Articles>";
			responseStr += "<item>";
			responseStr += "<Title><![CDATA[图文消息——红色石头]]></Title>";
			responseStr += "<Discription><![CDATA[图文消息正文——红色石头]]></Discription>";
			responseStr += "<PicUrl><![CDATA[http://redstones.sinaapp.com/res/images/redstones_wx_258.jpg]]></PicUrl>";
			responseStr += "<Url><![CDATA[http://redstones.sinaapp.com/]]></Url>";
			responseStr += "</item>";

			responseStr += "<item>";
			responseStr += "<Title><![CDATA[图文消息——红色石头]]></Title>";
			responseStr += "<Discription><![CDATA[图文消息正文——红色石头]]></Discription>";
			responseStr += "<PicUrl><![CDATA[http://redstones.sinaapp.com/res/images/redstones_wx_258.jpg]]></PicUrl>";
			responseStr += "<Url><![CDATA[http://redstones.sinaapp.com/]]></Url>";
			responseStr += "</item>";

			responseStr += "</Articles>";
			responseStr += "<FuncFlag>1</FuncFlag>";
			responseStr += "</xml>";
			response.getWriter().write(responseStr);
		}
	 **/
}
