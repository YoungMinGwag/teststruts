<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/apr06/color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
	function begin() {
		document.myform.id.focus();
	}
	function checkIt() {
		if (!document.myform.id.value) {
			alert("���̵� �Է����� �����̽��ϴ�.");
			document.myform.id.focus();
			return false;
		}
		if (!document.myform.passwd.value) {
			alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
			document.myform.passwd.focus();
			return false;
		}
	}
	-->
</script>
</head>
<body onload="begin()" bgcolor="<%=bodyback_c%>">
	<form name="myform" action="loginPro.jsp" method="post"
		onSubmit="return checkIt()">
		<table cellspacing="1" cellpadding="1" width="260" bordercolor="1"
			align="center">
			<tr height="30">
				<td colspan="2" align="middle" bgcolor="<%=title_c%>"><strong>ȸ���α���</strong></td>
			</tr>
			<TR height="30">
			<TD width="110" bgcolor="<%=title_c%>" align=center>���̵�</TD>
			<TD width="150" bgcolor="<%=value_c%>" align=center><INPUT
				type="text" name="id" size="15" maxlength="12"></TD>
			</TR>
			<TR height="30">
				<TD width="110" bgcolor="<%=title_c%>" align=center>��й�ȣ</TD>
				<TD width="150" bgcolor="<%=value_c%>" align=center><INPUT
					type=password name="passwd" size="15" maxlength="12"></TD>
			</TR>
			<TR height="30">
				<TD colspan="2" align="middle" bgcolor="<%=title_c%>"><INPUT
					type=submit value="�α���"> <INPUT type=reset value="�ٽ��Է�">
					<input type="button" value="ȸ������"
					onclick="javascript:window.location='inputForm.jsp'"></TD>
			</TR>
		</table>
	</form>

</body>
</html>