<%@page import="ImageBoard.ThemeManager"%>
<%@page import="ImageBoard.Theme"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String parentId =request.getParameter("parentId");
	String title="";
	Theme theme=null;
	if(parentId !=null){
		ThemeManager manager=ThemeManager.getInstance();
		theme=manager.select(Integer.parseInt(parentId));
		if(theme !=null){
			title="re:"+theme.getTitle();
		}
	}
%>
<c:set var="theme" value="<%=theme %>"/>
<script language="JavaScript">
function validate(form){
	if(form.title.value==""){
		alert("������ �Է��ϼ���.");
		return false;
	}else if(form.name.value==""){
		alert("�̸��� �Է��ϼ���.");
		return false;
	}else if(form["parentId"]==null && form.imageFile.value==""){
		alert("�̹��� ������ �����ϼ���.");
		return false;
	}else if(form.content.value==""){
		alert("������ �Է��ϼ���");
		return false;
	}
	
}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="write.jsp" method="post" enctype="multipart/form-data" onsubmit="return validate(this)">
<input type="hidden" name="levels" value="${theme.levels+1 }">
<c:if test="${! empty param.groupId }">
<input type="hidden" name="groupId" value="${param.groupId }">
</c:if>
<c:if test="${! empty param.parentId }">
<input type="hidden" name="parentId" value="${param.parentId }">
</c:if>
<table width="100%" border="1" cellpadding="1" cellspacing="0">
<tr>
	<td>����</td>
	<td><input type="text" name="title" size="40" value="<%=title%>"></td>
</tr>

<tr>
	<td>�̸�</td>
	<td><input type="text" name="name" size="10" value=""></td>
</tr>

<tr>
	<td>�̸���</td>
	<td><input type="text" name="email" size="10" value=""></td>
</tr>

<tr>
	<td>��ȣ</td>
	<td><input type="password" name="password" size="10" value=""></td>
</tr>

<tr>
	<td>�̹���</td>
	<td><input type="file" name="imageFile"></td>
</tr>

<tr>
	<td>����</td>
	<td><textarea rows="8" cols="40" name="content"></textarea>
</tr>
<tr>
	<td colspan="2"><input type="submit" value="���"></td>
</tr>
</table>

</form>
</body>
</html>