package com.kfj.control;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.kfj.util.Config;
import com.kfj.util.MSGXml;
import com.kfj.util.XmlAnalysisUtil;
import com.kfj.weixin.sign.WXAccessService;
import com.kfj.weixin.sign.WeChat;
import com.kfj.weixin.sign.WxSign;

@Controller
@RequestMapping("/WXController")
public class WXController {
	@RequestMapping(method = {RequestMethod.GET})
	public void wxGet(HttpServletRequest request, HttpServletResponse response){
		try {
			WXAccessService wxAccessService = new WXAccessService();
			// 微信签名
			String signature = request.getParameter("signature");
			// 时间戳
			String timestamp = request.getParameter("timestamp");
			// 随机数
			String nonce = request.getParameter("nonce");
			// 随机字符串
			String echostr = request.getParameter("echostr");
			System.out.println(signature+","+timestamp+","+nonce+","+echostr);
			String verifyRes = wxAccessService.handleVerifyReq(signature,
					timestamp, nonce, echostr);
			response.getWriter().write(verifyRes);
			response.flushBuffer();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(method = {RequestMethod.POST})
	public void wxPost(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		try {
			InputStream inputStream = request.getInputStream();
			int size = request.getContentLength();// 取HTTP请求流长度
			MSGXml mx = null;
			mx = XmlAnalysisUtil.Analysis(inputStream, size); // 解析消息获取详细内容
			if (Config.EVE_SUBSCRIBE.equals(mx.getEvent())) {
				
			}else if(Config.EVE_UNSUBSCRIBE.equals(mx.getEvent())){
				
			}else if(Config.MSG_TYPE_TEXT.equals(mx.getEvent())){
				
			}else if(Config.MSG_TYPE_EVENT.equals(mx.getEvent())){
				
			}else{
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 
	 * @param url
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getSingInfo")
	public String getSingInfo(@RequestParam(required=true)String url){
		String result = "";
		try {
    		String token = WeChat.getAccessToken();
    		String ticket = WeChat.getJsApiTicket(token);
    		JSONObject obj = WxSign.sign(ticket, url);
    		result = obj.toJSONString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}	
}