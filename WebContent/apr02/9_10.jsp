<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	CookieBox cookiebox=new CookieBox(request);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
name  ��Ű =<%=cookiebox.getValue("name") %><br>
<% if (cookiebox.exists("id")) {%> 
id ��Ű = <%=cookiebox.getValue("id") %> <br>
<% } %> 
</body>
</html>