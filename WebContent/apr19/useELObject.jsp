<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setAttribute("name","������");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>EL Object</title>
</head>
<body>
 ��û URI: ${pageContext.request.requestURI} <br>
 
 request�� name�Ӽ�: ${requestScope.name }<br>
 code �Ķ����: ${param.code}
</body>
</html>