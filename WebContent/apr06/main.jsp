<%@page import="soldesk.logon.LogonDBBean"%>
<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/apr06/color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Main page</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>


<%
	CookieBox cookieBox =new CookieBox(request);
	String id =request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	
%>



<%
	try {
		if (session.getAttribute("memId") == null) {
%>
<script language="javascript">
<!-- 
function focusIt(){
	document.inform.id.focus();
}
function checkIt(){
	inputForm=eval("document.inform");
	if(!inputForm.id.value){
		alert("아이디를 입력하세요");
		inputForm.id.focus();
		return false;
	}
	if(!inputForm.passwd.value){
		alert("비밀번호를 입력하세요");
		inputForm.passwd.focus();
		return false;
	}
}
//-->
</script>
<body onLoad="focusIt();" bgcolor="<%=bodyback_c%>">
	<br>
	<table width=300 cellpadding="0" cellspacing="0" align="center"
		border="1">
		<tr>
			<td width="90" bgcolor="<%=bodyback_c%>" height="20">&nbsp;</td>
			<form name="inform" method="post" action="loginPro.jsp" onsubmit="return checkIt();">
				
		<%
				if(cookieBox.exists("ID")){
		%>
				
				
				<td bgcolor="<%=title_c%>" width="100" align="right">아이디</td>
				<td width="100" bgcolor="<%=value_c%>">
				<input type="text" name="id" size="16" maxlength="10" value="<%=cookieBox.getValue("ID")%>"/></td>
		
		<%
				}
				else {
					
			
		%>
				<td bgcolor="<%=title_c%>" width="100" align="right">아이디</td>
				<td width="100" bgcolor="<%=value_c%>">
				<input type="text" name="id" size="16" maxlength="10"/></td>
				
		<%
				}
		%>
		
		
		
		</tr>
		<tr>
			<td rowspan="4" bgcolor="<%=bodyback_c%>" width="90" align="center">메인</td>
			<td bgcolor="<%=title_c%>" width="100" align="right">패스워드</td>
			<td width="100" bgcolor="<%=value_c%>">
			<input type="password" name="passwd" size="16" maxlength="10" /></td>
		</tr>
		<tr>
			<td bgcolor="<%=title_c%>" width="100" align="right">ID 찾기 </td>
			<td><input type="button" value="ID찾기" onclick="javascript:window.location='test.jsp'"> </td>
		</tr>
		<tr>
			<td bgcolor="<%=title_c%>" width="100" align="right">비밀번호 찾기 </td>
			<td><input type="button" value="비밀번호 찾기" onclick="javascript:window.location='test3.jsp'"> </td>
		</tr>
		<tr>
			<td colspan="3" bgcolor="<%=title_c%>" align="center">
			
			
		<%
			if(cookieBox.exists("ID")){
		%>
			ID저장<input type="checkbox" name="save" value="true" checked/>	
			
			
		<%
			}
		
			else{
		%>
			ID저장<input type="checkbox" name="save" value="true"/>	
			
		
		<%
			}
		%>
			
			<input type="submit" name="Submit" value="로그인" /> 
			<input type="button" value="회원가입" onclick="javascript:window.location='inputForm.jsp'" />
			
		
			</td>
			</form>
		</tr>
	</table>
	<%
		} 
		else {
			
			if(session.getAttribute("memId").equals("2")){
				
			
			
	%>
	<table width=500 cellpadding="0" cellspacing="0" align="center"
		border="1">
		<tr>
		<td width="300" bgcolor="<%=bodyback_c%>" height="20">관리자 Main 페이지  </td>
		<td rowspan="3" bgcolor="<%=value_c%>" align="center"><%=session.getAttribute("memId")%>님이<br>
				방문하셨습니다.
				<form method="post" action="logout.jsp">
					<input type="submit" value="로그아웃" /> 
					<input type="button" value="회원정보변경" onclick="javascript:window.location='modify.jsp'" />
				</form></td>
		</tr>
		
		<tr>
			<td rowspan="2" bgcolor="<%=bodyback_c%>" width="300"> 
			<a href="rootlist.jsp">회원 리스트 클릭클릭</a>
			</td>
			
		</tr>
	
	</table>
	
	
	<%
			}
			else{
	%>
	
	<table width=500 cellpadding="0" cellspacing="0" align="center"
		border="1">
		<tr>
			<td width="300" bgcolor="<%=bodyback_c%>" height="20">사용자 페이지  </td>
			<td rowspan="3" bgcolor="<%=value_c%>" align="center"><%=session.getAttribute("memId")%>님이<br>
				방문하셨습니다.
				<form method="post" action="logout.jsp">
					<input type="submit" value="로그아웃" /> 
					<input type="button" value="회원정보변경" onclick="javascript:window.location='modify.jsp'" />
				</form></td>
		</tr>
		
		<tr>
			<td rowspan="2" bgcolor="<%=bodyback_c%>" width="300">메인</td>
			
		</tr>
	
	</table>
	<br>
	
	
	<%
			}
		}
		
		} catch (NullPointerException e) {}
		
	%>
</body>
</html>