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
    <script type="text/javascript" src="${ctx}/resource/js/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctx}/resource/js/ueditor/ueditor.all.min.js"></script>
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
<div class="form-group" style="width: 1150px;margin: 0 auto;">
		    <div class="label"><label for="remark_txt_1"><strong>新闻发布:</strong></label></div><br/>
		    <div class="field">
		     	<!-- 加载编辑器的容器 -->
	        <script id="remark_txt_1" name="remark" type="text/plain" style="width:1100px;height:500px;">${t1['plan']['remark'] }</script>
		    <!-- 实例化编辑器 -->
		    <script type="text/javascript">
		        var editor = UE.getEditor('remark_txt_1');
		    </script> 
		    </div>
</div>


<form action="grade_add.do" method="post" class="definewidth m20" id="hh">
<table class="table table-bordered table-hover definewidth m10">
<!-- private int type;
	private String miaoshu;
	private int fenshu; -->
    <%-- <tr>
        <td width="10%" class="tableleft">等级内容</td>
        <td><input type="text" name="name" id="name" value="${grade.name}"/></td>
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
           <option value="1">普通会员</option>
               <option value="2">黄金会员</option>
              <option value="3"> 白金会员</option>
              <option value="4">钻石会员</option>
         </select>
         </td>
    </tr> --%>
    
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