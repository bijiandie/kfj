<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title></title>
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
            <img src="style/p4_01.jpg" class="dimg" />
            <div class="down">
                <a href="javascript:void(0)" onclick="onMenuShareTimeline()"><img src="style/p4_01_03.png" /></a>
                <a href=""><img src="style/p4_01_05.png" /></a>
            </div>
            <img src="style/P4_03.jpg" class="dimg" />
        </div>
    </body>
</html>