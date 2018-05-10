<%@page import="java.sql.Timestamp"%>
<%@page import="ImageBoard.ContentDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%
   	request.setCharacterEncoding("euc-kr");
   %>
<jsp:useBean id="cmt" scope="page" class="ImageBoard.ContentDataBean">
	<jsp:setProperty name="cmt" property="*"/>
</jsp:useBean>
<%
	ContentDBBean comt =ContentDBBean.getInstance();
	cmt.setReg_date(new Timestamp(System.currentTimeMillis()));
	cmt.setIp(request.getRemoteAddr());

	comt.insertComment(cmt);
	
	String content_num=request.getParameter("content_num");
	String p_num=request.getParameter("p_num");
	String url="read_view.jsp?id="+content_num+"&pageNum="+p_num;
	response.sendRedirect(url);
	
%>