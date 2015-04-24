<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证厂家</title>
</head>
<body>
<h3>厂家列表</h3>
<form:form method="POST" commandName="userForm" cssClass="form-horizontal">
<input type="hidden" name="id" id="id">
<input type="hidden" name="status" id="status">
<table class="table table-bordered  table-hover" style="word-wrap: break-word; word-break: break-all;">
		<thead>
			<tr style="background-color: #ccc;">
				<th style="width: 10%;">账号</th>
				<th style="width: 10%;">厂家名称</th>
				<th style="width: 11%;">联系人</th>
				<th style=" width: 12%; ">电话</th>
				<th style="width: 15%;">地址</th>
				<th style="width: 20%;">是否认证</th>
				<th style="width: 16%;">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items='${replys}'>
			<tr>
				<td>${user.username}</td>
				<td>${user.name}</td>
				<td>${user.contact}</td>
				<td>${user.phone}</td>
				<td>${user.address}</td>
				<td>
					<c:choose>
						<c:when test="${user.userRole == 1}">
							未审核
						</c:when>
						<c:when test="${user.userRole == 3}">
							通过
						</c:when>
						<c:when test="${user.userRole == 0}">
							拒绝
						</c:when>
					</c:choose>
				</td>
				<td>
					<input type="button" name="approve" class="btn btn-primary" value="通过" onclick="verifyReply('${user.id}', 3);"/>
					<input type="button" name="approve" class="btn btn-danger" value="拒绝" onclick="verifyReply('${user.id}', 0);"/>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="paginationId"></div>
</form:form>
<script type="text/javascript">
var menuId = "factoryList";

function verifyReply(id, status){
	$("#id").val(id);
	$("#status").val(status);
	//$("#replyMsgId").val(msgId);
	//$("#replyOldStatus").val(oldStatus);
	$("#userForm").attr("action", "<%= request.getContextPath() %>/validate/verifyReply");
	$("#userForm").submit();
}

$('#paginationId').bootstrapPaginator({
    currentPage: ${currentPage},
    totalPages: ${totalPages},
    alignment: "right",
    pageUrl: function(type, page, current){
        return "${url}"+page;
    }
});
</script>
</body>
</html>