<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/apr11/color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script.js"></script>

</head>
<%
	int num = 0, ref = 1, re_setp = 0, re_level = 0;
	try {
		/*답변글이면 이렇게 쓰겠다... */
		if (request.getParameter("num") != null){
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_setp = Integer.parseInt(request.getParameter("re_setp"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
	}
%>
<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>글쓰기</b> <br>
		<form action="writePro.jsp" name="writeform" method="post"
			onsubmit="return writeSave()">

			<input type="hidden" name="num" value="<%=num%>"> 
			<input type="hidden" name="ref" value="<%=ref%>"> 
			<input type="hidden" name="re_setp" value="<%=re_setp%>"> 
			<input type="hidden" name="re_level" value="<%=re_level%>">

			<table width="400" border="1" cellpadding="0" cellspacing="0"
				bgcolor="<%=bodyback_c%>" align="center">
				<tr>
					<td align="right" colspan="2" bgcolor="<%=value_c%>">
					<a href="/KH10/apr11/list.jsp">글목록</a>
					<td>
				</tr>

				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">이 름</td>
					<td width="330"><input type="text" size="10" maxlength="10"
						name="writer"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">제 목</td>
					<td width="330">
						<%
							if (request.getParameter("num") == null) {
						%> <input type="text" size="40" maxlength="50" name="subject">
					</td>
					<%
						} else {
					%>
					<input type="text" size="40" maxlength="50" name="subject"
						value="[답변]">
					</td>
					<%
						}
					%>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
					<td width="330"><input type="text" size="40" maxlength="30"
						name="email"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">내 용</td>
					<td width="330"><textarea name="content" rows="13" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
					<td width="330"><input type="password" size="8" maxlength="12"
						name="passwd"></td>
				</tr>
				<tr>
					<td colspan=2 bgcolor="<%=value_c%>" align="center"><input
						type="submit" value="글쓰기"> <input type="reset"
						value="다시작성"> <input type="button" value="목록보기"
						OnClick="window.location='list.jsp'"></td>
				</tr>
			</table>


<%
}catch(Exception e){}
%>
		</form>
</body>
</html>