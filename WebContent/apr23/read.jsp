<!--ReadArticleService�� �̿��ؼ� �Խñ� �����͸� �о�� �� read_view.jsp�� ���ؼ� ����� ������ -->


<%@page import="kame.chap17.board.model.ReadArticleService"%>
<%@page import="kame.chap17.board.model.Article"%>
<%@page import="kame.chap17.board.model.ArticleNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int articleId=Integer.parseInt(request.getParameter("articleId"));
	String viewPage=null;
	try{
		Article article =ReadArticleService.getInsteance().readArticle(articleId);
		request.setAttribute("article",article);
		viewPage="read_view.jsp";
	}catch(ArticleNotFoundException ex){
		viewPage="article_not_found.jsp";
	}
%>
<jsp:forward page="<%=viewPage %>"></jsp:forward>