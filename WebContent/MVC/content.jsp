<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="color.jspf" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<style type="text/css">
<!-- 
a:link {
	color: black; text-decoration: none;
}
a:visited {
	
}
a:active {
	text-decoration: underline;
}
a:hover {
	text-decoration: underline;background-image: url('text_dottdeline.gif');background-repeat: repeat-x;
	background-position: 50% 100%;
}
-->
</style>

<style>
<!--
@font-face {
	font-family: ����;
	src: url();
}
body,td,a,div,p,pre,input,textarea {
	font-family: ����; 
	font-size: 9pt;
}
-->
</style>
</head>
<body bgcolor="${bodyback_c}">
<center> <b>�۳��� ����</b><br>

<table width="500" border="1" cellpadding="0" cellspacing="0" align="center">
<tr height="30">
	<td align="center" width="125" bgcolor="${value_c}">�۹�ȣ</td>
	<td align="center" width="125" align="center">${article.num }</td>
	<td align="center" width="125" bgcolor="${value_c}">��ȸ��</td>
	<td align="center" width="125" align="center">${article.readcount}</td>
</tr>

<tr height="30">
	<td align="center" width="125" bgcolor="${value_c}">�ۼ���</td>
	<td align="center" width="125" align="center">${article.writer}</td>
	<td align="center" width="125" bgcolor="${value_c}">�ۼ���</td>
	<td align="center" width="125" align="center">${article.reg_date}</td>
	
</tr>
<tr height="30">
	<td align="center" width="125" bgcolor="${value_c}">������</td>
	<td align="center" width="375" align="center" colspan="3">${article.subject}</td>
</tr>

<tr>
	<td align="center" width="125" bgcolor="${value_c}">�۳���</td>
	<td align="center" width="375" colspan="3"><pre>${article.content }</pre></td>
</tr>
<tr height="30">
	<td colspan="4" bgcolor="${value_c}" align="right">
	 	<input type="button" value="�ۼ���" onclick="document.location.href='/KH10/MVC/updateForm.do?num=${article.num}&pageNum=${pageNum}'">&nbsp;&nbsp;&nbsp;&nbsp;
	 	<input type="button" value="�ۻ���" onclick="document.location.href='/KH10/MVC/deleteForm.do?num=${article.num}&pageNum=${pageNum}'">&nbsp;&nbsp;&nbsp;&nbsp;
	 	<input type="button" value="��۾���" onclick="document.location.href='/KH10/MVC/writeForm.do?num=${article.num}&ref=${article.ref}&re_setp=${article.re_setp}&re_level=${article.re_level}'">&nbsp;&nbsp;&nbsp;&nbsp;
	 	<input type="button" value="�۸��" onclick="document.location.href='/KH10/MVC/list.do?pageNum=${pageNum}'">
	</td>
</tr>

<form method=post action="/KH10/MVC/contentPro.do?pageNum=${pageNum}" name="comment" >
			<tr bgcolor="${value_c}" align="center">
				<td>�ڸ�Ʈ �ۼ�</td>
				<td colspan=2><textarea name=commentt rows="6" cols="40"></textarea>
					<input type=hidden name=content_num value="${article.num}">
					<input type=hidden name=p_num value="${pageNum}"> <input
					type=hidden name=comment_num value="${count1+1}"></td>
				<td align=center>�ۼ���<br> <input type=text name=commenter
					size=10><br> ��й�ȣ<br> <input type=password
					name=passwd size=10>
				<p>
						<input type=submit value=�ڸ�Ʈ�ޱ�></td>
			</tr>
		</form>

</table>

</form>

<c:if test="${count1 >0 }">

	<p>
	<table width=500 border=0 cellspacing=0 cellpadding=0
		bgcolor="${bodyback_c}" align=center>
		<tr>
			<td>�ڸ�Ʈ ��:${fn:length(comments)} 
		</tr>
		<c:forEach var="dbc"  items="${comments}" >
		<tr>
			<td align=left size=250 bgcolor="${value_c}">&nbsp;<b>${dbc.commenter}&nbsp;��</b>
				(${reg_date})
			</td>
			<td align=right size=250 bgcolor="${value_c }">����IP:${dbc.ip}
				&nbsp;<a
				href="delCommentForm.do?ctn=${dbc.content_num}&cmn=${dbc.comment_num}&p_num=${pageNum}">[����]</a>&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan=2>${dbc.commentt}
			<td>
				</c:forEach>
		</tr>

	</table>
	<table width=500 border=0 cellspacing=0 cellpadding=0
		bgcolor="${bodyback_c}"align=center>
		<tr>
			<center>


<c:if test="${count1 > 0 }">
	<c:set var="pageCount" value="${count1/pageSize + (count1 % pageSize == 0 ? 0 : 1)}"/>
	<c:set value="${10}" var="pageBlock"/>
	<fmt:parseNumber var="result" value="${currentPage /10 }" integerOnly="true"/>
	<c:set var="startPage" value="${result * 10 +1}"/>
	<c:set var="endPage" value="${startPage + pageBlock -1}"/>
	<c:if test="${endPage > pageCount }">
		<c:set var="endPage" value="${pageCount}"/>
	</c:if>
	
	<c:if test="${startPage> 10 }">
		<a href="content.do?num=${article.num}&pageNum=${pageNum}&cPageNum=${startPage - 10}">[����]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="content.do?num=${article.num}&pageNum=${pageNum}&cPageNum=${i}">[${i}]</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount }">
		<a href="content.do?num=${article.num}&pageNum=${pageNum}&cPageNum=${startPage +10}">[����]</a>
	</c:if>
</c:if>
			</center>
		</tr>
	</table>

	</c:if>
	

</body>
</html>