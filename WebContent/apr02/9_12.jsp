<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id=request.getParameter("id");
	String password = request.getParameter("password");
	
	if(id.equals(password)){
		response.addCookie(CookieBox.createCookie("LOGIN","SUCCESS","/",-1));
	
    response.addCookie(CookieBox.createCookie("ID",id,"/",-1));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 여부 검사</title>
</head>
<body>
 로그인에 성공했습니다. 
 
</body>
</html>

<%
	}
	else{
%>
	<script>

		alert("로그인에 실패했습니다.");
		history.go(-1);
		</script>
<%
	}
%>
