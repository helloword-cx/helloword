<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!-- 评价界面 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctx }/resource/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/resource/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/resource/css/style.css" />
    <script type="text/javascript" src="${ctx }/resource/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx }/resource/js/jquery.sorted.js"></script>
    <script type="text/javascript" src="${ctx }/resource/js/bootstrap.js"></script>
    <script type="text/javascript" src="${ctx }/resource/js/ckform.js"></script>
    <script type="text/javascript" src="${ctx }/resource/js/common.js"></script>
	<title>管理后台登陆</title>
  <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
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

.table th,
.table td {
  padding: 8px;
  line-height: 20px;
  text-align: left;
  vertical-align: top;
  border-top: 1px solid #dddddd;
}
    </style>

</head>
<body>
<form action="jf_update.do" method="post" class="definewidth m20" id="hh">
<table class="table table-bordered table-hover definewidth m10">
<!-- private int type;
	private String miaoshu;
	private int fenshu; -->
	
    <tr>
        <td width="10%" class="tableleft">描述</td>
        <td><input type="text" name="miaoshu" id="name" value="${jf.miaoshu}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">分数</td>
        <td><input type="text" name="fenshu" id="fenshu" value="${jf.fenshu}"/>
        <input type="hidden" name="id" value="${jf.id}"></td>
    </tr>
    <tr>
        <td class="tableleft">类型</td>
        <td>
           <select name="type"> 
           <c:if test="${jf.type == 1}">
           <option value="1" selected="selected">注册</option>
           </c:if>
	         <c:if test="${jf.type == 2}">
               <option value="2" selected="selected">登陆</option>
             </c:if>   
              <c:if test="${jf.type == 3}">
              <option value="3" selected="selected">发说说</option>
             </c:if>
             <c:if test="${jf.type == 4}">
              <option value="4" selected="selected">上传照片</option>
             </c:if>      
	            <c:if test="${jf.type == 5}">
              <option value="5" selected="selected">好友评论</option>
             </c:if>  
	          <c:if test="${jf.type == 6}">
              <option value="6" selected="selected">添加好友</option>
             </c:if>  
	           <c:if test="${jf.type == 7}">
              <option value="7" selected="selected">投意见</option>
             </c:if>            
         </select>
         </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="button" class="btn btn-primary" id="save" type="button">保存</button> &nbsp;&nbsp;
        </td>
    </tr>
</table>
</form>
</body>
<script>
    $(function () { 
    	$("#save").click(function(){
    		$("#hh").submit();
    	});
    	

    });
</script>