<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setAttribute("name","곽영민");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>EL Object</title>
</head>
<body>
 요청 URI: ${pageContext.request.requestURI} <br>
 
 request의 name속성: ${requestScope.name }<br>
 code 파라미터: ${param.code}
</body>
</html>