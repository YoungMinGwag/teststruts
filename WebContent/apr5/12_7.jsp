<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
		request.setCharacterEncoding("euc-kr");
		String memberID =request.getParameter("memberID");
		String password=request.getParameter("password");
		String name= request.getParameter("name");
		String email=request.getParameter("email");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		try{
			String jdbcDriver="jdbc:oracle:thin:@istudy.iptime.org:7000:ORCL";
			String dbUser="KH10";
			String dbpass="oracle";
			
			conn=DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
			pstmt=conn.prepareStatement("insert into MEMBER_YM values(?,?,?,?)");
			pstmt.setString(1,memberID);
			pstmt.setString(2,password);
			pstmt.setString(3,name);
			pstmt.setString(4,email);
			
			pstmt.executeUpdate();
		}
		finally{
			if(pstmt !=null){
				try{
					pstmt.close();
				}
				catch(SQLException ex){}
			}
			if(conn !=null){
				try{
					conn.close();
				}
				catch(SQLException ex){}
			}
		}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>삽입</title>
</head>
<body>
	member 테이블에 새로운 레코드를 삽입햇습니다.
</body>
</html>