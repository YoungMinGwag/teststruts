<%@page import="kame.chap13.service.InvalidMessagePassowrdException"%>
<%@page import="kame.chap13.service.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
int messageId=Integer.parseInt(request.getParameter("messageId"));
String password=request.getParameter("password");
boolean invalidPassowrd=false;
try{
	DeleteMessageService deleteService=DeleteMessageService.getInstance();
	deleteService.deleteMessage(messageId, password);
	
}catch(InvalidMessagePassowrdException ex){
	invalidPassowrd=true;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �޽��� ������</title>
</head>
<body>
<% if(!invalidPassowrd){ %>
�޽����� ���� �Ͽ����ϴ�.
<%} else{ %>
�Է��� ��ȣ�� �ùٸ��� �ʽ��ϴ�. ��ȣ�� Ȯ����.
<%} %>
<br/>
<a href="list.jsp">[��� ����]</a>
</body>
</html>