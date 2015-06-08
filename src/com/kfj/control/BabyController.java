package com.kfj.control;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kfj.entity.Baby;
import com.kfj.service.inft.BabyService;
import com.kfj.util.Config;
import com.kfj.util.UploadHandle;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.sun.org.apache.xpath.internal.operations.Mod;

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
	 * @throws Exception 
	 */
/*	@RequestMapping("/addBaby")
	public String addBaby(@RequestParam("picture") MultipartFile file) throws Exception{		
		String ACCESS_KEY = Config.ACCESS_KEY;
		String SECRET_KEY = Config.SECRET_KEY;
		String bucketName = Config.BUCKETNAME;
		String csbh = "";
		String filename=baby.getPicture();
		UploadManager uploadManager = new UploadManager();
		Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
		String token = auth.uploadToken(bucketName);
		String url = baby.getPicture();
		//处理获取到的上传文件的文件名的路径部分，只保留文件名部分
        filename = filename.substring(filename.lastIndexOf("\\")+1);
        //生成上传文件的文件名
        String pic = this.makeFileName(filename);
		Response r = uploadManager.put(new File(url), pic, token);
		System.out.println("status:"+r.statusCode);
		List<Baby> babyList = babyManager.getAllBaby();		
		if(babyList.size()>0){
			int csbh_ = Integer.valueOf(babyList.get(0).getCsbh())+1;
			csbh = String.valueOf(csbh_);
			StringBuffer a = new StringBuffer();
			for(int j=csbh.length();j<6;j++){
				a.append("0");
			}
			csbh = a+csbh;
		}else{
			csbh="000001";
		}
		if(baby.getYwydm()!=null){
			baby.setYwydm(baby.getYwydm()+"@pa18.com");
		}
		baby.setPicture(pic);
		baby.setCsbh(String.valueOf(csbh));
		babyManager.addBaby(baby);
		request.setAttribute("csbh", csbh);		
		return "/prefer/p3/p3";
	}*/
	
	@RequestMapping(value = "/upload.do")
	public String upload(@RequestParam("picture") MultipartFile file,
			@RequestParam("name")String name,@RequestParam("sex")String sex,@RequestParam("age")String age,
			@RequestParam("phone")String phone,@RequestParam("ywydm")String ywydm,@RequestParam("talent")String talent,
			@RequestParam("czjy")String czjy,Model model){
		String ACCESS_KEY = Config.ACCESS_KEY;
		String SECRET_KEY = Config.SECRET_KEY;
		String bucketName = Config.BUCKETNAME;
		String csbh = "";
		try{
			UploadManager uploadManager = new UploadManager();
			Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
			String token = auth.uploadToken(bucketName);
			String picName = rename(file.getOriginalFilename());
			Response r = uploadManager.put(file.getBytes(), picName, token);
			System.out.println("status:"+r.statusCode);
			
			Baby baby = new Baby();
			baby.setName(name);
			baby.setAge(age);
			baby.setPhone(phone);
			baby.setSex(sex);
			baby.setPicture(picName);
			baby.setCsbh(csbh);
			baby.setTalent(talent);
			baby.setCzjy(czjy);
			
			List<Baby> babyList = babyManager.getAllBaby();	
			if(babyList.size()>0){
				int csbh_ = Integer.valueOf(babyList.get(0).getCsbh())+1;
				csbh = String.valueOf(csbh_);
				StringBuffer a = new StringBuffer();
				for(int j=csbh.length();j<6;j++){
					a.append("0");
				}
				csbh = a+csbh;
			}else{
				csbh="000001";
			}
			if(ywydm!=null){
				baby.setYwydm(ywydm+"@pa18.com");
			}
			baby.setCsbh(String.valueOf(csbh));
			babyManager.addBaby(baby);
			model.addAttribute("csbh", csbh);
		}catch(Exception ex){
			return "/prefer/p3/p3";
		}
		return "/prefer/p3/p3";
	}
	
	/**
	    * @Method: makeFileName
	    * @Description: 生成上传文件的文件名，文件名以：uuid+"_"+文件的原始名称
	    * @Anthor:
	    * @param filename 文件的原始名称
	    * @return uuid+"_"+文件的原始名称
	    */
	private String makeFileName(String filename){  //2.jpg
        filename = filename.substring(filename.lastIndexOf("\\")+1);
        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
        return UUID.randomUUID().toString() + "_" + filename;
    }
	
	public static String rename(String fileName){
        int i = fileName.lastIndexOf(".");
        String str = fileName.substring(i);
        return new Date().getTime()+""+ new Random().nextInt(99999999) +str;
    }
}