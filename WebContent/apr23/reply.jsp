<!-- ��� ���� ��� ȭ��  ReplyArticleService Ŭ������ reply()�޼��带�̿��ؼ� �亯 �� ���-->

<%@page import="kame.chap17.board.model.ReplyArticleService"%>
<%@page import="kame.chap17.board.model.Article"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="replyingRequest" class="kame.chap17.board.model.ReplyingRequest"/>
<jsp:setProperty property="*" name="replyingRequest"/>
<%
	String viewPage=null;
	try{
		Article postedArticle=ReplyArticleService.getinstance().reply(replyingRequest);
		request.setAttribute("postedArticle", postedArticle);
		viewPage="reply_success.jsp";
	}catch(Exception ex){
		viewPage="reply_error.jsp";
		request.setAttribute("replyException", ex);
	}
%>
<jsp:forward page="<%=viewPage %>"></jsp:forward>