<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=7"/>
<link href="<%= request.getContextPath()%>/public/css/bootstrap.min.css" rel="stylesheet" />
<link type="text/css" href="<%= request.getContextPath()%>/public/css/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
<link type="text/css" href="<%= request.getContextPath()%>/public/css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/public/css/font-awesome-ie7.min.css"/>
<link href="<%=request.getContextPath()%>/public/css/jquery.custom-scrollbar.css" rel="stylesheet" />

<link href="<%= request.getContextPath()%>/public/css/docs.css" rel="stylesheet"/>
<link href="<%= request.getContextPath()%>/public/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<script src="<%= request.getContextPath() %>/public/js/html5.js"></script>
<script src="<%= request.getContextPath() %>/public/js/jquery.custom-scrollbar.min.js"></script>
<title>
	<decorator:title/>
</title>
</head>
<body data-target=".bs-docs-sidebar" data-spy="scroll" style="margin: 0; padding: 0;">
	<header id="overview" class="jumbotron subhead">
		<div class="container">
			<h4>电商用户中心<sub>后台管理系统</sub></h4>
		</div>
	</header>
	<div class="container" style="min-height: 600px; height: auto;">
    	<div class="row">
	      	<div class="span9" style="margin:10px 0px;">
				<c:choose>
				<c:when test="${error == 1 }">
					<div class="alert alert-error" style="margin-bottom: 0px;width:910px;">
					 	<button type="button" class="close" data-dismiss="alert">&times;</button>
					 	<h4>错误!</h4>用户名或密码错误！
					</div>
				</c:when>
				</c:choose>
	      		<decorator:body/>
	      	</div>
      	</div>
	</div>
	<footer class="footer">
		<div class="container">
			<!-- <div style="font-size: 12px; line-height: 36px;">© 2013 subaonet.com - 版权所有</div>  -->
			<div style="font-size: 12px; line-height: 36px;">&nbsp;</div> 	
		</div>
	</footer>
<script src="<%= request.getContextPath() %>/public/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/public/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/public/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/public/js/google-code-prettify/prettify.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/public/js/jquery.validate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("ul.nav li").each(function(){
		if($(this).attr("id") == menuId){
			$(this).addClass("active");
		}else{
			$(this).removeClass("active");
		}
	});
});
</script>
</body>
</html>