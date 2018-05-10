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
<title>방명록 메시지 삭제함</title>
</head>
<body>
<% if(!invalidPassowrd){ %>
메시지를 삭제 하였습니다.
<%} else{ %>
입력한 암호가 올바르지 않습니다. 암호를 확인해.
<%} %>
<br/>
<a href="list.jsp">[목록 보기]</a>
</body>
</html>