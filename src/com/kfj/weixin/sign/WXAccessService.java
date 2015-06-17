package com.kfj.weixin.sign;

import java.util.Arrays;
import java.util.Comparator;
import org.apache.commons.lang.StringUtils;
import com.kfj.util.Config;

/**
 * @author wood
 */
public class WXAccessService {

	public String handleVerifyReq(String signature, String timestamp, String nonce, String echostr) {
		
		if (StringUtils.isEmpty(signature) || StringUtils.isEmpty(timestamp)
				|| StringUtils.isEmpty(nonce) || StringUtils.isEmpty(echostr)) {
			return "params wrong";
		}
		//判断是否微信发送的请求
		String token = Config.TOKEN;
		if(isWXRequest(signature, timestamp, nonce, token)){
			return echostr;
		}else{
			return "unknow request";
		}

	}
	/**
	 * 判断是否微信发出的请求
	 * @param signature
	 * @param timestamp
	 * @param nonce
	 * @param token
	 * @return
	 */
	private boolean isWXRequest(String signature, String timestamp, String nonce, String token) {
		boolean res = false;
		
		String[] arrays = new String[3];
		arrays[0] = timestamp;
		arrays[1] = nonce;
		arrays[2] = token;
		
		//按字典排序
		Arrays.sort(arrays, new Comparator<String>(){
			public int compare(String o1, String o2) {
				String upper1 = o1.toUpperCase();
				String upper2 = o2.toUpperCase();
				
				if(upper1.equalsIgnoreCase(upper2)){
					return 0;
				}
				int maxLength = upper1.length() > upper2.length() ? upper1.length() : upper2.length();
				int length1 = upper1.length();
				int length2 = upper2.length();
				
				for(int i=0; i<maxLength; i++){
					char char1 = (char)0;
					char char2 = (char)0;
					if(i <= length1 - 1){
						char1 = upper1.charAt(i);
					}
					if(i <= length2 - 1){
						char2 = upper2.charAt(i);
					}
					if(char1 > char2){
						return 1;
					}else if(char1 < char2){
						return -1;
					}
				}
				return 0;
			}
		});
		//加密
		String input = "";
		for(int i=0; i<arrays.length; i++){
			input += arrays[i];
		}
		
		String output = "";
		byte[] digest = input.getBytes();
		output = new Sha().getDigestOfString(digest);
		
		if(output.equalsIgnoreCase(signature)){
			res = true;
		}
		return res;
	}
		
}
