<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="color.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ����������</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="${title_c}">
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
<tr bgcolor="${title_c}">
	<td height="39" align="center"><font size="+1"><b>ȸ�������� �����Ǿ����ϴ�.</b></font></td>
</tr>

<tr>
	<td bgcolor="${value_c}" align="center">
	<p>�Է��Ͻ� ������ ������ �Ϸ�Ǿ����ϴ�.</p>
	</td>
</tr>

<tr>
	<td bgcolor="${value_c}" align="center">
	<form>
		<input type="button" value="��������" onclick="document.location.href='/study/appendix/main.do'">
	</form>
	5���Ŀ� �������� �̵��մϴ�.
	<meta http-equiv="Refresh" content="5;url=/KH10/logon/main.do">
	</td>
</tr>

</table>
</body>
</html>