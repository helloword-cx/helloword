<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>首页</title>
<link href="${ctx}/resource/css/public.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/css/message.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/jquery.Xslider.js"></script>
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
	$("#pinglun").click(function(){
		$("#pinglunform").submit();
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
a{
color: #4095ce; font-size: 14px;text-align: right;
}
body{
font-size: 15px;
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
	 
	 <!--  -->
	 <div class="mian">
	  <div class="content" style="font-size: 20px;background: #fa8f00;height: 40px;color: white;font-weight: bold;padding-left: 5px;text-align: center;line-height:40px">好友动态</div>
	  <div class="matter">
        <div class="content2">
             	 <form action="sayMood_commentShuo.do" method="post" id="pinglunform">
		             <div class="inputLong"><textarea name="content" cols="" rows=""></textarea></div>
		             <div class="commentFunc">还可以输入 2000 个字符 &nbsp;&nbsp;<a href="#" id="pinglun">
		             <input type="submit" value="发表说说">
		             </a></div>
             </form>
             </div>
      <div class="liuyan">
            <div class="recListS borderTop">
     	   <ul>
         	<li>
                 <div class="layout recListLeft f14">
                 
                 <!-- 一条说说 -->
                 	<c:forEach items="${sts}" var="data" varStatus="l">
                     <div class="">
						<div class="vm bold c999">
	                   		<a class="c4095ce" target="_blank" href="#">${data.sayMood.sayUser.userName}</a>	
	                   		<span>${data.sayMood.createTime}</span>
	                   	</div>
	                   	<!-- 如果当前登陆id == shuoshuo 发表人id可以删除 -->
	                   	<c:if test="${data.sayMood.sayUser.id == userId}">
	                   		<div style="float: right;"><a href="${ctx}/sayMood_delTxt.do?id=${data.sayMood.id}"><span style="color: red">删除</span></a></div>
	                   	</c:if>
                       <p class="recBox">${data.sayMood.content}</p>
                       <!-- 评论 一级 -->
                       <c:forEach items="${data.pingluHuifu}" var="yiji" varStatus="u">
	                       <div class="pinglun" style="">
	                           <div><span style="color: #4095ce;font-size: 14px;font-weight: bold;">${yiji.com.comUser.userName}</span>:
	                           <span>${yiji.com.content}</span>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                              <a onclick="huifuta('${yiji.com.sayMood.id}','${yiji.com.id}')">回复他</a><br/>
	                              <!-- 更多子级评论 -->
	                               <c:forEach items="${yiji.datas}" var="ziji" varStatus="u2">
	                                 <span style="color: #4095ce; font-size: 14px;font-weight: bold;"> ${ziji.comUser.userName } </span>
	                                 &nbsp;回复&nbsp;
	                                 <span  style="color: #4095ce; font-size: 14px;font-weight: bold;">${ziji.sayUser.userName }</span>：
	                                 <span> ${ziji.content }</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                 <a onclick="huifuta('${ziji.sayMood.id}','${ziji.id}')">回复他</a><br/>
	                               </c:forEach>
	                              <!-- 更多子级评论end -->
	                       </div>
                        </c:forEach>
                       <!-- 一级评论结束 -->
                       <div class="mblFunc mt10 f12 downWh">
                        <a href="#" style="color:#4095ce" onclick="huifu('${data.sayMood.id}','${l.index+1}')">回复</a>
                       </div>
                       <!-- 提交框 -->
                       <div class="${data.sayMood.id}_shuo">
                       
                       </div>
                     </div>
                    </c:forEach>
                      <!-- 一条说说end -->
                 </div>
             </li> 
         </ul>
      </div>
    </div>
   </div>
   
    <!-- 分页 -->
                
                 <div class="panel-foot text-center">
      <pg:pager  url="${ctx}/sayMood_shuoshuoList.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
		<pg:last>  
			共${pagers.total}记录,共${pageNumber}页,  
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
 <!-- 中间 -->
	 
     <div class="wrap_banner">
     	<div class="banner"></div>
     </div>
     

<div class="bottomwrap">
	<div class="bottom">
    <div class="wenzi">618团队作品<br />
</div>
    </div>
</div>
</body>
<script type="text/javascript">
function huifu(sayId,index){
	$("."+sayId+"_shuo").html("<form action='comment_huifutext.do' method='post' id='huifuformgg'><div class='inputLong'><textarea  name='content' style='width: 90%;'></textarea></div><input type='hidden' name='sayMoodId' value='"+sayId+"'><input style='float: right; margin-right: 70px' type='submit' name='评论'></form>");
            

}; 
function huifuta(sayId,comId){
	$("."+sayId+"_shuo").html("<form action='comment_huifuhft.do' method='post' id='huifuformgg'><div class='inputLong'><textarea  name='content' style='width: 90%;'></textarea></div><input type='hidden' name='sayMoodId' value='"+sayId+"'> <input type='hidden' name='id' value='"+comId+"'><input type='submit' name='评论'></form>");
};
</script>
</html>