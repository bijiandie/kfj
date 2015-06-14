package com.kfj.control;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.alibaba.fastjson.JSONObject;
import com.kfj.weixin.sign.WeChat;
import com.kfj.weixin.sign.WxSign;

@Controller
@RequestMapping("/WXController")
public class WXController {
	@RequestMapping(method = {RequestMethod.GET})
	public void wxGet(HttpServletRequest request, HttpServletResponse response){
		try {
			// 微信签名
			String signature = request.getParameter("signature");
			// 时间戳
			String timestamp = request.getParameter("timestamp");
			// 随机数
			String nonce = request.getParameter("nonce");
			// 随机字符串
			String echostr = request.getParameter("echostr");
			System.out.println(signature+","+timestamp+","+nonce+","+echostr);
			response.getWriter().write(echostr);
			response.flushBuffer();
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