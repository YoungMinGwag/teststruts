<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>삭제실패</title>
</head>
<body>
에러: 
<c:choose> 
	<c:when test="${exceptionType == 'ArticleNotFoundException'}">
	삭제할  게시글이 존재하지 않습니다.
	</c:when>
	<c:when test="${exceptionType == 'InvalidPasswordException'}">
	암호를 잘못입력했습니다.
	</c:when>
</c:choose>
<br/>
<a href="<c:url value='list.jsp?p=${param.p}'/>">목록보기</a>
</body>
</html>