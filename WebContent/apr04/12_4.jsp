<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String memberID = request.getParameter("memberID");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보</title>
</head>
<body>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try{
			String jdbcDriver="jdbc:oracle:thin:@istudy.iptime.org:7000:ORCL";
			String dbUser="KH10";
			String dbpass="oracle";
			String query="select * from MEMBER_YM where MEMBERID='"+memberID+"'";
			
			conn=DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(query);
			if(rs.next()){
	%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><%=memberID %></td>
		</tr>
		<tr>
			<td>암호</td>
			<td><%=rs.getString("PASSWORD") %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=rs.getString("NAME") %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=rs.getString("EMAIL") %></td>
		</tr>
	</table>
	<% 
		} 
			else{
			%>
	<%=memberID %>에 해당하는 정보가 존재하지 않습니다.
	<%
	}
			}catch(SQLException ex){
			%>
	에러발생:
	<%=ex.getMessage() %>
	<%
			}finally{
				if(rs !=null){
					try{
						rs.close();
					}catch(SQLException ex){}
				}
				if(stmt !=null){
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
</body>
</html>