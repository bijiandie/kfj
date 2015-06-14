package com.kfj.weixin.sign;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import com.alibaba.fastjson.JSONObject;

public class WxSign {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*String jsapi_ticket = "bxLdikRXVbTPdHSM05e5uye6e4creEEvxAuxvQw006EswL8y8DEB8MVlQbVRCtkF6cCqMsa3oIzQzwHNCrGDIQ";
        // 注意 URL 一定要动态获取，不能 hardcode
        String url = "http://yrweixin2.hundsun.cn/kfj/prefer/test/index.jsp?from=singlemessage&isappinstalled=1";
        Map<String, String> ret = sign(jsapi_ticket, url);
        for (Map.Entry entry : ret.entrySet()) {
            System.out.println(entry.getKey() + ", " + entry.getValue());
        }*/
	}

	public static JSONObject sign(String jsapi_ticket, String url) {
        String nonce_str = create_nonce_str();
        String timestamp = create_timestamp();
        String string1;
        String signature = "";
        //注意这里参数名必须全部小写，且必须有序
        string1 = "jsapi_ticket=" + jsapi_ticket +
                  "&noncestr=" + nonce_str +
                  "&timestamp=" + timestamp +
                  "&url=" + url;
        System.out.println(string1);
        try
        {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(string1.getBytes("UTF-8"));
            signature = byteToHex(crypt.digest());
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
        JSONObject obj = new JSONObject();
        obj.put("url", url);
        obj.put("jsapi_ticket", jsapi_ticket);
        obj.put("nonceStr", nonce_str);
        obj.put("timestamp", timestamp);
        obj.put("signature", signature);
        obj.put("appid", WeChat.APPID);
        obj.put("domain", WeChat.DOMAIN);
        return obj;
    }

    private static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash)
        {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }

    private static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }

    private static String create_timestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }
	
}
