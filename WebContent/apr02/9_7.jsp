<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	Cookie cookies=new Cookie("oneh","30s");
	cookies.setMaxAge(30*1);
	response.addCookie(cookies);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ŷȿ �ð�����</title>
</head>
<body>
	��ȿ�ð� 30���� oneh ��Ű ����
</body>
</html>