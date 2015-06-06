package com.kfj.control;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kfj.entity.Baby;
import com.kfj.service.inft.BabyService;
import com.kfj.util.UploadHandle;

@Controller
@RequestMapping("/baby")
public class BabyController {

	@Resource(name="babyManager")
	private BabyService babyManager;
		
	/**
	 * TODO 列出baby
	 * @return
	 */
	@RequestMapping("/getAllBaby")
	public String getAllBaby(HttpServletRequest request){		
		List<Baby> babyList = babyManager.getAllBaby();
		request.setAttribute("babyList", babyList);		
		return "/admin/index";
	}
	
	/**
	 * TODO 新增baby
	 * @return
	 */
	@RequestMapping("/addBaby")
	public String addBaby(Baby baby,HttpServletRequest request,HttpServletResponse response){		
		
		UploadHandle uploadHandle = new UploadHandle();
		Integer csbh = 1;
		try {
			Baby entity = uploadHandle.upload(request,response);			
			List<Baby> babyList = babyManager.getAllBaby();		
			if(babyList.size()>0){
				csbh = Integer.valueOf(babyList.get(0).getCsbh())+1;
			}
			entity.setCsbh(String.valueOf(csbh));
			babyManager.addBaby(entity);		
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		request.setAttribute("csbh", csbh);		
		return "/prefer/addBabySuccess";
	}
}