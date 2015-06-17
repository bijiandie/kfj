package com.kfj.control;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kfj.entity.Baby;
import com.kfj.service.inft.BabyService;
import com.kfj.util.Config;
import com.kfj.util.ImgCompress;
import com.kfj.util.PageUtil;
import com.kfj.weixin.sign.HttpUtil;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

@Controller
@RequestMapping("/baby")
public class BabyController {

	@Resource(name="babyManager")
	private BabyService babyManager;
		
	/**
	 * TODO �г�baby
	 * @return
	 */
	@RequestMapping("/getAllBaby")
	public String getAllBaby(HttpServletRequest request){		
		List<Baby> babyList = babyManager.getAllBaby();
		request.setAttribute("babyList", babyList);		
		return "/admin/index";
	}
	
	@RequestMapping(value = "/upload.do",method=RequestMethod.POST)
	public String upload(@RequestParam(value="picture",required=false) MultipartFile file,
			@RequestParam(value="name",required=false)String name,
			@RequestParam(value="sex",required=false)String sex,
			@RequestParam(value="age",required=false)String age,
			@RequestParam(value="ywydm",required=false)String ywydm,
			@RequestParam(value="talent",required=false)String talent,
			@RequestParam(value="jzxm",required=false)String jzxm,
			@RequestParam(value="czjy",required=false)String czjy,Model model){
		String ACCESS_KEY = Config.ACCESS_KEY;
		String SECRET_KEY = Config.SECRET_KEY;
		String bucketName = Config.BUCKETNAME;
		String csbh = "";
		try{
			UploadManager uploadManager = new UploadManager();
			Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
			String token = auth.uploadToken(bucketName);
			String picName = rename(file.getOriginalFilename());
	        String img = picName.substring(picName.lastIndexOf(".")+1);
			ImgCompress imgCom = new ImgCompress(file.getInputStream(),img);
			byte[] data = imgCom.resizeFix(Config.IMG_WIDTH,Config.IMG_HIGTH);
			
			Response r = uploadManager.put(data,picName,token);
			System.out.println("status:"+r.statusCode);
			
			Baby baby = new Baby();
			baby.setName(name);
			baby.setAge(age);
			baby.setSex(sex);
			baby.setPicture(picName);
			baby.setCsbh(csbh);
			baby.setTalent(talent);
			baby.setCzjy(czjy);
			baby.setJzxm(jzxm);
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
			System.out.println(ex);
			return "/prefer/p3/500";
		}
		return "/prefer/p3/p3";
	}
	
	/**
	    * @Method: makeFileName
	    * @Description: ����ϴ��ļ����ļ����ļ����ԣ�uuid+"_"+�ļ���ԭʼ���
	    * @Anthor:
	    * @param filename �ļ���ԭʼ���
	    * @return uuid+"_"+�ļ���ԭʼ���
	    */
	private String makeFileName(String filename){  //2.jpg
        filename = filename.substring(filename.lastIndexOf("\\")+1);
        //Ϊ��ֹ�ļ����ǵ�������ҪΪ�ϴ��ļ�����һ��Ψһ���ļ���
        return UUID.randomUUID().toString() + "_" + filename;
    }
	
	public static String rename(String fileName){
        int i = fileName.lastIndexOf(".");
        String str = fileName.substring(i);
        return new Date().getTime()+""+ new Random().nextInt(99999999) +str;
    }
	
	@RequestMapping(value = "/upload.do",method=RequestMethod.GET)
	public String test(){
		return "/prefer/p4/p4";
	}
	
	@RequestMapping("/getAllBabyList")
	public String getAllBabyList(HttpServletRequest request){
		String currentPage = request.getParameter("currentPage");//当前页面 
		List<Baby> entityList = babyManager.getAllBaby();
		int recordCount = entityList.size();//总共的条数 
		int  currentPage1 = 0;//当前页面 
		Integer currentSize = 0;//当前页面第一条数据 
		int pageSize = 10;//每页显示的条数 
		int pageCount = HttpUtil.getPageCount(recordCount, pageSize);
		if(currentPage!=null){
			currentPage1 = Integer.valueOf(currentPage);
			currentSize = currentPage1*pageSize;
		}
			
		List<Baby> babyList = babyManager.getAllBabyByTps(currentSize,pageSize);		
		List<Baby> babyList1 = new ArrayList<Baby>();
		List<Baby> babyList2 = new ArrayList<Baby>();
		int cyrs = entityList.size();
		int ljtp = babyManager.getLjtp();
		for(int i=0;i<babyList.size();i=i+2){
			babyList1.add(babyList.get(i));
			if(i<babyList.size()-1){
				babyList2.add(babyList.get(i+1));
			}
		}
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("currentPage", currentPage1);	
		request.setAttribute("cyrs", cyrs);	
		request.setAttribute("ljtp", ljtp);	
		request.setAttribute("babyList1", babyList1);	
		request.setAttribute("babyList2", babyList2);
		
		return "/prefer/tp1/tp1";
	}
	
	@ResponseBody
	@RequestMapping("/getAllBabyRank")
	public List<Baby> getAllBabyRank(HttpServletRequest request){		
		return babyManager.getAllBabyByTps();	
	}
	
	@RequestMapping("/getBabyByCsbh")
	public String getBabyByCsbh(HttpServletRequest request){
		List<Baby> entityList = babyManager.getAllBaby();
		List<Baby> babyList = babyManager.getAllBabyByTps();
		int ljtp = babyManager.getLjtp();
		int cyrs = entityList.size();
		String csbh = request.getParameter("csbh");
		Baby baby = babyManager.getBabyByCsbh(csbh);
		request.setAttribute("baby", baby);		
		request.setAttribute("cyrs", cyrs);	
		request.setAttribute("ljtp", ljtp);	
		return "/prefer/tp1/tp11";	
	}
}