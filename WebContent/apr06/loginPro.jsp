<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="soldesk.logon.LogonDBBean"%>
<% request.setCharacterEncoding("euc-kr");%>

<%
	CookieBox cookieBox =new CookieBox(request);
    String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
	
	if(request.getParameter("save")==null){
		response.addCookie(CookieBox.createCookie("ID","","/",-1));
	}
	else{
		response.addCookie(CookieBox.createCookie("ID", id, "/",-1));
	}		


	LogonDBBean manager = LogonDBBean.getInstance();
    	int check= manager.userCheck(id,passwd);


if(check==1){
session.setAttribute("memId",id);
response.sendRedirect("main.jsp");
}else if(check==0){%>

<script>
  alert("비밀번호가 맞지 않습니다.");
  history.go(-1);
</script>
<% }else{ %>
<script>
  alert("아이디가 맞지 않습니다..");
  history.go(-1);
</script>
<%} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>