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
<form action="grade_update.do" method="post" class="definewidth m20" id="hh">
<table class="table table-bordered table-hover definewidth m10">
<!-- private int type;
	private String miaoshu;
	private int fenshu; -->
	<!-- 	private int id;
	private int startMin;//开始分数
	private int endMax;//结束分数
	private String  name;
	private Date createTime;
	private int type;//类型 -->
    <tr>
        <td width="10%" class="tableleft">等级内容</td>
        <td><input type="text" name="name" id="name" value="${grade.name}"/>
        <input type="hidden" name="id" id="name" value="${grade.id}"/></td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">开始分数</td>
        <td><input type="text" name="startMin" id="startMin" value="${grade.startMin}"/></td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">结束分数</td>
        <td><input type="text" name="endMax" id="endMax" value="${grade.endMax}"/></td>
    </tr>
    <tr>
        <td class="tableleft">类型</td>
        <td>
           <select name="type"> 
           <c:if test="${grade.type == 1}">
           <option value="1" selected="selected">普通会员</option>
           </c:if>
	         <c:if test="${grade.type == 2}">
               <option value="2" selected="selected">黄金会员</option>
             </c:if>   
              <c:if test="${grade.type == 3}">
              <option value="3" selected="selected"> 白金会员</option>
             </c:if>
             <c:if test="${grade.type == 4}">
              <option value="4" selected="selected">钻石会员</option>
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