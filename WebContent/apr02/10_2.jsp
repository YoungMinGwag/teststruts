<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.setAttribute("MEMBERID", "youngmin");
	session.setAttribute("NAME","������");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ǿ� ���� ����</title>
</head>
<body>
	���ǿ� ������ �����Ͽ����ϴ�. 
	NAME �� : <%=session.getValue("NAME") %> <br>
	���� ID : <%=session.getId() %><br>
	<%
	String name=(String)session.getAttribute("NAME");
	%>
	NAME �� : <%=name %>
	
</body>
</html>