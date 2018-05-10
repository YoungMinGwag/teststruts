<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="color.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="${bodyback_c}">
<c:if test="${check==1 }">
	<c:remove var="memId" scope="session"/>
	<form action="/KH10/logon/main.do" method="post" name="userinput">
	<table width="270" border="0" cellpadding="5" cellspacing="0" align="center">
		<tr bgcolor="${title_c}">
			<td height="39" align="center">
				<font size="+1"><b>회원정보가 삭제되었습니다.</b></font>
			</td>
		</tr>
		
		<tr bgcolor="${value_c}">
			<td align="center">
			<p>흑흑... 서운합니다. 안녕히 가세요.</p>
			<meta http-equiv="Refresh" content="5;url=/KH10/logon/main.do">
			</td>
		</tr>
		
		<tr bgcolor="${value_c}">
			<td align="center">
				<input type="submit" value="확인">
			</td>
		</tr>
	</table>
	</form>
</c:if>


<c:if test="${check==0 }">
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
		
	</script>
</c:if>
</body>
</html>