<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="style/main.css">
    <link rel="stylesheet" type="text/css" href="style/other.css">
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
    </style>
</head>
<body>
    <noscript>
        <div id="noscript" style="background: #EA6201; width: 100%; color: #fff; border-top: 1px solid #cf5702;
            padding: 5px 0px;">
            您当前的浏览器不支持JavaSctip脚本，请确认浏览器是否开启JavaSctip脚本或刷新页面重试 <a href="/" style="text-decoration: underline;">
                刷新</a></div>
    </noscript>
    <form method="post" action="" id="form1">

    <div class="item-info">
        <span style="position: absolute; height: 40px; top: 10px; right: 12px; text-align: right;">
		<i style="font-style: normal; font-family: Arial;" id="VoteLaud">944</i>
		票 
		</span>
		<span style=" display:block; padding:0px 60px 0px 12px"><i style="font-style: normal; font-family: Arial;">579</i>号</span>
		<span style="position: absolute;right: 44%;top: 10px;">章宸希</span>
     
    </div>
    <div class="item-logo">
        <img src="style/ou6Lyji89CGtF9ZHod-yyeICamPA.jpg" id="ItemLink">
    </div>
    <div class="item-summary item-desc">
        <div class="frame">
            <p>
			<span style="position: absolute; height: 40px; top: 20px; right: 12px; text-align: right;">
			<i style="font-style: normal; font-family: Arial;" id="VoteLaud">944</i>
			票 
			</span>
			<span style=" display:block;"><i style="font-style: normal; font-family: Arial;">579</i>号</span>
			<span style="position: absolute;right: 44%;top: 20px;">章宸希</span>
            </p>
			<p>参赛才艺： 歌曲</p>
			<p>成长宣言：</p>
            <p>弥勒佛来弥勒佛来咯弥勒佛</p>
        </div>
    </div>
    <div class="control">
		<div class="an_h">给我投票，请关注公众号，在公众号内回复***</div>
    </div>
    
    <div class="control">
       <img style="width:48%;float:left;" src="style/p2_06.png" />
       <img style="width:48%;float:right;" src="style/p2_08.png" />
    </div>
    
    <div class="control">
       <img style="width:48%;float:left;" src="style/p2_12.png" />
       <img style="width:48%;float:right;" src="style/p2_13.png" />
    </div>
    <div class="item-summary item-desc" style="display: none;" id="JoinTip">
        <div class="frame">
            <p>
                如何参加
                <br>
                成为“杭州综合频道”（关注微信公众号杭州综合频道：htvweiyi）用户，回复“宝贝”或者点击界面下方的“萌笑宝贝”进入页面，点击我要报名填写相关信息进行成功。
            </p>
        </div>
    </div>
    
    
    <div class="item-summary item-desc" style="display: none;" id="VoteTip">
        <div class="frame">
            <p>
                如何投票：
                <br>
                搜索微信公众号：杭州综合频道。添加关注，回复“宝贝”或点击界面下方的“萌笑宝贝”进入页面搜索萌宝姓名或编号，点击”亲一下“，即可为心目中的萌宝投票！</p>
        </div>
    </div>
    <div class="item-summary">
        <div class="frame" style="padding:5%;">
            <img src="style/p2_bottom.jpg" style="margin:0px auto;" />
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
    <div class="dialog sharemask">
        <img src="style/vote-share.png" alt="" style="width: 100%; height: auto" id="sharemask">
    </div>
    </form>
</body>
</html>