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
		alert("���̵� �Է��ϼ���");
		inputForm.id.focus();
		return false;
	}
	if(!inputForm.passwd.value){
		alert("��й�ȣ�� �Է��ϼ���");
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
				
				
				<td bgcolor="<%=title_c%>" width="100" align="right">���̵�</td>
				<td width="100" bgcolor="<%=value_c%>">
				<input type="text" name="id" size="16" maxlength="10" value="<%=cookieBox.getValue("ID")%>"/></td>
		
		<%
				}
				else {
					
			
		%>
				<td bgcolor="<%=title_c%>" width="100" align="right">���̵�</td>
				<td width="100" bgcolor="<%=value_c%>">
				<input type="text" name="id" size="16" maxlength="10"/></td>
				
		<%
				}
		%>
		
		
		
		</tr>
		<tr>
			<td rowspan="4" bgcolor="<%=bodyback_c%>" width="90" align="center">����</td>
			<td bgcolor="<%=title_c%>" width="100" align="right">�н�����</td>
			<td width="100" bgcolor="<%=value_c%>">
			<input type="password" name="passwd" size="16" maxlength="10" /></td>
		</tr>
		<tr>
			<td bgcolor="<%=title_c%>" width="100" align="right">ID ã�� </td>
			<td><input type="button" value="IDã��" onclick="javascript:window.location='test.jsp'"> </td>
		</tr>
		<tr>
			<td bgcolor="<%=title_c%>" width="100" align="right">��й�ȣ ã�� </td>
			<td><input type="button" value="��й�ȣ ã��" onclick="javascript:window.location='test3.jsp'"> </td>
		</tr>
		<tr>
			<td colspan="3" bgcolor="<%=title_c%>" align="center">
			
			
		<%
			if(cookieBox.exists("ID")){
		%>
			ID����<input type="checkbox" name="save" value="true" checked/>	
			
			
		<%
			}
		
			else{
		%>
			ID����<input type="checkbox" name="save" value="true"/>	
			
		
		<%
			}
		%>
			
			<input type="submit" name="Submit" value="�α���" /> 
			<input type="button" value="ȸ������" onclick="javascript:window.location='inputForm.jsp'" />
			
		
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
		<td width="300" bgcolor="<%=bodyback_c%>" height="20">������ Main ������  </td>
		<td rowspan="3" bgcolor="<%=value_c%>" align="center"><%=session.getAttribute("memId")%>����<br>
				�湮�ϼ̽��ϴ�.
				<form method="post" action="logout.jsp">
					<input type="submit" value="�α׾ƿ�" /> 
					<input type="button" value="ȸ����������" onclick="javascript:window.location='modify.jsp'" />
				</form></td>
		</tr>
		
		<tr>
			<td rowspan="2" bgcolor="<%=bodyback_c%>" width="300"> 
			<a href="rootlist.jsp">ȸ�� ����Ʈ Ŭ��Ŭ��</a>
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
			<td width="300" bgcolor="<%=bodyback_c%>" height="20">����� ������  </td>
			<td rowspan="3" bgcolor="<%=value_c%>" align="center"><%=session.getAttribute("memId")%>����<br>
				�湮�ϼ̽��ϴ�.
				<form method="post" action="logout.jsp">
					<input type="submit" value="�α׾ƿ�" /> 
					<input type="button" value="ȸ����������" onclick="javascript:window.location='modify.jsp'" />
				</form></td>
		</tr>
		
		<tr>
			<td rowspan="2" bgcolor="<%=bodyback_c%>" width="300">����</td>
			
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