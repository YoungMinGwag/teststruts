<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.setAttribute("MEMBERID", "youngmin");
	session.setAttribute("NAME","곽영민");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>세션에 정보 저장</title>
</head>
<body>
	세션에 정보를 저장하였습니다. 
	NAME 값 : <%=session.getValue("NAME") %> <br>
	세션 ID : <%=session.getId() %><br>
	<%
	String name=(String)session.getAttribute("NAME");
	%>
	NAME 값 : <%=name %>
	
</body>
</html>