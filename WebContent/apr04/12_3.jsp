<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String MEMBERID =request.getParameter("MEMBERID");
	String NAME=request.getParameter("NAME");
	
	int updateCount=0;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn=null;
	Statement stmt=null;
	
	try{
		String jdbcDriver="jdbc:oracle:thin:@istudy.iptime.org:7000:ORCL";
		String dbUser="KH10";
		String dbPass="oracle";
		String query = "update MEMBER_YM set NAME ='"+NAME+"'where MEMBERID='"+MEMBERID+"'";
		
		conn= DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt=conn.createStatement();
		updateCount=stmt.executeUpdate(query);
	}finally{
		if(stmt != null){
			try{
				stmt.close();
			}catch(SQLException ex){}
		}
		if(conn !=null){
			try{
				conn.close();
			}catch(SQLException ex){}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이름변경</title>
</head>
<body>
	<% if(updateCount>0){ %>
	<%=MEMBERID %>의 이름을  <%=NAME %>(으)로 변경
	<% } else { %>
	<%= MEMBERID %> 아이디가 존재 하지 않음
	<% } %>
</body>
</html>