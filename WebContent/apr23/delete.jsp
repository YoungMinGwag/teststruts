<%@page import="kame.chap17.board.model.DeleteArticleService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="deleteRequest" class="kame.chap17.board.model.DeleteRequest"/>
<jsp:setProperty property="*" name="deleteRequest"/>
<%
	String viewPage=null;
	try{
		DeleteArticleService.getInstance().deleteArticle(deleteRequest);
		viewPage="delete_success.jsp";
	}catch(Exception ex){
		
		request.setAttribute("deleteException", ex);
		viewPage="delete_error.jsp";
	}
%>
<jsp:forward page="<%=viewPage %>"></jsp:forward>