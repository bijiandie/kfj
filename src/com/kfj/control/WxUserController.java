package com.kfj.control;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kfj.service.inft.WxUserService;

@Controller
@RequestMapping("/wxUser")
public class WxUserController {

	@Resource(name="wxUserManager")
	private WxUserService wxUserManager;
		
	
}