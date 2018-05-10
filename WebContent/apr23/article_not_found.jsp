<!--ReadArticleService를 이용해서 게시글 데이터가 존재 하지 않을경우  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>에러</title>
</head>
<body>
게시글이 존재 하지 않습니다. 
<br>
<a href="<c:url value="List.jsp"/>">목록보기</a>
</body>
</html>