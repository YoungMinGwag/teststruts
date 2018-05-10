<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        
    <%@ page errorPage = "error_view.jsp" %>
    
<html>
<head><title>Å×¸¶ °¶·¯¸®</title>
<style>
A{color:blue;font-weight:bold;text-decoration:none}
A:hover{color:blue;font-weignt:blod;text-decoration:underline}
</style>
</head>
<body>
<table width="100%" border="1" cellpadding="2" cellspacing="0">
<tr>
<td>
<jsp:include page="top.jsp" flush="false"/>
</td>
</tr>

<tr>
<td>
<jsp:include page="${param.CONTENTPAGE }" flush="false"/>
</td>
</tr>

<tr>
   <td>
   <jsp:include page="bottom.jsp" flush="false"/>
   </td>
   </tr>

</table>

</body>
</html>
