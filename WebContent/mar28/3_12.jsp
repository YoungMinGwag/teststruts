<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<%!
		public int add(int a,int b){
		int c=a+b;
		return c;
	}
	  public int sub(int a,int b){
		  int c=a-b;
		  return c;
	  }
	%>
	
</head>
<body>
<%
	int val1=3;
	int val2=9;
	
	int addval=(add(val1,val2));
	int subval=(sub(val1,val2));
%>

<%=val1 %> + <%=val2 %> = <%=addval %> <br>
<%=val1 %> - <%=val2 %> = <%=subval %>

</body>
</html>