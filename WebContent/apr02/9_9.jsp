<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<% 
	response.addCookie(CookieBox.createCookie("name","������"));
	response.addCookie(CookieBox.createCookie("id", "youngminGwag","/KH10/apr02/",-1));

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ����</title>
</head>
<body>
CookieBox�� ����Ͽ� ��Ű ����
</body>
</html>