package com.kfj.control;

import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kfj.entity.Baby;
import com.kfj.service.inft.BabyService;
import com.kfj.util.Config;
import com.kfj.util.ImgCompress;
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
	
	/**
	 * TODO ����baby
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
		//�����ȡ�����ϴ��ļ����ļ����·�����֣�ֻ�����ļ����
        filename = filename.substring(filename.lastIndexOf("\\")+1);
        //����ϴ��ļ����ļ���
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
			@RequestParam("ywydm")String ywydm,@RequestParam("talent")String talent,
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
			//ѹ��ͼƬ
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
}