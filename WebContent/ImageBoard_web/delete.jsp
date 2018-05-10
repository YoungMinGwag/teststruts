<%@page import="ImageBoard.Theme"%>
<%@page import="ImageBoard.ThemeManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page errorPage="error_view.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ۻ���</title>
</head>
<body>
<%
	String themeId =request.getParameter("id");
	ThemeManager manager=ThemeManager.getInstance();
	Theme oldTheme =manager.select(Integer.parseInt(themeId));
%>
<c:set var="oldTheme" value="<%=oldTheme %>"/>
<c:choose>
	<c:when test="${empty oldTheme }">
	<script>
		alert("���� �������� �ʽ��ϴ�.");
		location.href="list.jsp";
	</script>
	</c:when>
	
	<c:when test="${oldTheme.password !=param.password }">
	<script>
		alert("��ȣ�� �ٸ��ϴ�.");
		history.go(-1);
	</script>
	</c:when>
	
	<c:when test="${oldTheme.password ==param.password }">
	<%
		manager.delete(oldTheme.getId());
	%>
	<script>
		alert("���� �����Ͽ����ϴ�.");
		location.href="list.jsp";
	</script>
	</c:when>
</c:choose>

</body>
</html>