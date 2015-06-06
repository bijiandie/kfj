<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>立即报名</title>
<script type="text/javascript">
	function ljbm(){
		var form = document.forms[0];
		form.action = "/kfj/baby/addBaby";
		form.method="post";
		form.submit();
	}
</script>
</head>
<body>
	<h1>立即报名</h1>
	<form action="" name="bmForm" enctype="multipart/form-data">
		<label>宝贝姓名：<input type="text" name="name"/><br></label>
		<label>宝贝性别：<select name="sex" id="sex"><option value="男">男</option><option value="男">女</option></select><br></label>
		<label>宝贝年龄：<input type="text" name="age"/><br></label>
		<label>联系电话：<input type="text" name="phone"/><br></label>
		<label>业务员代码：<input type="text" name="ywydm"/><br></label>
		<label>宝贝照片：<input type="file" name="picture"/><br></label>
		<label>参赛才艺：<input type="text" name="talent"/><br></label>
		<label>成长寄语：<input type="text" name="czjy"/><br></label>
		<input type="button" value="立即报名" onclick="ljbm()">
	</form>
</body>
</html>