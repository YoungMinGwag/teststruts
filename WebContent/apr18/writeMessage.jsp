<%@page import="kame.chap13.service.WirteMessageService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="message" class="kame.chap13.model.Message">
	<jsp:setProperty name="message" property="*"/>
</jsp:useBean>
<%
WirteMessageService writeService=WirteMessageService.getInstance();
writeService.write(message);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �޽��� ����</title>
</head>
<body>
���Ͽ� �޽����� ������ϴ�.<br/>
<a href="list.jsp">[��Ϻ���]</a>
</body>
</html>