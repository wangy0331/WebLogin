<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电商注册</title>
</head>
<body>
<h3>电商注册</h3>
<form:form method="POST" commandName="user" cssClass="form-horizontal">
	<div class="control-group">
		<label class="control-label" for="userName">账号</label>
		<div class="controls">
			<form:input path="username" autocomplete="off"/>
			<form:errors path="username" cssClass="text-error" element="label"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="password">密码</label>
		<div class="controls">
			<form:password path="password" autocomplete="off"/>
			<form:errors path="password" cssClass="text-error" element="label"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="name">名称</label>
		<div class="controls">
			<form:input path="name" autocomplete="off"/>
			<form:errors path="name" cssClass="text-error" element="label"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="address">地址</label>
		<div class="controls">
			<form:input path="address" autocomplete="off"/>
			<form:errors path="address" cssClass="text-error" element="label"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="contact">联系人</label>
		<div class="controls">
			<form:input path="contact" autocomplete="off"/>
			<form:errors path="contact" cssClass="text-error" element="label"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="phone">联系电话</label>
		<div class="controls">
			<form:input path="phone" autocomplete="off"/>
			<form:errors path="phone" cssClass="text-error" element="label"/>
		</div>
	</div>
	
	<div class="">
	<div id="files4">
		<form:hidden path="logo" id="logo" name="logo"/>
		<input type="button" name="upload" class="btn newWindowStart" id="uploadMulti" value="添加Logo"/>
	</div>
</div>
<div class="control-group">
	<label class="control-label" for="tags" >&nbsp;</label>
	<div class="" style="margin-top: 12px;">
		<div class="row-fluid">
        	<ul id="imgesListId" class="thumbnails">
			</ul>
		</div>
	</div>
</div>
<div class="">
	<div id="files5">
		<form:hidden path="business" id="business" name="business"/>
		<input type="button" name="upload" class="btn newWindowStart" id="uploadMulti" value="添加营业执照"/>
	</div>
</div>
<div class="control-group">
	<label class="control-label" for="tags" >&nbsp;</label>
	<div class="" style="margin-top: 12px;">
		<div class="row-fluid">
        	<ul id="imgesListId" class="thumbnails">
			</ul>
		</div>
	</div>
</div>
<div class="control-group">
		<div class="">
			<input type="button" name="approve" class="btn btn-primary" value="注册" onclick="addUser();"/>
		</div>
</div>	
</form:form>
<script src="<%= request.getContextPath() %>/public/js/jquery-1.8.3.min.js" type="text/javascript"></script>  
<script type="text/javascript">
function addUser(){
	$("#user").attr("action", "<%= request.getContextPath() %>/auth/addRegister");
	$("#user").submit();
}
</script>
</body>
</html>