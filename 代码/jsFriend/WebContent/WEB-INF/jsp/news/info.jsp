<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>首页</title>
<link href="${ctx}/resource/css/public.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/jquery.Xslider.js"></script>
<link href="${ctx}/resource/css/news.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
	
	// 焦点图片水平滚动
	$("#slider1").Xslider({
		// 默认配置
		affect: 'scrollx', //效果  有scrollx|scrolly|fade|none
		speed: 800, //动画速度
		space: 6000, //时间间隔
		auto: true, //自动滚动
		trigger: 'mouseover', //触发事件 注意用mouseover代替hover
		conbox: '.conbox', //内容容器id或class
		ctag: 'div', //内容标签 默认为<a>
		switcher: '.switcher', //切换触发器id或class
		stag: 'a', //切换器标签 默认为a
		current:'cur', //当前切换器样式名称
		rand:false //是否随机指定默认幻灯图片
	});
	
	// 焦点图片垂直滚动
	$("#slider2").Xslider({
		affect:'scrolly',
		ctag: 'div',
		speed:400
	});
	
	// 焦点图片淡隐淡现
	$("#slider3").Xslider({
		affect:'fade',
		ctag: 'div'
	});
	
	// 选项卡
	$("#slider4").Xslider({
		affect:'none',
		ctag: 'div',
		speed:10
	});
	
	$("#denglu").click=function(){
		$(".modal-dialog").show();
	};
    var mess = $("#check").val();
    if(mess == 2){
    alert("亲爱的用户您好,您发表的内容已经涉及到传播色情，严重影响到本网站的安全，希望可以杜绝再次类似事件的发生!!!");	
    }
	
});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.menu1{
margin-left:250px;
}
.logo{height: 150px;
       width: 300px;
       position: absolute;
       font-size: 45px;
       font-family: "微软雅黑";
       color: white;
}
.zxcf_top_r a {
  color: #97a0a6;
 color: white;
    font-size: 15px;
    font-weight: bold;
}
.fr {
    float: right;
    margin-top: 50px;
    margin-right: 30px;
   
}
</style>
<body>
<body>
	<div class="wrap_top">
	<input type="hidden" id="check" value="${message}">
   <div class="zxcf_top_r fr" style="width: 300px;height: 80px;margin-top: 20px">
    <c:if test="${userName !=null }">
                  欢迎您：${userName} &nbsp;
                  <c:if test="${tx !=null}">
                    <img alt="" src="${tx}" style="height: 40px;width: 50px;">
                  </c:if>
                <a href="${ctx}/login_tuichu.do">退出</a>
    </c:if>
     <c:if test="${userName ==null }">
     <a href="${ctx}/login_login.do" id="denglu" class="curspan">立即登录</a>
		 	<span>|</span>
		 	<a href="${ctx}/login_register.do" id="denglu">注册</a>
		 	<span></span>
     </c:if>
		 </div>
    	<div class="top">
        	<div class="logo"><span>在线交友平台</span></div>
            <div id="navMenu">
                <UL class="menu1">
                    <li class="onelink"><a href="${ctx}/login_index.do">网站首页</a></li>
                     <li class="navthis22"><a href="${ctx}/user_homePage.do" >我的主页</a></li>
                    <li class="navthis8"><a href="${ctx}/sayMood_shuoshuoList.do"  rel='dropmenu8'>好友动态</a> </li>
                    <li class="navthis25"><a href="${ctx}/advice_advice.do" >意见箱</a></li>
                    </ul>
			</div>
			
        </div>
	 </div>
     <div class="wrap_banner">
     	<div class="banner"></div>
     </div>
     
     
<div class="mian">
          <!-- 222 -->  
            
            <div class="mian">
    <div class="matter">
        <div class="left">
        	<div class="a03">
            	<!-- <div class="info"></div>
                    <div class="content">
                   		<ul>
                           
                        </ul>
                   </div> -->
            </div>
            <div class="b01">
           	  <div class="info">客服服务</div>
                <div class="content1">
                <span class="red">尊贵的客户</span>，欢迎来到在线交友网站
                在这里只有你做不到，没有你想不到。本网站纯净交友，乐于分享，期待你不要吝啬自己的情感，
                做你想要做的。
                 </div>
            </div>
        </div>
        <div class="right">
        	<div class="new">
            	<div class="info">
                	<div class="title"></div>
                </div>
                <div class="content">
                	<div class="one">
                    	<span><span></span></span><h2><a href="">${news.title}</a></h2>
                    </div>
                    <div>
                    ${news.content}
                    </div>
                </div>
            </div>
        </div>
    </div>	

 </div>
 <!-- 22 -->
            
     </div>
<div class="bottomwrap">
	<div class="bottom">
    <div class="wenzi">618团队作品<br />
</div>
    </div>
</div>
</body>
</body>
</html>