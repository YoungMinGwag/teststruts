<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MemberInfo mi=new MemberInfo();
	mi.setId("youngmin");
	mi.setName("������");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	�̸� - <%=mi.getName() %> <br>
	���̵�- <%=mi.getId() %>
</body>
</html>