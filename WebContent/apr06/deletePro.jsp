<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="soldesk.logon.LogonDBBean"%>
<%@ include file="/apr06/color.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	String id = (String) session.getAttribute("memId");
	String passwd = request.getParameter("passwd");
	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.deleteMember(id, passwd);

	if (check == 1) {
		session.invalidate();
%>
<body bgcolor="<%=bodyback_c%>">
	<form action="main.jsp" name="userinput" method="post">
		<table width="270" border="0" cellspacing="0" cellpadding="5"
			align="center">
			<tr bgcolor="<%=title_c%>">
				<td height="39" align="center"><font size="+1"><b>회원정보가
							삭제되었습니다.</b></font></td>
			</tr>
			<tr bgcolor="<%=value_c%>">
				<td align="center">
					<p>흑흑.... 서운합니다. 안녕히 가세요.</p>
					<meta http-equiv="Refresh" content="5;url=main.jsp">
				</td>
			</tr>
			<tr bgcolor="<%=value_c%>">
				<td align="center"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		}
	%>

	</form>

</body>
</html>