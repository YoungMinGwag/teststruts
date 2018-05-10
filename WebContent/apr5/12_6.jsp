<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MEMBER 테이블 레코드 삽입</title>
</head>
<body>
<form action="12_7.jsp" method="post">
<table border="1">
<tr>
<td>아이디</td>
<td><input type="text" name="memberID" size="10"/></td>
<td>암호</td>
<td><input type="text" name="password" size="10"/></td>
</tr>
<tr>
<td>이름</td>
<td><input type="text" name="name" size="10"/></td>
<td>이메일</td>
<td><input type="text" name="email" size="10"/></td>
</tr>
<tr>
<td colspan="4"><input type="submit" value="삽입"/></td>
</tr>
</table>
</form>
</body>
</html>