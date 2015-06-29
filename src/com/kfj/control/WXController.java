package com.kfj.control;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.kfj.entity.Baby;
import com.kfj.entity.TpRole;
import com.kfj.entity.WxUser;
import com.kfj.service.inft.BabyService;
import com.kfj.service.inft.TpRoleService;
import com.kfj.service.inft.WxUserService;
import com.kfj.util.Config;
import com.kfj.util.HandleLogic;
import com.kfj.util.MSGXml;
import com.kfj.util.XmlAnalysisUtil;
import com.kfj.util.XmlStructureUtil;
import com.kfj.weixin.sign.WXAccessService;
import com.kfj.weixin.sign.WeChat;
import com.kfj.weixin.sign.WxSign;

@Controller
@RequestMapping("/WXController")
public class WXController {
	@Resource(name="wxUserManager")
	private WxUserService wxUserManager;
	@Resource(name="babyManager")
	private BabyService babyManager;
	@Resource(name="TpRoleManager")
	private TpRoleService TpRoleManager;
	
	@RequestMapping(method = {RequestMethod.GET})
	public void wxGet(HttpServletRequest request, HttpServletResponse response){
		try {
			WXAccessService wxAccessService = new WXAccessService();
			// 微信签名
			String signature = request.getParameter("signature");
			// 时间戳
			String timestamp = request.getParameter("timestamp");
			// 随机数
			String nonce = request.getParameter("nonce");
			// 随机字符串
			String echostr = request.getParameter("echostr");
			System.out.println(signature+","+timestamp+","+nonce+","+echostr);
			String verifyRes = wxAccessService.handleVerifyReq(signature,
					timestamp, nonce, echostr);
			response.getWriter().write(verifyRes);
			response.flushBuffer();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(method = {RequestMethod.POST})
	public void wxPost(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		try {
			String responseStr = "";
			InputStream inputStream = request.getInputStream();
			int size = request.getContentLength();// 取HTTP请求流长度
			MSGXml mx = null;
			mx = XmlAnalysisUtil.Analysis(inputStream, size); // 解析消息获取详细内容
			String openId = mx.getFromUserName();
			List<WxUser> wxUserList = wxUserManager.getWxUserByOpenId(openId);
			if(wxUserList.size()<=0){
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date d = new Date();
				String dd =format.format(d);
				WxUser wxUser = new WxUser();
				wxUser.setOPENID(openId);
				wxUser.setGzState(Config.GZSTATE_1);	
				wxUserManager.addWxUser(wxUser);
			}
			if (Config.EVE_SUBSCRIBE.equals(mx.getEvent())) {//关注
				
			}else if(Config.EVE_UNSUBSCRIBE.equals(mx.getEvent())){//取消关注
				
			}else if(Config.MSG_TYPE_TEXT.equals(mx.getMsgType())){//文本消息
				String text = mx.getContent();	
				String str="";
				for(int j=text.length();j<6;j++){
					str = str+"0";
				}
				text = str+text;
				List<Baby> entityList = babyManager.getBabyByCsbh(text);
				if(entityList.size()<=0||!text.matches("\\d{6}")){
					responseStr = XmlStructureUtil.Structure(mx, Config.ERROR_0);
				}else{
					List<Baby> BabyList = babyManager.getAllBabyByTps();
					int j=0;
					for(int i=0;i<BabyList.size();i++){
						String csbh = BabyList.get(i).getCsbh();
						j++;
						if(csbh.equals(text)){
							break;
						}						
					}
					List<TpRole> tpRoleList = TpRoleManager.getTpRoleByopenId(openId);
					String flag ="0";//判断是否已对改宝贝投票（0未投票，1已投票）
					for(int i=0;i<tpRoleList.size();i++){
						if(tpRoleList.get(i).getBabyId()==entityList.get(0).getId()){
							flag = "1";
						}
					}
					mx = HandleLogic.handTextByCsbh(mx,text,j,BabyList,flag,openId);
					responseStr = XmlStructureUtil.NewStructure(mx);
				}
				response.getWriter().write(responseStr);
			}else if(Config.MSG_TYPE_EVENT.equals(mx.getMsgType())){//事件
				mx = HandleLogic.handEvent(mx,openId);
				responseStr = XmlStructureUtil.NewStructure(mx);
				response.getWriter().write(responseStr);
			}else{
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 
	 * @param url
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getSingInfo")
	public String getSingInfo(@RequestParam(required=true)String url){
		String result = "";
		try {
    		String token = WeChat.getAccessToken();
    		String ticket = WeChat.getJsApiTicket(token);
    		JSONObject obj = WxSign.sign(ticket, url);
    		result = obj.toJSONString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}	
}