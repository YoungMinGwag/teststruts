<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<%
		java.util.Calendar cal=java.util.Calendar.getInstance();
	%>
</head>
<body>
	������ 
	<%=cal.get(java.util.Calendar.YEAR) %>��
	<%=cal.get(java.util.Calendar.MONDAY)+1 %>��
	<%=cal.get(java.util.Calendar.DATE) %>��
</body>
</html>