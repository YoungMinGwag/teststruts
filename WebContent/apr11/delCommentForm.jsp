<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/apr11/color.jsp" %>
<%
	String comment_num=request.getParameter("cmn");
	String content_num=request.getParameter("ctn");
	String p_num=request.getParameter("p_num");
	String url="content1.jsp?num="+content_num+"&pageNum="+p_num;
	//out.println(url);
	//content1.jsp?num93&pageNum=1
	//content1.jsp?num=93&pageNum=1
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javaScript">
<!--
	function deleteSave(){
		if(document.delForm.passwd.value==''){
			alert("��й�ȣ�� �Է��Ͻʽÿ�.");
			document.delForm.passwd.focus();
			return false;
	}
}   
	//-->
</script>
</head>
<body bgcolor=<%=bodyback_c%>>
<center>

<form method="post" name="delForm" action="delCommentPro.jsp" onsubmit="return deleteSave()">
<table border="1" align="center" cellpadding="0" cellspacing="0" width="360">
	<tr height="30">
		<td align="center" bgcolor="<%=value_c%>"><b>��й�ȣ�� �Է����ּ��� </b></td>
	</tr>
	<tr height="30">
		<td align="center">��й�ȣ :<input type="password" name="passwd" size="8" maxlength="12">
								<input type="hidden" name="content_num" value="<%=content_num%>">
								<input type="hidden" name="comment_num" value="<%=comment_num%>"> 
								<input type="hidden" name="p_num" value="<%=p_num%>">
		</td>
	</tr>
	<tr height="30">
		<td align="center" bgcolor="<%=value_c%>">
		 	<input type="submit" value="�ڸ�Ʈ ����">
		 	<input type="button" value="���" onclick="document.location.href='<%=url%>'">
		 	
		 	
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>