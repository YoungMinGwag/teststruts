<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	include �� name �ĸ����� �� : <%= request.getParameter("name") %>
	
	<hr>
	
	<jsp:include page="7_9.jsp" flush="false">
	   <jsp:param name="name" value="������"/>
	
	</jsp:include>
	
	<hr/>
	
	include �� name �Ķ���� ��: <%= request.getParameter("name") %>
</body>
</html>