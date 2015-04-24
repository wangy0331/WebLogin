<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=7,IE=8,IE=9"/>
<link href="<%= request.getContextPath()%>/public/css/bootstrap.min.css" rel="stylesheet"/>
<link type="text/css" href="<%= request.getContextPath()%>/public/css/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
<link type="text/css" href="<%= request.getContextPath()%>/public/css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/public/css/font-awesome-ie7.min.css"/>
<link href="<%= request.getContextPath()%>/public/css/docs.css" rel="stylesheet"/>
<link href="<%= request.getContextPath()%>/public/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<link href="<%= request.getContextPath()%>/public/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/public/css/suda.css" rel="stylesheet" />
<!-- Load JS here for greater good =============================-->
<script src="<%= request.getContextPath() %>/public/js/html5.js"></script>
<script src="<%= request.getContextPath() %>/public/js/jquery-1.8.3.min.js"></script>
<script src="<%= request.getContextPath() %>/public/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/public/js/bootstrap-paginator.min.js"></script>
<script src="<%= request.getContextPath() %>/public/js/jquery.validate.js"></script>
<script src="<%= request.getContextPath() %>/public/js/project-common.js"></script>
<script src="<%= request.getContextPath() %>/public/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%= request.getContextPath() %>/public/js/bootstrap-datetimepicker.zh-CN.js"></script>

<script src="<%= request.getContextPath() %>/public/js/ckeditor/ckeditor.js"></script>


<title>
	<decorator:title/>
</title>
</head>
<body data-target=".navbar-collapse" data-spy="scroll" style="margin: 0; padding: 0;">
	<header id="overview" class="jumbotron subhead">
		<div class="container">
			<div style="float:left; width: 40%;">
				<h4>电商用户中心<sub>后台管理系统</sub></h4>
			</div>
			<div style="float:right; width: 59%; margin-top: 12px;">
				<button type="button" class="logout" name="logout" onclick="logoutConfirm();">
					退出
				</button>
				<span style="float: right;font-size: 24px;line-height: 32px;margin-right: 12px;text-transform:capitalize;">
					<sec:authentication property="principal.Username"/> 
				</span>
			</div>
		</div>
	</header>
	<div class="container" style="min-height: 600px; height: auto;">
    	<div class="row">
			<div class="span3 bs-docs-sidebar">
		    	<ul class="nav nav-list bs-docs-sidenav" style="width: 220px;">
		    		<sec:authorize ifAnyGranted="ROLE_ADMIN">
						<li>
			    			<a class="navbar-toggle" data-target="#bookId" href="#"><i class="icon-chevron-right"></i>厂家验证</a>
				    		<ul class="nav nav-list collapse" id="bookId"> 
					        	<li id="factoryList" class="bottom_line"><a href="<%= request.getContextPath() %>/validate/factoryList">厂家列表</a></li>
				    		</ul>
				   		</li>
					</sec:authorize>
		    	
		    	
		    		<!-- 
		    		<li>
		    			<a class="navbar-toggle" data-target="#bookId" href="#"><i class="icon-chevron-right"></i>书库管理</a>
			    		<ul class="nav nav-list collapse" id="bookId"> 
				        	<li id="addBook" class="bottom_line"><a href="<%= request.getContextPath() %>/book/showAddBook">书库添加</a></li>
				        	<li id="listBook" class="bottom_line"><a href="<%= request.getContextPath() %>/book/getListBook">书库列表</a></li>
			    		</ul>
			    	</li>
			    	<li>
		    			<a class="navbar-toggle" data-target="#noticeId" href="#"><i class="icon-chevron-right"></i>通知管理</a>
			    		<ul class="nav nav-list collapse" id="noticeId"> 
				        	<li id="addNotice" class="bottom_line"><a href="<%=request.getContextPath()%>/notice/showAddNotice">通知添加</a></li>
				        	<li id="listNotice" class="bottom_line"><a href="<%=request.getContextPath()%>/notice/getListNotice">通知列表</a></li>
			    		</ul>
			    	</li>
			    	<li>
		    			<a class="navbar-toggle" data-target="#specialId" href="#"><i class="icon-chevron-right"></i>专题管理</a>
			    		<ul class="nav nav-list collapse" id="specialId"> 
				        	<li id="addspecial" class="bottom_line"><a href="<%=request.getContextPath()%>/special/showAddSpecial">专题添加</a></li>
				        	<li id="listspecial" class="bottom_line"><a href="<%=request.getContextPath()%>/special/getListSpecial">专题列表</a></li>
			    		</ul>
			    	</li>
			    	<li>
		    			<a class="navbar-toggle" data-target="#coursewareId" href="#"><i class="icon-chevron-right"></i>课件管理</a>
			    		<ul class="nav nav-list collapse" id="coursewareId"> 
				        	<li id="addCourseware" class="bottom_line"><a href="<%=request.getContextPath()%>/courseware/showAddCourseware">课件添加</a></li>
				        	<li id="listCourseware" class="bottom_line"><a href="<%=request.getContextPath()%>/courseware/getListCourseware">课件列表</a></li>
			    		</ul>
			    	</li>
			    	-->
				</ul>
				
			</div>
	      	<div class="span9">
	      		<div style="margin:10px 0px;">
					<c:if test="${FAIL_MSG != null }">
		      			<div class="alert alert-error" style="margin-bottom: 0px;width:910px;">
					    	<button type="button" class="close" data-dismiss="alert">&times;</button>
					    	<h4>错误!</h4>${FAIL_MSG}
					  	</div>
					</c:if>  
		      		<c:if test="${SUCC_MSG != null}">
				        <div class="alert alert-success">
				    		<button type="button" class="close" data-dismiss="alert">&times;</button>
				    		${SUCC_MSG}
				  		</div>
			  		</c:if>
		  		</div>
	      		<decorator:body/>
	      	</div>
      	</div>
	</div>
	<footer class="footer">
		<div class="container">
			<div style="font-size: 12px; line-height: 36px;">&nbsp;</div>
			<!-- <div style="font-size: 12px; line-height: 36px;">© 2013 subaonet.com - 版权所有</div> -->	
		</div>
	</footer>
<div id="deleteModalConfirm" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">删除确认</h3>
	</div>
	<div class="modal-body">
		<p>是否确定要删除该图片？</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		<button class="btn btn-primary" id="confirmDelBtnId">确定</button>
	</div>
</div>

<div id="deleteModalConfirmStart" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">删除确认</h3>
	</div>
	<div class="modal-body">
		<p>是否确定要删除该图片？</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		<button class="btn btn-primary" id="confirmDelBtnIdStart">确定</button>
	</div>
</div>

<div id="deleteModalConfirmStart2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">删除确认</h3>
	</div>
	<div class="modal-body">
		<p>是否确定要删除该文件？</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		<button class="btn btn-primary" id="confirmDelBtnIdStart2">确定</button>
	</div>
</div>

<div id="deleteModalConfirmStart5" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">删除确认</h3>
	</div>
	<div class="modal-body">
		<p>是否确定要删除该图片？</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		<button class="btn btn-primary" id="confirmDelBtnIdStart5">确定</button>
	</div>
</div>

<div id="logoutModalConfirm" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="logoutModalLabel">退出确认</h3>
	</div>
	<div class="modal-body">
		<p>是否确定要退出当前登录？</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		<button class="btn btn-primary" id="logoutConfirmId" onclick="logout();">确定</button>
	</div>
</div>
<script type="text/javascript">
function logoutConfirm(){
	$('#logoutModalConfirm').modal('show');
}
function logout(){
	window.location.href="<%= request.getContextPath() %>/auth/logout";
}

function userList(){
	window.open("<%= request.getContextPath() %>/admin/getListWebUsers");
}

var urlBase = "<%= request.getContextPath() %>";
$(document).ready(function(){
	$(".nav.nav-list li a.navbar-toggle").click(function(event) {
		var clickDt = $(this).attr('data-target');
		$(".nav.nav-list li a.navbar-toggle").each(function(index, obj){
			var dataT = $(obj).attr('data-target');
			if(clickDt == dataT){
				$(dataT).addClass('in');
				$(obj).addClass('active');
				$(this).children("i").addClass("icon-chevron-down");
				$(this).children("i").removeClass("icon-chevron-right");
			}else{
				if($(dataT).hasClass('in')){
					$(dataT).removeClass('in');
					$(obj).removeClass('active');
					if($(obj).children("i").hasClass("icon-chevron-down")){
						$(obj).children("i").removeClass("icon-chevron-down");
						$(obj).children("i").addClass("icon-chevron-right");
					}
				}
			}
		});
	});
	$("ul.collapse li").each(function(){
		if($(this).attr("id") == menuId){
			$(this).addClass("active");
			var id = $(this).parent().attr('id');
			id= '#'+id;
			$(".nav.nav-list li a.navbar-toggle").each(function(index, obj){
				var dataT = $(obj).attr('data-target');
				if(id == dataT){
					$(dataT).addClass('in');
					$(obj).addClass('active');
					$(obj).children("i").removeClass("icon-chevron-right");
					$(obj).children("i").addClass("icon-chevron-down");
				}
			});
		}else{
			$(this).removeClass("active");
		}
	});
});
</script>
</body>
</html>