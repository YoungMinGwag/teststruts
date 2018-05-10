<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>예외 발생</title>
</head>
<body>
	요청 처리 과정에서 예외가 발생했어!!! 
	<p>
	에러타입: <%=exception.getClass().getName() %><br>
	에러 메시지: <b><%=exception.getMessage() %></b>
</body>
</html>