<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function login(){
		var form = document.forms[0];
		form.action = "/kfj/user/getUser";
		form.method="post";
		form.submit();
	}
</script>
</head>
<body>
	<h1>登入页面</h1>
	<form action="" name="userForm">
		用户名：<input type="text" name="userName">
		密   码：<input type="password" name="passWord">
		<input type="button" value="登入" onclick="login()">
	</form>
</body>
</html>