package com.kfj.util;

import java.io.InputStream;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class XmlAnalysisUtil {

	/**
	 * 解析XML方法
	 * @param is
	 * @param size
	 * @return
	 */
	public static MSGXml Analysis(InputStream is, int size)throws Exception {
			// 用于缓存每次读取的数据
			byte[] buffer = new byte[size];
			// 用于存放结果的数组
			byte[] xmldataByte = new byte[size];
			int count = 0;
			int rbyte = 0;
			// 循环读取
			while (count < size) {
				// 每次实际读取长度存于rbyte中
				rbyte = is.read(buffer);
				for (int i = 0; i < rbyte; i++) {
					xmldataByte[count + i] = buffer[i];
				}
				count += rbyte;
			}
			is.close();
			String requestStr = new String(xmldataByte, "UTF-8");
			Document doc = DocumentHelper.parseText(requestStr);
			Element rootElt = doc.getRootElement();
			
			//判断消息类型
			String msgType = rootElt.elementText("MsgType");
			MSGXml mx = new MSGXml();
			if (msgType.equals("text")) {
				//文本类型
				String toUserName = rootElt.elementText("ToUserName");
				String fromUserName = rootElt.elementText("FromUserName");
				String content = rootElt.elementText("Content");
				//String msgId = rootElt.elementText("MsgId");
				// 得到所有的有用数据
				mx.setToUserName(toUserName);
				mx.setFromUserName(fromUserName);
				//mx.setCreateTime(new Date().getTime());  
				mx.setMsgType(msgType);
				mx.setContent(content);
				mx.setFuncFlag(0);  
				return mx;
			}else if (msgType.equals("event")) {
				//事件类型
				String toUserName = rootElt.elementText("ToUserName");
				String fromUserName = rootElt.elementText("FromUserName");
				String event = rootElt.elementText("Event");
				String eventKey = rootElt.elementText("EventKey");
				// 得到所有的有用数据
				mx.setToUserName(toUserName);
				mx.setFromUserName(fromUserName);
				//mx.setCreateTime(new Date().getTime());  
				mx.setMsgType(msgType);
				mx.setEvent(event);
				mx.setEventKey(eventKey);
				return mx;
			}
		return null;
	}
}
