<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.7.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宝贝列表</title>
</head>
<body>
	<table border="1">
		<tbody>
			<tr>
				<th>参赛编号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年龄</th>				
				<th>联系电话</th>
				<th>业务员代码</th>
				<th>投票数</th>
			</tr>
			<c:if test="${!empty babyList }">
				<c:forEach items="${babyList }" var="baby">
					<tr>
						<td>${baby.csbh }</td>
						<td>${baby.name }</td>
						<td>${baby.sex }</td>
						<td>${baby.age }</td>
						<td>${baby.phone }</td>
						<td>${baby.ywydm }</td>
						<td>${baby.tps }</td>
					</tr>				
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>