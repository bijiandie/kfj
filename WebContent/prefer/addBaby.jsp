<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>立即报名</title>
<script type="text/javascript">
	function ljbm(){
		if(document.getElementById('name').value==''){
			   document.getElementById("name_message").innerText = "用户名不能为空";
			   return false;
			}else{
				document.getElementById("name_message").innerText = "";
			}
		if(document.getElementById('age').value==''){
			   document.getElementById("age_message").innerText = "宝贝年龄不能为空";
			   return false;
			}else{
				var age = document.getElementById('age').value;
				var regAge = /^120$|^((1[0-1]|[1-9])?\d)$/m;
				if(regAge.test(age)==false){
					document.getElementById("age_message").innerText = "宝贝年龄有误";
					return false;
					}
				document.getElementById("age_message").innerText = "";
			}
		if(document.getElementById('phone').value==''){
			document.getElementById("phone_message").innerText = "联系电话不能为空";
			return false;
			}else{
				var tel = document.getElementById('phone').value;
				var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
				 if (reg.test(tel)==false) {
					 document.getElementById("phone_message").innerText = "联系电话有误";
					 return false;
				 }
				 document.getElementById("phone_message").innerText = ""; 
			}
		if(document.getElementById('picture').value==''){
			document.getElementById("picture_message").innerText = "请上传宝贝照片";
			   return false;
			}else{
				document.getElementById("picture_message").innerText = "";
			}
		var form = document.forms[0];
		form.action = "<%=request.getContextPath()%>/baby/addBaby";
		form.method="post";
		form.submit();
	}
</script>
</head>
<body>
	<h1>立即报名</h1>
	<form action="" name="bmForm" enctype="multipart/form-data">
		<label>宝贝姓名：<input id="name" type="text" name="name"/><span id="name_message"></span><br></label>
		<label>宝贝性别：<select id="sex" name="sex"><option value="男">男</option><option value="男">女</option></select><br></label>
		<label>宝贝年龄：<input id="age" type="text" name="age"/><span id="age_message"></span><br></label>
		<label>联系电话：<input id="phone" type="text" name="phone"/><span id="phone_message"></span><br></label>
		<label>业务员代码：<input id="ywydm" type="text" name="ywydm"/><br></label>
		<label>宝贝照片：<input id="picture" type="file" name="picture"/><span id="picture_message"></span><br></label>
		<label>参赛才艺：<input id="talent" type="text" name="talent"/><br></label>
		<label>成长寄语：<input id="czjy" type="text" name="czjy"/><br></label>
		<input type="button" value="立即报名" onclick="ljbm()">
	</form>
</body>
</html>