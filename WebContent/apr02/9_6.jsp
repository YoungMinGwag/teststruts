<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 	Cookie cookies =new Cookie("path1",URLEncoder.encode("경로:/KH10/apr02/path1","euc-kr"));
	cookies.setPath("/KH10/apr02/path1");
	response.addCookie(cookies);
	
	Cookie cookies0 =new Cookie("path2",URLEncoder.encode("경로:","euc-kr"));
	response.addCookie(cookies0);
		
	Cookie cookies1 =new Cookie("path3",URLEncoder.encode("경로:/","euc-kr"));
	cookies1.setPath("/");
	response.addCookie(cookies1);
	
	Cookie cookies2 =new Cookie("path4",URLEncoder.encode("경로:/KH10/apr02/path2","euc-kr"));
	cookies2.setPath("/KH10/apr02/path2");
	response.addCookie(cookies2);
	
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쿠키 경로 지정</title>
</head>
<body>
다음과 같이 쿠키를 생성했습니다.<br>
	<%=cookies.getName() %> =<%=cookies.getValue() %>
	[<%=cookies.getDomain() %>] <br>
	
	<%=cookies0.getName() %> =<%=cookies0.getValue() %>
	[<%=cookies0.getDomain() %>] <br>
	
	
	<%=cookies1.getName() %> =<%=cookies1.getValue() %>
	[<%=cookies1.getDomain() %>] <br>
	
	<%=cookies2.getName() %> =<%=cookies2.getValue() %>
	[<%=cookies2.getDomain() %>] <br>
	

</body>
</html>