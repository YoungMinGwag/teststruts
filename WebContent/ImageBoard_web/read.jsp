<%@page import="java.sql.Timestamp"%>
<%@page import="ImageBoard.ContentDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:forward page="template.jsp">
	<jsp:param name="CONTENTPAGE" value="read_view.jsp"/>
</jsp:forward>
