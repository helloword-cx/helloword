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
<!-- <form class="form-inline definewidth m20" action="index.html" method="post">  
     <button type="button" class="btn btn-success" id="addnew">新增机构</button>
</form> -->
<table class="table table-bordered table-hover definewidth m10" align="center">
    <thead>
 <!-- private int id;
	private String content;//发表内容，如果是文字就是内容，如果是图片就是url
	private User sayUser;//发表人
	private Date createTime;
	private int isDelete;//是否删除 1是 2否
	private int dzs;//如果是图片，点赞数
	private int type;//1说 2图片 -->
    <tr>
        <th>编号</th>
        <th>内容</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    </thead>
     <c:forEach items="${pagers.datas}" var="pho" varStatus="l">
      <tr >
            <td align="center">${pho.id}</td>
            <td><img src="${pho.content}" style="height: 225px;width: 225px" onload="javascript:DrawImage(this,205,125)"></td>
            <td>${pho.createTime}</td>
            <td>
                  <a id="update" href="${ctx}/manage_delsay.do?sayId=${pho.id}">删除</a>
            </td>
        </tr>
     </c:forEach>
 </table>
 <div class="panel-foot text-center">
      <pg:pager  url="${ctx}/manage_userPhotos.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
		<pg:param name="userId" value="${pagers.datas[0].sayUser.id}"/>
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