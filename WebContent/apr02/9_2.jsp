<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쿠키 목록</title>
</head>
<body>

<%
	Cookie[] cookies =request.getCookies();
	if(cookies != null && cookies.length>0){
		 for(int i=0; i<cookies.length;i++){
%>
 	<%=cookies[i].getName() %> = 
 	<%=URLDecoder.decode(cookies[i].getValue(),"euc-kr") %><br>
 	
<% 
		 }
	}
	else{
%>
	쿠키가 존재하지 않습니다.
	
<%
	}
%> 
</body>
</html>