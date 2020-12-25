<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>首页</title>
<link href="${ctx}/resource/css/public.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/css/index.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/css/activity.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/jquery.Xslider.js"></script>

<link rel="stylesheet" href="${ctx}/resource/css/amazeui.min.css" />
		<script type="text/javascript" src="${ctx}/resource/js/amazeui.min.js"></script>
		<link rel="stylesheet" href="${ctx}/resource/css/login.css" />
		<link rel="stylesheet" href="${ctx}/resource/css/mui.min.css" />
		<script type="text/javascript" src="${ctx}/resource/js/mui.min.js" ></script>
		<script type="text/javascript" src="${ctx}/resource/js/login.js" ></script>
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
	$("#zhuce").click(function(){
        $("#myForm").submit();
	});
	
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
       margin-top:20px;
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
	<div class="matter">
    	<div class="left">
        	<div class="a02">
        	
           <form action="user_register.do" id="myForm" method="post">
               	<div style="width:600px;">
				<div class="loginDiv " style="display: block;"  id="login" >
						<div class="am-u-sm-12" style="padding-right: 0rem">
						</div>
					<div class="am-u-sm-12" style="padding-left: 30px;padding-right: 30px;">
					<h4 style="font-weight: normal;">欢迎注册</h4>
				 	<span class="left1"></span>	<input type="text" name="userName" class="am-form-field"  placeholder="用户名" style="padding-left: 50px;margin-top: 48px;font-size: 12px;"/>
				 </div>	
				 
				 <div class="am-u-sm-12" style="margin-top: 21px;padding-left: 30px;padding-right: 30px;">
				  <span class="left2"></span>	  <input type="password" name="passWord" class="am-form-field"  placeholder="请输入密码"style="padding-left: 50px;font-size: 12px;"/>
				 </div>	
				 <div class="am-u-sm-12" style="margin-top: 21px;padding-left: 30px;padding-right: 30px;">
				  <span class="left2"></span>	  <input type="text" name="age" class="am-form-field"  placeholder="请输入年龄"style="padding-left: 50px;font-size: 12px;"/>
				 </div>	
				 <div style="margin-left: 40px;margin-top: 180px" >
				 姓名 ：<span ></span> 男:<input type="radio" name="sex" value="1" />
				  女:<input type="radio" name="sex" value="2"  />
				 </div>	
				 <div class="am-u-sm-12" style="margin-top: 21px;padding-left: 30px;padding-right: 30px;">
				  <span class="left2"></span>	  <input type="text" name="interest" class="am-form-field"  placeholder="请输入爱好"style="padding-left: 50px;font-size: 12px;"/>
				 </div>	
				 <div class="am-u-sm-12" style="margin-top: 21px;padding-left: 30px;padding-right: 30px;">
				  <span class="left2"></span>	  <input type="text" name="address" class="am-form-field"  placeholder="请输入地址"style="padding-left: 50px;font-size: 12px;"/>
				 </div>	
				<div class="am-u-sm-12" style="margin-top: 45px;padding-left: 30px;padding-right: 30px;">
				<button type="button" id="zhuce" class="am-btn am-btn-warning" style="width: 100%;border-radius: 5px;font-size: 16px;" >注册</button>	
				</div>
			<!-- 	private int id;
	private int ;
	private int sex;//1男2女
	private String ;//爱好
	private  ;
	private String ;//真实名 -->
				</div>
				</div>
           </form>
                <div class="content">
              </div>
            </div>
       </div>
        <div class="right">
       	  <div class="b01">
            	<div class="info">客服服务</div>
                <div class="content">0516-XXXXXXXX</div>
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
    </div>

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