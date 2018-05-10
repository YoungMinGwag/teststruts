<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Cookie cookies=new Cookie("id","yougmin");
	cookies.setDomain("www.youngmin.gwag");
	response.addCookie(cookies);
	
	Cookie cookies1=new Cookie("only","onlycookie");
	response.addCookie(cookies1);
	
	Cookie cookies2= new Cookie("invalid","invalidcookie");
	cookies2.setDomain("javacan.tistory.com");
	response.addCookie(cookies2);
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	다음과 같이 쿠키를 생성했습니다. <br>
	<%=cookies.getName() %> =<%=cookies.getValue() %>
	[<%=cookies.getDomain() %>] <br>
	
	<%=cookies1.getName() %> =<%=cookies1.getValue() %>
	[<%=cookies1.getDomain() %>] <br>
	
	<%=cookies2.getName() %> =<%=cookies2.getValue() %>
	[<%=cookies2.getDomain() %>] <br>
</body>
</html>