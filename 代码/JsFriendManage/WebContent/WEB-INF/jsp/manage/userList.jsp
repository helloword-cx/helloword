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
<form class="form-inline definewidth m20" action="manage_userList.do" method="post">  
    用户名：
    <input type="text" name="userName" id="rolename"class="abc input-default" placeholder="" value="${userName1}">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
</form>
<table class="table table-bordered table-hover definewidth m10" align="center">
    <thead>
  <!--   private int id;
	    private int age;
	    private int sex;//1男2女
	    private String interest;//爱好
	    private String address;
	    private String userName;//真实名
	private String passWord;//密码
	private int isLh;//是否拉黑
	private int isDelete;//是否删除；1是2不是
	    private int jifen;//积分
	    private Date dqTime;//到期时间 -->
    <tr>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>积分</th>
        <th>等级</th>
        <th>爱好</th>
        <th>地址</th>
        <th>到期时间</th>
        <th>操作</th>
    </tr>
    </thead>
     <c:forEach items="${pagers.datas}" var="user" varStatus="l">
      <tr >
            <td align="center">${user.userName}</td>
            <td>
               <c:if test="${user.sex == 1 }">
                                               男
               </c:if>
               <c:if test="${user.sex == 2 }">
                                               女
               </c:if>
            </td>
            <td>${user.age}</td>
            <td>${user.jifen}</td>
            <td>${user.dengji}</td>
            <td>${user.interest}</td>
            <td>${user.address}</td>
            <td>${user.dqTime}</td>
            <td>
                <a id="update" href="${ctx}/manage_userPhotos.do?userId=${user.id}">查看</a>  
                 <a id="update" href="${ctx}/manage_delUse.do?userId=${user.id}">拉黑</a>
            </td>
        </tr>
     </c:forEach>
 </table>
 <div class="panel-foot text-center">
      <pg:pager  url="${ctx}/manage_userList.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
		<pg:param name="userName" value="${userName1}"/>
		
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