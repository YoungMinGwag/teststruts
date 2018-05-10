<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이름 변경 폼</title>
</head>
<body>
	<form action="12_3.jsp" method="post">
		<table border="1">

			<tr>
				<td>아이디</td>
				<td><input type="text" name="MEMBERID" size="10" /></td>
				<td>이름</td>
				<td><input type="text" name="NAME" size="10" /></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="변경" /></td>
			</tr>
		</table>
	</form>
</body>
</html>