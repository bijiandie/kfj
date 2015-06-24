<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>晒“萌笑”宝贝，拿苹果Watch！</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
    <meta name="apple-mobile-web-app-title" content="">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta content="telephone=no" name="format-detection">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/prefer/tp2/style/main.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/prefer/tp2/style/other.css">
    <script type="application/x-javascript">addEventListener('DOMContentLoaded',function(){setTimeout(function(){scrollTo(0,1);},0);},false);</script>
    <style type="text/css">
        body
        {
            background: #4b8d7f;
        }
        
        p
        {
            padding: 10px;
            color: #333;
        }
        
        img
        {
            width: 100%;
            height: auto;
        }
        
        
        .item-info
        {
            line-height: 20px;
            color: #fff;
            font-size: 20px;
            overflow:hidden;
			padding:10px 0px 10px 0px;
        }
        
        .item-logo
        {
            margin: 6px 10px 10px 10px;
        }
        
        .item-summary
        {
            margin: 0px 10px 10px 10px;
            position: relative;
            padding-top: 10px;
        }
        
        .item-desc:before
        {
            position: absolute;
            top: -10px;
            left: 30px;
            width: 0;
            height: 0;
            display: block;
            content: " ";
            border-color: transparent;
            border-style: solid solid outset;
            border-width: 10px 10px 10px 10px;
            pointer-events: none;
            border-bottom-color: rgba(0,0,0,0.2);
        }
        
        #VoteTip:before
        {
            left: auto;
            right: 30px;
        }
        
        .item-summary .frame
        {
            background: rgba(0,0,0,0.2);
            border-radius: 8px 8px 8px 8px;
            line-height: 22px;
        }
        
        .item-summary p
        {
            color: #fff;
        }
        
        .item-summary .title
        {
            display: block;
            height: 40px;
            line-height: 20px;
            padding-left: 40px;
            background: url(/assets/phone/ico-signname.png) 0px 5px no-repeat;
            background-size: 30px 30px;
            font-size: 18px;
            margin-bottom: 10px;
        }
        
        
        .joined
        {
            color: #4497ac;
            text-align: center;
        }
        .more
        {
            text-decoration: none;
            color: #CD2826;
            line-height: 30px;
        }
        
        .control
        {
            margin: 0px 10px 0px 10px;
            height: 55px;
            padding-top: 6px;
        }
		.control .an_h{
			background: #f6c308 none repeat scroll 0 0;
			border-radius: 8px;
			color: #ffffff;
			font-size: 4.3vw;
			padding: 11px;
		}
		.dialog1
		{
		    position:fixed;
		    z-index: 99999;
		    width: 100%;
		    height: 100%;
		    left: 0px;
		    top: 0px;
		    display: none;
		}
		.other
        {
            position: fixed;
            width: 100%;
            height: 100%;
            left: 0px;
            top: 0px;
            background: rgba(0,0,0,0.6);
            z-index: 1000000;
            display: none;
        }
        .other .tip
        {
            position: absolute;
            width: 80%;
            height: auto;
            padding: 4%;
            left: 6%;
            top: 100px;
            background: #237a67;
            border-radius: 8px 8px 8px 8px;
            font-size: 18px;
            color: #fff;
        }
        .other .close
        {
            display: block;
            margin: 16px 10px 0px 10px;
            background: #00aa67;
            color: #fff;
            height: 32px;
            line-height: 32px;
            text-align: center;
            border-radius: 5px 5px 5px 5px;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js"></script>
    <script type="text/javascript">
	    function DoShare() {
	        $(".sharemask").show();
	    }
	
		 $(function () {
			 $("#sharemask").click(function () {
	             $(".sharemask").hide();
	         });
	
	     });
		 function tp() {
			var openId = document.getElementById("openId").value;
			var csbh = document.getElementById("csbh").value;	
			var tps = document.getElementById("tps").value;
			if(openId==''){
				$("#VoteTip").show();
				return;
			}
			$.ajax({
				  type: 'POST',
				  url:'<%=request.getContextPath()%>/baby/tpBaby',
				  data:{ openId: openId, csbh: csbh },
				  datatype:"text",
				  success:function(data){
					  if(data==tps){
					  $("#other1").show();
					  }
					 $('.VoteLaud').html(data);
				  },	
				  //调用出错执行的函数
		            error: function(){
		                alert("error");
		            }
				});
		 }
    </script>
</head>
<body>
    <noscript>
        <div id="noscript" style="background: #EA6201; width: 100%; color: #fff; border-top: 1px solid #cf5702;
            padding: 5px 0px;">
            您当前的浏览器不支持JavaSctip脚本，请确认浏览器是否开启JavaSctip脚本或刷新页面重试 <a href="/" style="text-decoration: underline;">
                刷新</a>
        </div>
    </noscript>
    <form method="post" action="" id="form1">

    <div class="item-info">
    <input type="hidden" id="tps" name="tps" value="${baby.tps }"/>
        <span style="position: absolute; height: 40px; top: 10px; right: 12px; text-align: right;">
		<i style="font-style: normal; font-family: Arial;" id="VoteLaud" class="VoteLaud">${baby.tps }</i>
		票 
		</span>
		<span style=" display:block; padding:0px 60px 0px 12px"><i style="font-style: normal; font-family: Arial;">${baby.csbh }</i>号</span>
		<span style="position: absolute;right: 44%;top: 10px;">${baby.name }</span>    
    </div>
    <div class="item-logo">
    	<input type="hidden" id="picture" name="picture" value="http://7xjg0r.com1.z0.glb.clouddn.com/${baby.picture }"/>
        <img src="http://7xjg0r.com1.z0.glb.clouddn.com/${baby.picture }" id="ItemLink">
    </div>
    <div class="item-summary item-desc">
        <div class="frame">
            <p>
			<span style="position: absolute; height: 40px; top: 20px; right: 12px; text-align: right;">
			<i style="font-style: normal; font-family: Arial;" id="VoteLaud" class="VoteLaud">${baby.tps }</i>
			票 
			</span>
			<span style=" display:block;"><i style="font-style: normal; font-family: Arial;">${baby.csbh }</i>号</span>
			<span style="position: absolute;right: 44%;top: 20px;">${baby.name }</span>
			<input type="hidden" id="babyName" name="babyName" value="${baby.name }"/>
            </p>
			<p>参赛才艺： ${baby.talent }</p>
			<p>成长宣言：</p>
            <p>${baby.czjy }</p>
        </div>
    </div>
    <!-- <div class="control">
		<div class="an_h">给我投票，请关注公众号，在公众号内回复***</div>
    </div> -->
    
    <div class="control">    
        <img style="width:48%;float:left;" src="<%=request.getContextPath()%>/prefer/tp2/style/p2_06.png"/> 
 		<a onclick="DoShare()"><img alt="" style="width:48%;float:right;" src="<%=request.getContextPath()%>/prefer/tp2/style/p2_08.png"></a>
 	</div>
    
    <div class="control">
    	<input type="hidden" id="csbh" name="csbh" value="${baby.csbh }"/>
   		<input type="hidden" id="openId" name="openId" value="${openId }"/>
       <a href="<%=request.getContextPath()%>/prefer/p4/p4.jsp"><img style="width:48%;float:left;" src="<%=request.getContextPath()%>/prefer/tp2/style/p2_12.png" /></a>
       <a onclick="tp()"><img style="width:48%;float:right;" src="<%=request.getContextPath()%>/prefer/tp2/style/p2_13.png" /></a>
    </div>
    <div class="other" id="other1">
        <div class="tip">您已参与投票!<br>          
            <a class="close" onclick="$('#other1').hide()">我知道了</a>
        </div>
    </div>
    
    
    <div class="item-summary item-desc" style="display: none;" id="VoteTip">
        <div class="frame">
            <p>
                如何投票：
                <br>
                请关注'闪耀浙分客服节'公众帐号,然后在该微信中才能投票。</p>
        </div>
    </div>
    <div class="item-summary">
        <div class="frame" style="padding:5%;">
            <img src="<%=request.getContextPath()%>/prefer/tp2/style/p2_bottom.jpg" style="margin:0px auto;" />
        </div>
    </div>
    <a href="tel:0571-1234556" class="more" style="color: #fff; display: block; text-align: center;
        padding-bottom: 5px; font-size: 12px;">技术支持 杭州XXXXXX </a>
    <div class="dialog loading">
        <i class="mask"></i>
    </div>
    <div class="dialog alert">
        <i class="form"><span class="txt">提示</span> <a onclick="HideAlert()">确定</a> </i>
    </div>
	<div class="dialog1 sharemask">
        <img src="<%=request.getContextPath()%>/prefer/tp2/style/vote-share.png" alt="" style="width: 100%; height: auto" id="sharemask" />
    </div> 
    
    </form>
</body>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	var url = location.href.split('#')[0];
    	var babyName = document.getElementById("babyName").value;
    	var picture = document.getElementById("picture").value;
    	var openId = document.getElementById("openId").value;
    	var csbh = document.getElementById("csbh").value;
    	//url='http://yrweixin2.hundsun.cn/kfj/baby/getAllBabyList';
    	$.ajax({
    		type: 'POST',
    		url:'<%=request.getContextPath()%>/WXController/getSingInfo',
			data:{ url: url },
			datatype:"json",     
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
    	    	      'onMenuShareAppMessage'
    	    	    ]
    	    	});
    	       
    	       	wx.error(function (res) {
    	    		//alert(res.errMsg);
    	    	});
    	       
    	       	wx.ready(function () {
    	       		wx.onMenuShareAppMessage({
    	       		    title: '快来帮\''+babyName+'\'投一票！',
    	       		    desc: '我正在参加我是小明星评比，叔叔阿姨们快来帮我投一票吧',
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
    	       		
    	       		wx.onMenuShareTimeline({
    	       			title: '快来帮\''+babyName+'\'投一票！',
    	       		    desc: '我正在参加我是小明星评比，叔叔阿姨们快来帮我投一票吧',
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
</html>