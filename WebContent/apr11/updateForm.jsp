<%@page import="soldesk.board.BoardDataBean"%>
<%@page import="soldesk.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/apr11/color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script.js"></script>
</head>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	try{
		BoardDBBean dbPro=BoardDBBean.getInstance();
		BoardDataBean article=dbPro.updateGetArticle(num);
	
%>
<body bgcolor="<%=bodyback_c%>">
<center><b>�ۼ���</b>
<br>
<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post" name="writeform" onsubmit="return writeSave()">
<table width="400" border="1" cellspacing="0" cellpadding="0" bgcolor="<%=bodyback_c%>" align="center">
<tr>
	<td width="70" bgcolor="<%=value_c%>" align="center">�̸�</td>
	<td align="left" width="300">
		<input type="text" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>">
		<input type="hidden" name="num" value="<%=article.getNum()%>">
	</td>
</tr>
<tr>
	<td width="70" bgcolor="<%=value_c%>" align="center">����</td>
	<td align="left" width="300">
		<input type="text" size="10" maxlength="50" name="subject" value="<%=article.getSubject()%>">
	</td>
</tr>
<tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center">Email</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >�� ��</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="40"><%=article.getContent()%></textarea></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >��й�ȣ</td>
    <td align="left" width="330" >
     <input type="password" size="8" maxlength="12" name="passwd">
    
</td>
  </tr>
  <tr>     
   <td colspan=2 bgcolor="<%=value_c%>" align="center">
     <input type="submit" value="�ۼ���" > 
     <input type="reset" value="�ٽ��ۼ�">
     <input type="button" value="��Ϻ���"
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
   </td>
</tr>
</table>
</form>
<%
	}
	catch(Exception e){
		
	}
%>
</body>
</html>