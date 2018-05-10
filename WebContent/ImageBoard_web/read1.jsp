<%@page import="ImageBoard.ContentDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="soldesk.board.CommentDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="cmt" scope="page" class="ImageBoard.ContentDataBean">
	<jsp:setProperty name="cmt" property="*"/>
</jsp:useBean>
<%
	ContentDBBean comt=ContentDBBean.getInstance();
	cmt.setReg_date(new Timestamp(System.currentTimeMillis()));
	cmt.setIp(request.getRemoteAddr());
	comt.insertComment(cmt);

	String url="read_view.jsp";
	response.sendRedirect(url);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>