<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MemberInfo mi=new MemberInfo();
	mi.setId("youngmin");
	mi.setName("곽영민");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	이름 - <%=mi.getName() %> <br>
	아이디- <%=mi.getId() %>
</body>
</html>