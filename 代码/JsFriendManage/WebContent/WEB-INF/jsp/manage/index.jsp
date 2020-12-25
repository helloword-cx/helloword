<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!-- 评价界面 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ctx}/resource/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/resource/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/resource/assets/css/main-min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resource/assets/js/bui-min.js"></script>
<script type="text/javascript" src="${ctx}/resource/assets/js/common/main-min.js"></script>
<script type="text/javascript" src="${ctx}/resource/assets/js/config-min.js"></script>
<script>
BUI.use('common/main',function(){
    var config = [{id:'1',menu:[{text:'系统管理',items:[{id:'6',text:'用户管理',href:'${ctx}/manage_userList.do'},{id:'12',text:'积分管理',href:'${ctx}/jf_jfList.do'},
                 {id:'3',text:'等级管理',href:'${ctx}/grade_gradeList.do'},{id:'14',text:'意见箱',href:'${ctx}/advice_adviceList.do'},
                 {id:'15',text:'新闻发布',href:'${ctx}/news_newList.do'}]}]}];
    new PageUtil.MainPage({
        modulesConfig : config
    });
});
</script>
</head>
<body>
<div class="header" style="height: 50px;">
    <div class="dl-title" style="text-align:center;">
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
        <span style="font-size:30px ">在线社区交友网站后台管理系统 </span>
    </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">${name}</span><a href="${ctx}/login_tuichu.do" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">系统管理</div></li>		
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">
    </ul>
</div>
</body>
