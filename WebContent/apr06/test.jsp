<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="soldesk.logon.*"%>
<%@ include file="/apr06/color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID 찾기</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="javascript">

	
	
	
	function test(myform) {
		url="test1.jsp?name="+myform.name.value+"&jumin1="+myform.jumin1.value+"&jumin2="+myform.jumin2.value;
		open(url,"confirm","toolbar=no,location=no status=no,menuber=no,scrollbars=no,resizable=no,width=300,height=200,left=800,top=300");
	}

</script>
</head>
<body  bgcolor="<%=bodyback_c%>">
<form name="myform"method="post" >
	<table cellspacing="1" cellpadding="1" width="260" bordercolor="1"
		align="center">
		<tr height="30">
			<td colspan="2" align="middle" bgcolor="<%=title_c%>"><strong>ID 찾기</strong></td>
		</tr>
		<TR height="30">
		<TD width="250" bgcolor="<%=title_c%>" align="center">이름 </TD>
		<TD width="150" bgcolor="<%=value_c%>" >
		<INPUT type="text" name="name" size="15" maxlength="12"></TD>
		</TR>
		<tr>
				<td width="250" bgcolor="<%=title_c%>" align=center>주민등록번호</td>
				<td width="400">
				<input type="text" name="jumin1" size="10"maxlength="6">
				 -
				 <input type="text" name="jumin2" size="10"maxlength="7"></td>
			</tr>
		<TR height="30">
			<TD colspan="2" align="middle" bgcolor="<%=title_c%>">
			<INPUT type=submit value="ID 찾기" onclick="test(this.form)"> 
			<input type="button" value="MAIN" onclick="javascript:window.location='main.jsp'"></TD>
		</TR>
	</table>
</form>

</body>
</html>