<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
</head>
<body>
	<b>request.getParameter() �޼��� ���</b><br>
	
	name �Ķ���� = <%=request.getParameter("name") %><br>
	address �Ķ���� = <%=request.getParameter("address") %><br>
	<p>
	<b>request.getParameterValues()</b><br>
	<%
		String[] values=request.getParameterValues("pet");
			if(values !=null){
				for(int i=0;i<values.length;i++){
			
	%>
			<%= values[i] %>
	<%
				}
			}
	%>
	<p>
	<b>request.gerParameterNames() �޼��� ��� (parameter ��� ����ߴ���)</b><br>
	<%
		Enumeration paramEnum =request.getParameterNames();
			while(paramEnum.hasMoreElements()){
				String name=(String)paramEnum.nextElement();
	%>
				<%=name %>
	<%
			}
	%>
	<p>
	<b>request.getParamterMap()</b><br>
	<%
		Map parameterMap=request.getParameterMap();
		String[] nameParam=(String[])parameterMap.get("name");
			if(nameParam !=null){
	%>
	
			name =<%=nameParam[0] %>
	<%
			}
	%>		
</body>
</html>