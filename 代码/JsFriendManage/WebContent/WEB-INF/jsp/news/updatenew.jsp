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


<form action="news_update.do" method="post" class="definewidth m20" id="hh">
<table class="table table-bordered table-hover definewidth m10">
   <tr>
        <td width="10%" class="tableleft">标题</td>
        <td><input type="text" name="title" id="title" value="${news.title}"/></td>
    </tr>
</table>
<!-- private String content;
	private Date createTime;
	private String title; -->
<div class="form-group" style="margin-left: 30px;">
          <input type="hidden" name="id" value="${news.id}">
		    <div class="label"><label for="remark_txt_1"><strong>新闻发布:</strong></label></div><br/>
		    <div class="field">
		     	<!-- 加载编辑器的容器 -->
	        <script id="remark_txt_1" name="content" type="text/plain" style="width:1100px;height:500px;">${news.content}</script>
		    <!-- 实例化编辑器 -->
		    <script type="text/javascript">
		        var editor = UE.getEditor('remark_txt_1');
		    </script> 
		    </div>
</div>
           <div style="width: 100px;margin-left:540px;">
            <button type="button" class="btn btn-primary" id="save" type="button">保存</button> &nbsp;&nbsp;
           </div>
</form>
</body>
<script>
    $(function () { 
    	$("#save").click(function(){
    		$("#hh").submit();
    	});
    	

    });
</script>