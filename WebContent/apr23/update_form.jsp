<%@page import="kame.chap17.board.model.ArticleNotFoundException"%>
<%@page import="kame.chap17.board.model.ReadArticleService"%>
<%@page import="kame.chap17.board.model.Article"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String viewPage=null;
try{
	int articleId=Integer.parseInt(request.getParameter("articleId"));
	Article article=ReadArticleService.getInsteance().getArticle(articleId);
	viewPage="update_form_view.jsp";
	request.setAttribute("article",article);
	
}catch(ArticleNotFoundException ex){
	viewPage="article_not_found.jsp";
}
%>
<jsp:forward page="<%=viewPage %>"></jsp:forward>