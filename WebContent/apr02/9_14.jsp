<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	response.addCookie(CookieBox.createCookie("LOGIN", "","/",-1));
	response.addCookie(CookieBox.createCookie("ID","", "/",-1));
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α׾ƿ�</title>
</head>
<body>
�α׾ƿ� �Ͽ����ϴ�.
</body>
</html>