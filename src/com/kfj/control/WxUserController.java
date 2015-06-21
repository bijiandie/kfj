package com.kfj.control;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kfj.entity.WxUser;
import com.kfj.service.inft.WxUserService;

@Controller
@RequestMapping("/wxUser")
public class WxUserController {

	@Resource(name="wxUserManager")
	private WxUserService wxUserManager;
		
	/**
	 * 根据openId获得wxUser
	 * @param openId
	 * @return
	 */
	public List<WxUser> getWxUserByOpenId(String openId){
		return wxUserManager.getWxUserByOpenId(openId);
	}
	/**
	 * TODO �ж��Ƿ����
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public void isLogin(HttpServletRequest request){		
		 wxUserManager.getWxUserByOpenId("0");
	}
	
}