<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>管理员登陆</title>
<link href="${ctx}/resource/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main-login">

	<div class="login-content">	
	<h2>管理员登录</h2>
	
    <form action="manage_index.do" method="post" id="login-form" name="login-form">
    <div class="login-info">
	<span class="user">&nbsp;</span>
	<input name="name" id="name" type="text"  value="" class="login-input"/>
	</div>
    <div class="login-info">
	<span class="pwd">&nbsp;</span>
	<input name="passWord" id="password" type="password"  value="" class="login-input"/>
	</div>
    <div class="login-oper">
	</div>
    <div class="login-oper">
	<input  type="submit" value="登 录" class="login-btn"/>
	<input  type="reset" value="重 置" class="login-reset"/>
	</div>
    </form>
    </div>
   
</div>   

<div style="text-align:center;">
</body>
</body>
</html>