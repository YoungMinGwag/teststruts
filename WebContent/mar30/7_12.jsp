<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		int number=10;
	%>
	
	includer.jsp 에서 지정한 번호:<%=number %>
	
	<p>
	<%
		String datafolder="c://data";
	%>
	
	공통변수 DATAFOLDER="<%= datafolder %>"
</body>
</html>