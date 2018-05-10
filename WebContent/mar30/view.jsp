<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String code=request.getParameter("code");
	String viewPageURI=null;
	
	if(code.equals("A")){
		viewPageURI="/aa/a.jsp";
	}
	else if(code.equals("B")){
		viewPageURI="/aa/b.jsp";
	}
%>

	<jsp:forward page="<%= viewPageURI %>" />