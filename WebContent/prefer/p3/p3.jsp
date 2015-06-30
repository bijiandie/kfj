<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>平安E服务——我是小明星</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="../prefer/p3/style/style.css" />
        <script type="text/javascript" src="../js/jquery-1.7.1.js"></script>
    </head>
    <script type="text/javascript">
  //显示灰色 jQuery 遮罩层 
	function showBg() {
		var bh = $("body").height();
		var bw = $("body").width();
		$("#fullbg").css({
			width : bw,
			display : "block"
		});
		$("#dialog").show();
	}
	//关闭灰色 jQuery 遮罩 
	function closeBg() {
		$("#fullbg,#dialog").hide();
	}
	function DoShare() {
        $(".sharemask").show();
    }

	 $(function () {
		 $("#sharemask").click(function () {
             $(".sharemask").hide();
         });

     });


</script>
    <body>
        <div class="content">
            <img src="../prefer/p3/style/p3_01.jpg" class="img" />
            <div class="clear"></div>
            <input type="hidden" id="csbh" name="csbh" value="${csbh}"/>
            <input type="hidden" id="babyName" name="babyName" value="${babyName}"/>
            <input type="hidden" id="picture" name="picture" value="http://7xjg0r.com1.z0.glb.clouddn.com/${picName }"/>
            <div class="wz">您的参赛编号是<br>${csbh }</div>
            <img src="../prefer/p3/style/p3_03.jpg" class="img" />
            <div class="clear"></div>
            <div class="an1">
                <p style="height: auto;"><a href="http://mp.weixin.qq.com/s?__biz=MzA3NDk3NzY5Ng==&mid=206362457&idx=1&sn=3bc5c1c7b0c8e22938961164ac8033df#rd" target="_blank"><img src="../prefer/p3/style/p3_08.png" /></a></p>
            </div>
            <div id="fullbg" style="height: 100%;"></div>
			<div id="dialog">
				<p class="close">
					<a href="#" onclick="closeBg();">关闭</a> 
				</p>
				<div><img src="../prefer/p3/style/p3_10.jpg" class="img" /></div>
			</div>
            <img src="../prefer/p3/style/p3_05.jpg" class="img" />
            <div class="clear"></div>
            <div class="an2"><img src="../prefer/p3/style/p3_09.png" onclick="DoShare()" /></div>   
            <div class="dialog1 sharemask">
        		<img src="../prefer/p3/style/vote-share.png" alt="" style="width: 100%; height: auto"
            		id="sharemask" />
    		</div>        
            <img src="../prefer/p3/style/p3_07.jpg" class="img" />
        </div>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var url = location.href.split('#')[0];
	var csbh = document.getElementById("csbh").value;
	var babyName = document.getElementById("babyName").value;
	var picture = document.getElementById("picture").value;
	$.ajax({
	    url:'<%=request.getContextPath()%>/WXController/getSingInfo',
	    type:'post',     
	    data:'url='+url,
	    error:function(){     
	       alert('error');
	    },     
	    success:function(data){
	       data=eval("("+data+")");//转换为json对象
	       var appid = data.appid;
	       var timestamp = data.timestamp;
	       var nonceStr = data.nonceStr;
	       var signature = data.signature;
	       var domain = data.domain;
	       
	       //注册事件
	       wx.config({
	    	    debug: false,
	    	    appId: appid,
	    	    timestamp: timestamp,
	    	    nonceStr: nonceStr,
	    	    signature: signature,
	    	    jsApiList: [
	    	      'checkJsApi',
	    	      'onMenuShareTimeline',
	    	      'onMenuShareAppMessage',
	    	      'onMenuShareQQ',
	    	      'onMenuShareWeibo'
	    	    ]
	    	});
	       
	       	wx.error(function (res) {
	    		//alert(res.errMsg);
	    	});
	       
	       	wx.ready(function () {
	       		// 2. 分享接口
	       		// 2.1 监听“分享给朋友”，自定义分享内容及分享结果接口
	       		wx.onMenuShareAppMessage({
	       		    title: '快来帮'+csbh+'号'+babyName+'投一票！',
	       		    desc: '叔叔阿姨们快来帮我投票吧~',
	       		    link: domain+'<%=request.getContextPath()%>/baby/getBabyById?csbh='+csbh,
	       		 	imgUrl: picture,
	       		    trigger: function (res) {
	       		      //alert('用户点击发送给朋友');
	       		    },
	       		    success: function (res) {
	       		      //alert('已分享');
	       		    },
	       		    cancel: function (res) {
	       		      //alert('已取消');
	       		    },
	       		    fail: function (res) {
	       		      //alert(JSON.stringify(res));
	       		    }
	       		  });
	       		
	       		// 2.2 监听“分享到朋友圈”自定义分享内容及分享结果接口
	       		wx.onMenuShareTimeline({
	       		 	title: '快来帮'+csbh+'号'+babyName+'投一票！',
	       		    desc: '叔叔阿姨们快来帮我投票吧~',
	       		    link: domain+'<%=request.getContextPath()%>/baby/getBabyById?csbh='+csbh,
	       		 	imgUrl: picture,
	       		    trigger: function (res) {
	       		      //alert('用户点击分享到朋友圈');
	       		    },
	       		    success: function (res) {
	       		      //alert('已分享');
	       		    },
	       		    cancel: function (res) {
	       		      //alert('已取消');
	       		    },
	       		    fail: function (res) {
	       		      //alert(JSON.stringify(res));
	       		    }
	       		  });
	       		
	       	});
	       
	       
	    }  
	});
}); 



</script>
    </body>
</html>