<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	String id=request.getParameter("memberId");
	if(id.equals("era13")){
		response.sendRedirect("3_19_1.jsp");
	}
	else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ����</title>

</head>
<body>
	���̵� ear13�� �ƴմϴ�. 
</body>
</html>
<%
	}
%>