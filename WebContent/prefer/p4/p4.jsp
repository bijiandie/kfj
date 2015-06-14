<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>平安E服务——我是小明星</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        <style type="text/css">
        wx.onMenuShareTimeline({
	    title: 'aa', // 分享标题
	    link: 'www.baidu.com', // 分享链接
	    imgUrl: '', // 分享图标
	    success: function () { 
	        // 用户确认分享后执行的回调函数
	    },
	    cancel: function () { 
	        // 用户取消分享后执行的回调函数
	    }
});
        
        </style>
    </head>
    <body>
        <div class="content">
            <img src="<%=request.getContextPath()%>/prefer/p4/style/p4_01.jpg" class="dimg" />
            <div class="down">
                <a href="http://m.pingan.com/e1" id="iphone_iso"><img src="<%=request.getContextPath()%>/prefer/p4/style/p4_01_03.png" /></a>
                <a href="http://m.pingan.com/e2" id="andrord_an"><img src="<%=request.getContextPath()%>/prefer/p4/style/p4_01_05.png" /></a>
            </div>
            <img src="<%=request.getContextPath()%>/prefer/p4/style/p4_03.jpg" class="dimg" />
        </div>
    </body>
    
    <script language="javascript" type="text/javascript">
function onload(){
	if(isWeiXin()){
		var andr = document.getElementById('andrord_an');
	andr.href = 'http://a.app.qq.com/o/simple.jsp?pkgname=com.pingan.lifeinsurance';
	var b = browser();
	if(b.ios||b.iPhone||b.iPad){
		document.getElementById('iphone_iso').href='http://a.app.qq.com/o/simple.jsp?pkgname=com.pingan.lifeinsurance';
	}		
	}
}
/*judge weixin browser*/
function isWeiXin(){ 
	var ua = window.navigator.userAgent.toLowerCase(); 
	if(ua.match(/MicroMessenger/i) == 'micromessenger')
	{
		return true; 
	}else{ 
		return false; 
	} 
}
onload();
/**  
浏览器版本信息
* @type {Object} 
* @return {Boolean}  返回布尔值     
*/
function browser() {
	var u = navigator.userAgent.toLowerCase();
	var app = navigator.appVersion.toLowerCase();
	return {
		txt: u, // 浏览器版本信息
		version: (u.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [])[1], // 版本号       
		msie: /msie/.test(u) && !/opera/.test(u), // IE内核
		mozilla: /mozilla/.test(u) && !/(compatible|webkit)/.test(u), // 火狐浏览器
		safari: /safari/.test(u) && !/chrome/.test(u), //是否为safair
		chrome: /chrome/.test(u), //是否为chrome
		opera: /opera/.test(u), //是否为oprea
		presto: u.indexOf('presto/') > -1, //opera内核
		webKit: u.indexOf('applewebkit/') > -1, //苹果、谷歌内核
		gecko: u.indexOf('gecko/') > -1 && u.indexOf('khtml') == -1, //火狐内核
		mobile: !!u.match(/applewebkit.*mobile.*/), //是否为移动终端
		ios: !!u.match(/\(i[^;]+;( u;)? cpu.+mac os x/), //ios终端
		android: u.indexOf('android') > -1, //android终端
		iPhone: u.indexOf('iphone') > -1, //是否为iPhone
		iPad: u.indexOf('ipad') > -1, //是否iPad
		webApp: !!u.match(/applewebkit.*mobile.*/) && u.indexOf('safari/') == -1 //是否web应该程序，没有头部与底部
	};
}
</script>
    
</html>