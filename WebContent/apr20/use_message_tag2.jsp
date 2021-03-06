<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setBundle basename="resource.message" var="message"/>
<fmt:message bundle="${message }" key="TITLE" var="title"></fmt:message>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>${title }</title>
</head>
<body>
	<fmt:message bundle="${message}" key="GREETING"></fmt:message>
	<br>
	<c:if test="${! empty param.id }">
	<fmt:message bundle="${message }" key="VISTOR">
	</fmt:message>
	</c:if>
</body>
</html>