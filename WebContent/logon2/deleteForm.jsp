<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="color.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ��Ż��</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function begin(){
		document.myform.passwd.focus();
	}
	function checkIt(){
		if(!document.myform.passwd.value){
			alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
			document.myform.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body onload="begin()" bgcolor="${bodyback_c}">
<form name="myform" action="/KH10/logon/deletePro.do" onsubmit="return checkIt()">
<table cellpadding="1" cellspacing="1" width="260" border="1" align="center">
	<tr height="30">
		<td><font><b>ȸ�� Ż��</b></font></td>
	</tr>
	
	<tr height="30">
		<td width="110" bgcolor="${value_c}" align="center">��й�ȣ</td>
		<td width="150" align="center">
			<input type="password" name="passwd" size="15" maxlength="12">
			<input type="hidden" name="id" value="${sessionScope.memId }">
		</td>
	</tr>
	
	<tr height="30">
		<td colspan="2" align="middle" bgcolor="${value_c}">
		<input type="submit" value="ȸ��Ż��">
		<input type="button" value="���" onclick="document.location.href='/KH10/logon/main.do'">
		</td>
	</tr>
</table>
</form>
</body>
</html>