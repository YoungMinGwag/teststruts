<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/apr11/color.jsp"%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>
<script language="JavaScript">     
<!--     
  function deleteSave(){
if(document.delForm.passwd.value==''){
alert("��й�ȣ�� �Է��Ͻʽÿ�.");
document.delForm.passwd.focus();
return false;
}
}   
// -->     
</script>
</head>

<body bgcolor="<%=bodyback_c%>">
<center><b>�ۻ���</b>
<br>
<form method="POST" name="delForm"  action="deletePro.jsp?pageNum=<%=pageNum%>"
   onsubmit="return deleteSave()">
<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center  bgcolor="<%=value_c%>">
       <b>��й�ȣ�� �Է��� �ּ���.</b></td>
  </tr>
  <tr height="30">
     <td align=center >��й�ȣ :  
       <input type="password" name="passwd" size="8" maxlength="12">
   <input type="hidden" name="num" value="<%=num%>"></td>
</tr>
<tr height="30">
    <td align=center bgcolor="<%=value_c%>">
      <input type="submit" value="�ۻ���" >
      <input type="button" value="�۸��"
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">    
   </td>
</tr> 
</table>
</form>
</body>
</html>