package com.kfj.weixin.sign;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.logging.Logger;

import org.hibernate.annotations.common.util.impl.LoggerFactory;

public class HttpUtil {

	public static String post(String url){
		String result = "";
		try{
			URL urlGet = new URL(url);
			HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
			http.setRequestMethod("GET"); // 必须是get方式请求
			http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);
			System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
			System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
			http.connect();
            InputStream is = http.getInputStream();
	        int size = is.available();
	        byte[] jsonBytes = new byte[size];
	        is.read(jsonBytes);
	        result = new String(jsonBytes, "UTF-8");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return result;
	}
	
}
