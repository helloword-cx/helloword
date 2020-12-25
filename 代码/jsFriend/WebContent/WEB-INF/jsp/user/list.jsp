<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="user_add.action">
	<input type="text" name="username">username
	<input type="text" name="password">password
	<input type="text" name="nickname">nickname
	<input type="text" name="type">type
	<input type="text" name="email">email
	<input type="submit" value="提交">
</form>

//=====================
<s:iterator value="#list">
<table>
<tr>
					<td>${username }</td>
					<td>${password }</td>
					<td>${nickname }</td>
				</tr>
</table>
</s:iterator>
</body>
</html>