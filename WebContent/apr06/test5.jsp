<%@page import="soldesk.logon.LogonDataBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="soldesk.logon.LogonDBBean"%>
<%@ include file="/apr06/color.jsp"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String id = request.getParameter("id");

	
	LogonDBBean manager = LogonDBBean.getInstance();
	String c = manager.test1(id);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body bgcolor="<%=bodyback_c%>">

	<table width="270" border="0" cellspacing="0" cellpadding="5">
		<tr bgcolor="<%=title_c%>">
			<td height="39">아이디 = <%=c%>
			</td>

		</tr>
	</table>
</body>
</html>