<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body ontouchstart="">    
<div class="wxapi_container">    
<div class="wxapi_index_container">    
<ul class="label_box lbox_close wxapi_index_list">    
<li class="label_item wxapi_index_item"><a class="label_inner" href="#menu-basic">基础接口</a></li>    
<li class="label_item wxapi_index_item"><a class="label_inner" href="#menu-share">分享接口</a></li>    
</ul>    
</div>    
<div class="lbox_close wxapi_form">    

<button class="btn btn_primary" id="checkJsApi">checkJsApi</button>    
<h3 id="menu-share">分享接口</h3>    
<span class="desc">获取“分享到朋友圈”按钮点击状态及自定义分享内容接口</span>    
<button class="btn btn_primary" id="onMenuShareTimeline">onMenuShareTimeline</button>    
<span class="desc">获取“分享给朋友”按钮点击状态及自定义分享内容接口</span>    
<button class="btn btn_primary" id="onMenuShareAppMessage">onMenuShareAppMessage</button>    
<span class="desc">获取“分享到QQ”按钮点击状态及自定义分享内容接口</span>    
<button class="btn btn_primary" id="onMenuShareQQ">onMenuShareQQ</button>    
<span class="desc">获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口</span>    
<button class="btn btn_primary" id="onMenuShareWeibo">onMenuShareWeibo</button>    

</div>    
</div>    
</body>    
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>    
<script type="text/javascript">
alert(location.href.split('#')[0])
/*
 * 注意：
 * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
 * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
 * 3. 完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
 *
 * 如有问题请通过以下渠道反馈：
 * 邮箱地址：weixin-open@qq.com
 * 邮件主题：【微信JS-SDK反馈】具体问题
 * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
 */
wx.config({
    debug: true,
    appId: 'wx6c3d1f2a4ba773c0',
    timestamp: 1434276090,
    nonceStr: 'bb268c39-f0e6-47da-b8fe-086625d4231f',
    signature: '727340b014b0a48cc8cb65965978b5e4b83270d0',
    jsApiList: [
      'checkJsApi',
      'onMenuShareTimeline',
      'onMenuShareAppMessage',
      'onMenuShareQQ',
      'onMenuShareWeibo'
    ]
});
/*
* 注意：
* 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
* 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
* 3. 完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
*
* 如有问题请通过以下渠道反馈：
* 邮箱地址：weixin-open@qq.com
* 邮件主题：【微信JS-SDK反馈】具体问题
* 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
*/
wx.ready(function () {
	// 2. 分享接口
	// 2.1 监听“分享给朋友”，按钮点击、自定义分享内容及分享结果接口
	document.querySelector('#onMenuShareAppMessage').onclick = function () {
	  wx.onMenuShareAppMessage({
	    title: '互联网之子',
	    desc: '在长大的过程中，我才慢慢发现，我身边的所有事，别人跟我说的所有事，那些所谓本来如此，注定如此的事，它们其实没有非得如此，事情是可以改变的。更重要的是，有些事既然错了，那就该做出改变。',
	    link: 'http://movie.douban.com/subject/25785114/',
	    imgUrl: 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
	    trigger: function (res) {
	      alert('用户点击发送给朋友');
	    },
	    success: function (res) {
	      alert('已分享');
	    },
	    cancel: function (res) {
	      alert('已取消');
	    },
	    fail: function (res) {
	      alert(JSON.stringify(res));
	    }
	  });
	  alert('已注册获取“发送给朋友”状态事件');
	};
	// 2.2 监听“分享到朋友圈”按钮点击、自定义分享内容及分享结果接口
	document.querySelector('#onMenuShareTimeline').onclick = function () {
	  wx.onMenuShareTimeline({
	    title: '互联网之子',
	    link: 'http://movie.douban.com/subject/25785114/',
	    imgUrl: 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
	    trigger: function (res) {
	      alert('用户点击分享到朋友圈');
	    },
	    success: function (res) {
	      alert('已分享');
	    },
	    cancel: function (res) {
	      alert('已取消');
	    },
	    fail: function (res) {
	      alert(JSON.stringify(res));
	    }
	  });
	  alert('已注册获取“分享到朋友圈”状态事件');
	};
});

wx.error(function (res) {
	alert(res.errMsg);
});
</script>
</html>