<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	CookieBox cookies =new CookieBox(request);
	boolean login =cookies.exists("LOGIN")&&cookies.getValue("LOGIN").equals("SUCCESS");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	 if(login){
	%>
	���̵� "<%=cookies.getValue("ID") %>"�� �α����� ����
	<%
	 } 
	 else {
	%>
	�α��� ���� ���� ���� 
	<%
	 }
	%>
</body>
</html>