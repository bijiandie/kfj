

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%

String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

  <head>

    <base href="<%=basePath%>">

    <title>喝喝</title>

    <meta http-equiv="pragma" content="no-cache">

    <meta http-equiv="cache-control" content="no-cache">

    <meta http-equiv="expires" content="0">    

    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

    <meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jweixin-1.0.0.js"></script>

<script>

var imgUrl = 'http://qqfood.tc.qq.com/meishio/16/4585bf7c-be04-420f-ac8a-2dba61a7561f/0';

var lineLink = 'www.baidu.com';

var descContent = "万达狂欢节, 夺宝幸运星大抽奖活动开始啦！";

var shareTitle = '万达狂欢节';

var appid = 'wx6c3d1f2a4ba773c0';

function shareFriend() {
	alert("1");

	wx.onMenuShareTimeline({
	    title: shareTitle, // 分享标题
	    link: lineLink, // 分享链接
	    imgUrl: imgUrl, // 分享图标
	    success: function () { 
	        // 用户确认分享后执行的回调函数
	    },
	    cancel: function () { 
	        // 用户取消分享后执行的回调函数
	    }
	});

</script>  
   </head>

  

  <body>


            <h1>呵呵呵呵</h1>   
            <a javascript:void(0)" onclick="shareFriend()">aaaa</a>        

  </body>

</html>

 