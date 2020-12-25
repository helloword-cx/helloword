<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>首页</title>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/thems.css"/>
<link href="${ctx}/resource/css/public.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/css/photo.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/css/activity.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/jquery.Xslider.js"></script>

<link rel="stylesheet" href="${ctx}/resource/css/amazeui.min.css" />
		<script type="text/javascript" src="${ctx}/resource/js/amazeui.min.js"></script>
		<link rel="stylesheet" href="${ctx}/resource/css/login.css" />
		<script type="text/javascript" src="${ctx}/resource/js/mui.min.js" ></script>
		<script type="text/javascript" src="${ctx}/resource/js/login.js" ></script>
		
		
		<link rel="stylesheet" type="text/css" href="${ctx }/resource/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/resource/css/bootstrap-responsive.css" />
    <script type="text/javascript" src="${ctx }/resource/js/jquery.sorted.js"></script>
    <script type="text/javascript" src="${ctx }/resource/js/bootstrap.js"></script>
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
	$("#left_menu li ul").css("display","block");
	$("#left_menu li .yiji").click(function(){
		$(this).parents("li").find(".erji").toggle();
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
.a-upload {
    padding: 4px 10px;
    height: 30px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}

.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}

.a-upload:hover {
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}


.messtime{
color: blue;
}
.message_left_con{
width: 60%;
}
.message_left_con{
 -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
    margin-left: 10px;
    background: #78CDF8;
}
.mess_right{
clear: both;
}
.mess_left{
clear: both;
}
.message_right_con{
clear:both;
width: 60%;
float: right;
 -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
    margin-left: 10px;
    background: #78CDF8;
}
.nameMe{
float: right;
}
</style>
<body>
<body>
	<div class="wrap_top">
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
        	<div class="logo"><span>在线交友网站</span></div>
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
<div class="matter2">
                <div class="choose">
                    <div class="select2" style="font-size: 20px;background: #fa8f00;height: 40px;color: white;font-weight: bold;padding-left: 5px;">
                           <c:if test="${js.id == userId}">
                              <span >我的相册</span>
                           </c:if>
                            <c:if test="${js.id != userId}">
                              <span >好友相册</span>
                           </c:if>
                            
                    </div>
                </div>
                 <div class="content" style="width: 100%;">
                 
                  <c:forEach items="${sayMoods.datas}" var="data" varStatus="l">
				      <%-- <tr >
				            <td align="center">${Employee.id}</td>
				            <td align="center">${Employee.ka_id}</td>
				            <td>${Employee.name}</td>
				            <td>${Employee.department.departName}</td>
				            <td>
				                  <a href="${ctx}/userlogin/employeeupdate?id=${Employee.id}">修改</a>
				                  <a id="update" onclick="del(${Employee.id});">删除</a>
				            </td>
				        </tr> --%>
				        <div class="prod">
                        <div class="tip" >
                               <a href="${ctx}/sayMood_photoDetail.do?id=${data.id}&otherId=${js.id}"><img src="${data.content}" style="height: 225px;width: 225px" onload="javascript:DrawImage(this,205,125)"></a>
                        </div>
                        <div class="scrt">
	                           <div class="zt" style="text-align: center;">
	                            <c:if test="${js.id == userId}">
                              <a href="${ctx}/sayMood_delete.do?id=${data.id}"><span style="float: left;">删除</span></a>
                           </c:if>
	                              
	                           </div>
                        </div>
              		</div>
				     </c:forEach>
                 
                  <c:if test="${js.id == userId}">
                             <form action="user_fileUpload.do" method="post" enctype="multipart/form-data">
	                    <div style="float: right;margin-top: 30px;color: white;font-size: 15px;font-weight: bold;">
	                     <a href="javascript:;" class="a-upload"><input type="file" name="file" id="" style="background: #fa8f00;"> 快来美美的分享吧|上传图片</a>
	                     <input type="submit" name="上传" style="background: #fa8f00;position: relative;top:-10px">
	                    </div>
                   </form>
                 </c:if>
                    
                </div>
                <!-- 分页 -->
                
                 <div class="panel-foot text-center">
      <pg:pager  url="${ctx}/user_homePage.do" maxIndexPages="5" items="${sayMoods.total}"  maxPageItems="15" export="curPage=pageNumber" >
		<pg:last>  
			共${sayMoods.total}记录,共${pageNumber}页,  
		</pg:last>  
		 
			当前第${curPage}页 
  
        <pg:first>  
    		<a href="${pageUrl}">首页</a>  
		</pg:first>  
		<pg:prev>  
    		<a href="${pageUrl}">上一页</a>  
		</pg:prev>  
      
       	<pg:pages>  
        	<c:choose>  
            	<c:when test="${curPage eq pageNumber}">  
                	<font color="red">[${pageNumber }]</font>  
            	</c:when>  
            	<c:otherwise>  
               		<a href="${pageUrl}">${pageNumber}</a>  
            	</c:otherwise>  
        	</c:choose>  
    	</pg:pages>
             
        <pg:next>  
    		<a href="${pageUrl}">下一页</a>  
		</pg:next>  
		<pg:last>  
			<c:choose>  
            	<c:when test="${curPage eq pageNumber}">  
                	<font color="red">尾页</font>  
            	</c:when>  
            	<c:otherwise>  
               		<a href="${pageUrl}">尾页</a>  
            	</c:otherwise>  
        	</c:choose> 
    		  
		</pg:last>
	</pg:pager>
    </div>
    <!-- 分页end -->
            </div>
            <!-- 聊天 -->
            <c:if test="${js.id == userId}">
            
            <div class="choose" style="margin-top: 30px;">
                    <div class="select2" style="font-size: 20px;background: #fa8f00;height: 40px;color: white;font-weight: bold;padding-left: 5px;">
                        <span >我的好友</span>
                    </div>
            </div>
            <div class="content" style="width: 100%;" >
            
            
            <!--中间部分-->
<div class="main2">
	<!--新闻列表-->
    <div class="person clearfix">
    	<div class="order_l person_l">
        	<ul id="left_menu" class="left_menu">
        	     <li>
                	<a class="yiji"><span style="font-size: 20px;color: white;font-weight: bold;">好友添加</span></a>
                	<ul class="erji" style="width: 100%">
                    	<li>
                    	    <form action="user_findFriend.do" method="post" style="">
                    	      <input type="text" name="userName" value="${findName }"   style="width:120px"> <input type="submit" value="搜索">
                    	   </form>
                        </li>
                         <c:forEach items="${findFriends}" var="user" varStatus="l">
                            <form action="user_addFriend.do" method="post" style=":float: right;">
                          <li style="width: 294px">
                        	<i>&nbsp;</i>
                            <a href="">${user.userName}</a>&nbsp;&nbsp;&nbsp;
                         <!--    //家人，同学，朋友，陌生人
	                             private int groups;//所属分组1234 -->
	                           
	                             <input type="hidden" name="id" value="${user.id}">
		                              <select name="groupId" style="width: 130px">
										  <option value ="1">家人</option>
										  <option value ="2">同学</option>
										  <option value="3">朋友</option>
										  <option value="4">陌生人</option>
										</select>
										<input type="submit" value="加为好友">
	                            
                        </li>
                         </form>
                         </c:forEach>
                    </ul>
                </li>
                	<!-- List<Friend> f1 = new ArrayList<Friend>();
			List<Friend> f2 = new ArrayList<Friend>();
			List<Friend> f3 = new ArrayList<Friend>();
			List<Friend> f4 = new ArrayList<Friend>(); -->
            	<li>
                	<a class="yiji"><span style="font-size: 20px;color: white;font-weight: bold;">家人</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    <c:forEach items="${f1}" var="f" varStatus="l">
                        <li>
                        	<i>&nbsp;</i>
                             <strong><a href="${ctx}/user_otherHomePage.do?otherId=${f.id}">${f.name}</a></strong>&nbsp;&nbsp;<a href="${ctx}/user_deleteFriend.do?friendId=${f.id }">删除</a>
                        </li>
                     </c:forEach>
                    </ul>
                </li>
                <li>
                	<a class="yiji"><span style="font-size: 20px;color: white;font-weight: bold;">同学</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	 <c:forEach items="${f2}" var="f" varStatus="l">
                        <li>
                        	<i>&nbsp;</i>
                             <strong><a href="${ctx}/user_otherHomePage.do?otherId=${f.id}">${f.name}</a></strong>&nbsp;&nbsp;<a href="${ctx}/user_deleteFriend.do?friendId=${f.id }">删除</a>
                        </li>
                     </c:forEach>
                    </ul>
                </li>
                <li>
                	<a class="yiji" ><span style="font-size: 20px;color: white;font-weight: bold;" >朋友</span></a>
                	 <ul class="erji">
                    	 <c:forEach items="${f3}" var="f" varStatus="l">
                        <li>
                        	<i>&nbsp;</i>
                             <strong><a href="${ctx}/user_otherHomePage.do?otherId=${f.id}">${f.name}</a></strong>&nbsp;&nbsp;<a href="${ctx}/user_deleteFriend.do?friendId=${f.id }">删除</a>
                        </li>
                     </c:forEach>
                    </ul>
                </li>
                <li>
                	<a class="yiji"><span style="font-size: 20px;color: white;font-weight: bold;">陌生人</span></a>
                	 <ul class="erji">
                    	 <c:forEach items="${f4}" var="f" varStatus="l">
                        <li>
                        	<i>&nbsp;</i>
                             <strong><a href="${ctx}/user_otherHomePage.do?otherId=${f.id}">${f.name}</a></strong>&nbsp;&nbsp;<a href="${ctx}/user_deleteFriend.do?friendId=${f.id }">删除</a>
                        </li>
                     </c:forEach>
                    </ul>
                </li>
                <li>
                	<a class="yiji"><span style="font-size: 20px;color: white;font-weight: bold;">好友推荐</span></a>
                	<ul class="erji" style="width: 100%">
                         <c:forEach items="${tjs}" var="user" varStatus="l">
                            <form action="user_addFriend.do" method="post" style=":float: right;">
                          <li style="width: 294px">
                        	<i>&nbsp;</i>
                            <a href="">${user.userName}</a>&nbsp;&nbsp;&nbsp;
                         <!--    //家人，同学，朋友，陌生人
	                             private int groups;//所属分组1234 -->
	                           
	                             <input type="hidden" name="id" value="${user.id}">
		                              <select name="groupId" style="width: 130px">
										  <option value ="1">家人</option>
										  <option value ="2">同学</option>
										  <option value="3">朋友</option>
										  <option value="4">陌生人</option>
										</select>
										<input type="submit" value="加为好友">
	                            
                             </li>
                         </form>
                         </c:forEach>
                    </ul>
                </li>
                <li>
                	<a class="yiji" ><span style="font-size: 20px;color: white;font-weight: bold;" >最近来访</span></a>
                	 <ul class="erji">
                    	 <c:forEach items="${fws}" var="f" varStatus="l">
                        <li>
                        	<i>&nbsp;</i>
                             <strong><a href="">${f.other.userName}</a></strong>&nbsp;&nbsp;</a>
                        </li>
                     </c:forEach>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="person_r">
        	<div class="person_h">
            	<span>群聊大厅</span>
            	<input type="hidden" name="hname" id="hname" value="${userName}">
            </div>
            <div class="person_rmain" style="background: #f2f2f2 ">
            	<div class="news_d" style="height: 350px;overflow:auto;overflow-x:hidden;">
	            	  
                </div>
            </div>
             <div class="news_d2" style="height: 200px;border: 1px solid #ddd;">
                  <textarea name="content" id="content" rows="" cols="" style="width: 100%;height: 80%;border: 1px solid white;">
                  
                  </textarea>
                  <div style="width: 200px;float: right;">
                     <button onclick="sendMessage('${userName}')" style="width: 100px;background:#fa8f00">发送</button>
                  </div>
             </div>
        </div>
    </div>
    <!--新闻列表-->
    <div class="space_hx">&nbsp;</div>
</div>
 
<!--中间部分-->
            </div>
            
             <div class="choose" style="margin-top: 30px;width: 1000px;margin: 0 auto;">
                    <div class="select2" style="font-size: 20px;background: #fa8f00;height: 40px;color: white;font-weight: bold;padding-left: 5px;">
                        <span >基本信息</span>
                    </div>
            </div>
   <div class="main3">
	<!--新闻列表-->
    <div class="person clearfix">
    	<div class="order_l person_l">
    	<table style="border-collapse:separate; border-spacing:20px;">
    	  <tr><td>用户名：</td><td>${xinxi.userName}</td></tr>
    	  <tr><td>性别：</td><td>
    	   <c:if test="${xinxi.sex == 1}">
    	   男
    	   </c:if>
    	   <c:if test="${xinxi.sex == 2}">
    	   女
    	   </c:if>
    	  </td></tr>
    	  <tr><td>年龄：</td><td>${xinxi.age}</td></tr>
    	  
    	  <tr><td>当前积分：</td><td>${xinxi.jifen}</td></tr>
    	  <tr><td>当前级别：</td><td>${xinxi.dengji}</td></tr>
    	  <tr><td>到期时间：</td><td>
              <c:if test="${xinxi.dqTime == null}">
                                                暂无充值记录
              </c:if>
           <c:if test="${xinxi.dqTime != null}">
                                                ${xinxi.dqTime}
              </c:if>
               </td></tr>
    	  <tr><td>爱好：</td><td>${xinxi.interest}</td></tr>
    	<tr><td>地址：</td><td>${xinxi.address}</td></tr>
    	</table>
    	  <form action="user_fileUpload2.do" method="post" enctype="multipart/form-data">
    	<table>
    	  <tr>
    	 <td style="width: 200px;margin-left: 30px">头像：</td>
    	 <td><input type="file" name="file">  <input type="submit" name="上传" style="background: #fa8f00;"></td>
       </tr>
    	</table>
    	</form>
        </div>
        <div class="person_r">
            <div class="person_rmain" style="background: #f2f2f2 ">
            	<div class="news_d22" style="height: 350px;overflow:auto;overflow-x:hidden;">
	            	  
	            	 <form action="user_chongzhi.do" method="post" class="definewidth m20" id="hh">
<table class="table table-bordered table-hover definewidth m10">
<!-- private int type;
	private String miaoshu;
	private int fenshu; -->
	<input type="hidden" name="id" value="${xinxi.id}"/>
    <tr>
        <td width="" class="tableleft">所需金额</td>
        <td><input type="text" id="jine" value="25" disabled name="jine"></td>
    </tr>
    <tr>
        <td class="tableleft">类型</td>
        <td>
           <select id ='ss' name="type"> 
	              <option value="1">支付宝</option>
	              <option value="2">银行卡</option>
         </select>
        </td>
       </tr> 
        <tr>
        <td>选择充值月数</td>
        <td>
           <select id ='yue' name="yuefen"> 
	              <option value="1">一月</option>
	              <option value="2">二月</option>
	               <option value="3">三月</option>
	                <option value="4">四月</option>
	                 <option value="5">五月</option>
	                  <option value="6">六月</option>
	                   <option value="7">七月</option>
	                    <option value="8">八月</option>
	                     <option value="9">九月</option>
	                      <option value="10">十月</option>
	                       <option value="11">十一月</option>
	                        <option value="12">十二月</option>
         </select>
        </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" id="save" type="button">充值</button> &nbsp;&nbsp;
        </td>
    </tr>
</table>
</form>
                </div>
            </div>
        </div>
    </div>
    </c:if>
    <!--新闻列表-->
    <div class="space_hx">&nbsp;</div>
</div>
            </div>
            
<div class="bottomwrap">
	<div class="bottom">
    <div class="wenzi">618团队作品<br />
</div>
    </div>
</div>
</body>
<script type="text/javascript">
$("#yue").change(function(){
	 var s =  $(this).val();
	 $("#jine").val(s*25);
	});

$("#sendMessage").click(function(name){
	
	 
});

function sendMessage(name){
	var con = $("#content").val();
//	${ctx}/sayMood_photoDetail.do?id=${data.id}
  var date = getNowFormatDate();
	 $.ajax({
		type : 'post',
		url : ctx+"/message_sendMessage.do?content="+con,
		dataType : "json",
		success : function(data) {
			if(data.result == 2){
				alert("您会员已经到期了，暂时不能聊天，请充值后再聊天！！！")
				return false;
			}else{
				$(".news_d").append(" <div class='mess_right'><div class='nameMe'><span class='messtime'>"+name+"</span>&nbsp;&nbsp;:&nbsp;&nbsp;<span class='messtime'>"+date+"</span></div><div class='message_right_con'>"+con+"</div> </div>");
				$("#content").val("");
				$('.news_d').scrollTop( $('.news_d')[0].scrollHeight );
			}
		},
		error : function() {
			alert("error");
		}
	});
}
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}
$(function(){
	
	  $("body").keydown(function() {
          if (event.keyCode == "13") {//keyCode=13是回车键
        	 // var name=${userName};
        	 // alert(name);
        	 var name= $("#hname").val();
        	  sendMessage(name);
          }
      });
	resive();
	
	//聊天的先注释掉
	
	 setTimeout(function () {
		setInterval(resive2,4000);
	}, 2000); 
	
function resive(){
	var uid = ${userId}
	$.ajax({
		type : 'post',
		url : ctx+"/message_findMessageJIluList.do",
		dataType : "json",
		success : function(data) {
			for (var i=0;i<data.length;i++)
			{
			//document.write(cars[i] + "<br>");
			//自己发的
			 if(data[i].sendUser.id == uid ){
				 $(".news_d").append(" <div class='mess_right'><div class='nameMe'><span class='messtime'>"+data[i].sendUser.userName+"</span>&nbsp;&nbsp;:&nbsp;&nbsp;<span class='messtime'>"+data[i].createTimeStr+"</span></div><div class='message_right_con'>"+data[i].content+"</div> </div>");
				 $("#content").val("");
				 $('.news_d').scrollTop( $('.news_d')[0].scrollHeight );
			 }else{//别人发的
				 $(".news_d").append("<div class='mess_left'><div><span class='messtime'>"+data[i].sendUser.userName+"</span>&nbsp;&nbsp;:&nbsp;&nbsp;<span class='messtime'>"+data[i].createTimeStr+"</span></div> <div class='message_left_con' >"+data[i].content+"</div></div>");
				 $("#content").val("");
				 $('.news_d').scrollTop( $('.news_d')[0].scrollHeight );
			 }
			
			}
			/* if(data.result == 2){
				alert("您积分不足，暂时不能聊天，请获取几分后再聊天！！！")
				return false;
			}else{
				$(".news_d").append(" <div class='mess_right'><div class='nameMe'><span class='messtime'>"+name+"</span>&nbsp;&nbsp;:&nbsp;&nbsp;<span class='messtime'>"+date+"</span></div><div class='message_right_con'>"+con+"</div> </div>");
				$("#content").val("");
				$('.news_d').scrollTop( $('.news_d')[0].scrollHeight );
			} */
		},
		error : function() {
			alert("error");
		}
	});
	
	
}
function resive2(){
	var uid = ${userId}
	 $(".news_d").html("");
	$.ajax({
		type : 'post',
		url : ctx+"/message_findMessageJIluList.do",
		dataType : "json",
		success : function(data) {
			for (var i=0;i<data.length;i++)
			{
			//document.write(cars[i] + "<br>");
			//自己发的
			 if(data[i].sendUser.id == uid ){
				 $(".news_d").append(" <div class='mess_right'><div class='nameMe'><span class='messtime'>"+data[i].sendUser.userName+"</span>&nbsp;&nbsp;:&nbsp;&nbsp;<span class='messtime'>"+data[i].createTimeStr+"</span></div><div class='message_right_con'>"+data[i].content+"</div> </div>");
				 $('.news_d').scrollTop( $('.news_d')[0].scrollHeight );
			 }else{//别人发的
				 $(".news_d").append("<div class='mess_left'><div><span class='messtime'>"+data[i].sendUser.userName+"</span>&nbsp;&nbsp;:&nbsp;&nbsp;<span class='messtime'>"+data[i].createTimeStr+"</span></div> <div class='message_left_con' >"+data[i].content+"</div></div>");
				 $('.news_d').scrollTop( $('.news_d')[0].scrollHeight );
			 }
			
			}
			/* if(data.result == 2){
				alert("您积分不足，暂时不能聊天，请获取几分后再聊天！！！")
				return false;
			}else{
				$(".news_d").append(" <div class='mess_right'><div class='nameMe'><span class='messtime'>"+name+"</span>&nbsp;&nbsp;:&nbsp;&nbsp;<span class='messtime'>"+date+"</span></div><div class='message_right_con'>"+con+"</div> </div>");
				$("#content").val("");
				$('.news_d').scrollTop( $('.news_d')[0].scrollHeight );
			} */
		},
		error : function() {
			alert("error");
		}
	});
	
	
}
});
</script>
</html>