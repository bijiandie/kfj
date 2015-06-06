package com.kfj.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kfj.entity.User;
import com.kfj.service.inft.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource(name="userManager")
	private UserService userManager;
	
	/**
	 * TODO 判断是否登入
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String isLogin(HttpServletRequest request){		
		HttpSession session = request.getSession();
		String isFlag = (String) session.getAttribute("isFlag");
		if("1".equals(isFlag)){
			return "redirect:/baby/getAllBaby";
		}else{
			return "/admin/login";
		}
	}
	
	/**
	 * TODO 用户登入
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/getUser")
	public String getUser(User user,HttpServletRequest request){		
		User entity = userManager.getUserByUserName(user.getUserName());
		//判断密码是否正确
		if(!entity.getPassWord().equals(user.getPassWord())){			
			return "/admin/login";
		}
		//判断是否已登入
		HttpSession session = request.getSession();
		session.setAttribute("isFlag","1");
		return "redirect:/baby/getAllBaby";
	}
	
	
}