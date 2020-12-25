<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!-- 评价界面 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <title>后台管理系统</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/style.css" />
    <script type="text/javascript" src="${ctx}/resource/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/bootstrap.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/ckform.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/common.js"></script>
</head>
  <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }
        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
       td{text-align:center;}
    </style>
<body>
     <button type="button" class="btn btn-success" id="addnew">新增积分规则</button>
<table class="table table-bordered table-hover definewidth m10" align="center">
    <thead>
    <tr>
        <th>类型</th>
        <th>描述</th>
        <th>分数</th>
         <th>操作</th>
    </tr>
    </thead>
     <c:forEach items="${jfs}" var="jf" varStatus="l">
      <tr >
            <td align="center">${jf.type}</td>
            <td>${jf.miaoshu}</td>
            <td>${jf.fenshu}</td>
            <td>
                   <a id="update" href="${ctx}/jf_updateJf.do?id=${jf.id}">修改</a>
                   <a id="update" href="${ctx}/jf_del.do?id=${jf.id}">删除</a>
            </td>
        </tr>
     </c:forEach>
 </table>
</body>
<script>
    $(function () {
		$('#addnew').click(function(){
			window.location.href="${ctx}/jf_addJf.do";
		 });
    });

</script>