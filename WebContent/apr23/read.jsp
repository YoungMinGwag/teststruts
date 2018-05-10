<!--ReadArticleService를 이용해서 게시글 데이터를 읽어온 뒤 read_view.jsp를 통해서 결과를 보여줌 -->


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