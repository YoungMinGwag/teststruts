<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String checkbox=request.getParameter("checkbox");
	if(id.equals(password)){
		session.setAttribute("MEMBERID",id);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ����</title>
</head>
<body>
 	�α��� ����<br>

 	<%=id %> <%=password %>
 	<% if(checkbox =="1"){
 		session.setAttribute("id", id);
 		response.sendRedirect("/apr02/10_4_1.jsp");
 	%>
</body>
</html>
<%
 	}
	}
	else {

%>
<script>
alert("�α��ο� �����Ͽ����ϴ�.");
history.go(-1);
</script>
<%
	}
%>