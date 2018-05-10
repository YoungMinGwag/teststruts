<%@page import="kame.chap17.board.model.Article"%>
<%@page import="kame.chap17.board.model.UpdateArticleService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="updateRequest" class="kame.chap17.board.model.UpdateRequest"/>
<jsp:setProperty property="*" name="updateRequest"/>
<%
	String viewPage=null;
	try{
		Article article=UpdateArticleService.getInstance().update(updateRequest);
		request.setAttribute("updatedArticle", article);
		viewPage="update_success.jsp";
	}catch(Exception ex){
		
		request.setAttribute("updateException", ex);
		viewPage="update_error.jsp";
	}
%>
<jsp:forward page="<%=viewPage %>"></jsp:forward>