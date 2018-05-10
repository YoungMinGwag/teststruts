<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	Calendar cal=Calendar.getInstance();
%>
</head>
<body>
<b>오늘은</b>
<%=cal.get(Calendar.YEAR) %><b>년</b>
<%=cal.get(Calendar.MARCH)+1 %><b>월</b>
<%=cal.get(Calendar.DATE) %><b>일</b>
<br/>입니다.
</body>
</html>