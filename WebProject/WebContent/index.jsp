<%@ page language="java" contentType="text/html; charset=utf-8" import="org.springframework.security.core.context.SecurityContextImpl"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT"); 
if(securityContextImpl != null){
%>
<%
	String redirectURL =  request.getContextPath()+"/common/list";
	response.sendRedirect(redirectURL);	
%>
<%
	} else {
%>
<%
	String redirectURL =  request.getContextPath()+"/auth/login";
	response.sendRedirect(redirectURL);
%>
<%
	}
%>
</body>
</html>