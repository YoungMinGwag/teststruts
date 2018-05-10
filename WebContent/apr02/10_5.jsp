<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 	String memberid=(String) session.getAttribute("MEMBERID");
	boolean login =memberid==null ?false:true;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인여부 검사</title>
</head>
<body>
	<%
		if(login){
	%>
	아이디 "<%=memberid %>"로 로그인한 상태
	<%
		} 
		else{
	%>
	로그인하지 않은 상태
	<%
		}
	%>
</body>
</html>