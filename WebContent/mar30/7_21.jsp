<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String code=request.getParameter("code");
	String viewPageURI=null;
	
	if(code.equals("A")){
		viewPageURI="a.jsp";
	}
	else if(code.equals("B")){
		viewPageURI="/mar30/aa/b.jsp";
	}
%>

	<jsp:forward page="<%= viewPageURI %>" />