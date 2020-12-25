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
<table class="table table-bordered table-hover definewidth m10" align="center">
    <thead>
 <!-- private User sendUser;
	private Date createTime;
	private String content;
	private int isXS;//是否需要显示 1 是 2 否 -->
    <tr>
        <th>发送人</th>
        <th>发送时间</th>
        <th width="50%">发送内容</th>
        <th>操作</th>
    </tr>
    </thead>
     <c:forEach items="${pagers.datas}" var="ad" varStatus="l">
      <tr >
            <td align="center">${ad.sendUser.userName}</td>
             <td>${ad.createTime}</td>
             <td>${ad.content}</td>
            <%-- <td>
               <c:if test="${ad.sex == 1 }">
                                               男
               </c:if>
               <c:if test="${user.sex == 2 }">
                                               女
               </c:if>
            </td> --%>
            <td>
              <c:if test="${ad.isXS == 1 }">
                <a id="update" href="${ctx}/advice_fzsy.do?id=${ad.id}&isXS=2">取消放置首页</a> 
               </c:if>
                  <c:if test="${ad.isXS == 2 }">
                <a id="update" href="${ctx}/advice_fzsy.do?id=${ad.id}&isXS=1">放置首页</a> 
               </c:if>
                 <a id="update" href="${ctx}/advice_del.do?id=${ad.id}">删除</a>
            </td>
        </tr>
     </c:forEach>
 </table>
 <div class="panel-foot text-center">
      <pg:pager  url="${ctx}/advice_adviceList.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
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
</body>
<script>
    $(function () {
		$('#addnew').click(function(){
			window.location.href="${ctx}/userlogin/addNodeurl";
		 });
    });

    function del(id)
	{
		if(confirm("确定要删除吗？"))
		{
			url="${ctx}/userlogin/delnode?id="+id;
    		$.ajax({
    			//cache: true,
    			type : "post",
    			url : url,
    			dataType :'json',
    			async : false,
    			error : function(request) {
    				return false;
    			},
    			success : function(data) {
    				console.log(data)
    				if(data.status ==1){
						 alert(data.desc);
						 window.location.href="${ctx}/userlogin/Node";
					 }else{
						 alert(data.desc);
				 }
    			}
    		});		
		}
	}
</script>