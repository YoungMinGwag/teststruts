<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<c:choose>
		<c:when test="${param.type=='cafe'}">
			<c:import url="http://search.daum.net/search">
				<c:param name="w" value="cafe"/>
				<c:param name="q" value="라이브" />
			</c:import>
		</c:when>
	
	<c:when test="${param.type == 'youtube'}">
		<c:import url="https://www.youtube.com/search">
			<c:param name="search_query" value="ryu" />
		</c:import>
	</c:when>
	<c:otherwise>
		<c:import url="use_import_tag_help.jsp">
			<c:param name="message" value="선택해주세요" />
		</c:import>
	</c:otherwise>
	</c:choose>
</body>
</html>