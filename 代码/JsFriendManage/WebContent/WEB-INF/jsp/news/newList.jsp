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
<form class="form-inline definewidth m20" action="news_newList.do" method="post">  
  <button type="button" class="btn btn-success" id="addnew">新闻发布</button>   标题：
    <input type="text" name="titles" id="rolename"class="abc input-default" placeholder="" value="${titles}">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
</form>
    
<table class="table table-bordered table-hover definewidth m10" align="center">
    <thead>
   <!--  private int id;
	private String content;
	private Date createTime;
	private String title; -->
    <tr>
        <th>编号</th>
        <th>标题</th>
        <th>发布时间</th>
         <th>操作</th>
    </tr>
    </thead>
     <c:forEach items="${pagers.datas}" var="n" varStatus="l">
      <tr >
            <td align="center">${n.id}</td>
            <td>${n.title}</td>
            <td>${n.createTime}</td>
            <td>
                   <a id="update" href="${ctx}/news_updatenew.do?id=${n.id}">修改</a>
                   <a id="update" href="${ctx}/news_del.do?id=${n.id}">删除</a>
            </td>
        </tr>
     </c:forEach>
     <tr>
     <td colspan="4">
      <div class="panel-foot text-center">
      <pg:pager  url="${ctx}/news_newList.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
		<pg:param name="titles" value="${titles}"/>
		
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
     
     </td>
     </tr>
 </table>
 
</body>
<script>
    $(function () {
		$('#addnew').click(function(){
			window.location.href="${ctx}/news_addnew.do";
		 });
    });

</script>