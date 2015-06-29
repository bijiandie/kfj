package com.kfj.weixin.sign;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * @author chenyb
 *
 */
public class WeChat {
	/*public static final String DOMAIN = "http://kfj.weixin.iflydo.com/";
	public static final String APPID = "wxa4cfcc5db1ec69c6";
	private static final String APPSECRET = "fe43c7171eb50e880b1e6bc60d087fb0";*/
	public static final String DOMAIN = "http://kfj.weixin.iflydo.com/";
	public static final String APPID = "wxa4cfcc5db1ec69c6";
	private static final String APPSECRET = "fe43c7171eb50e880b1e6bc60d087fb0";
	private static final String ACCESSTOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential";
    private static final String PAYFEEDBACK_URL = "https://api.weixin.qq.com/payfeedback/update";
    
    /**
     * 获取access_token
     * @return
     * @throws Exception
     */
    public static String getAccessToken() throws Exception {
        String url = "https://api.weixin.qq.com/cgi-bin/token?"
        		+ "grant_type=client_credential&appid="+APPID+"&secret="+APPSECRET;
        String jsonStr = HttpUtil.post(url);
        JSONObject obj = JSONObject.parseObject(jsonStr);
        return obj.get("access_token").toString();
    }
    
    /**
     * 获取jsapi_ticket
     * @return
     * @throws Exception
     */
    public static String getJsApiTicket(String accessToken) throws Exception {
    	String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+accessToken+"&type=jsapi";
        String jsonStr = HttpUtil.post(url);
        JSONObject obj = JSONObject.parseObject(jsonStr);
        return obj.get("ticket").toString();
    }
	
    public static void main(String[] args){
    	try {
    		String token = getAccessToken();
    		System.out.println(token);
    		String ticket = getJsApiTicket(token);
    		System.out.println(ticket);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
}
