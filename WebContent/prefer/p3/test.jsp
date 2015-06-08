<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        <script type="text/javascript" src="style/jquery-1.7.1.js"></script>
    </head>
    <script type="text/javascript">
  //显示灰色 jQuery 遮罩层 
	function showBg() {
		var bh = 1700;
		alert(bh);
		var bw = $("body").width();
		$("#fullbg").css({
			height : bh,
			width : bw,
			display : "block"
		});
		$("#dialog").show();
	}
	//关闭灰色 jQuery 遮罩 
	function closeBg() {
		$("#fullbg,#dialog").hide();
	}
</script>
    <body>
        <div class="content">
            <img src="style/p3_01.jpg" class="img" />
            <div class="clear"></div>
            <div class="wz">您的参赛编号是<br>${csbh }</div>
            <img src="style/p3_03.jpg" class="img" />
            <div class="clear"></div>
            <div class="an1">
                <p style="height: auto;"><a href="javascript:showBg();"><img src="style/p3_08.png" /></a></p>
            </div>
            <div id="fullbg"></div>
			<div id="dialog">
				<p class="close">
					<a href="#" onclick="closeBg();">关闭</a> 
				</p>
				<div><img src="style/p3_10.jpg" class="img" /></div>
			</div>
            <img src="style/p3_05.jpg" class="img" />
            <div class="clear"></div>
            <div class="an2"><a href=""><img src="style/p3_09.png" /></a></div>
            <img src="style/p3_07.jpg" class="img" />
        </div>
    </body>
</html>