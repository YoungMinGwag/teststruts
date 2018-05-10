<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%> <!-- 클래스 jdbc 드라이버들을 관리 -->
<%@page import="java.sql.ResultSet"%> <!--인터페이스  statement 객체를 통해 데이터베이스에 전송된 sQL문에의해 반환되는 데이터 -->
<%@page import="java.sql.Statement"%> <!-- 인터페이스 SQL문을 데이터 베이스에 전송하는   -->
<%@page import="java.sql.Connection"%> <!-- jdbc API를 통한 데이터베이스 연겨 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 목록</title>
</head>
<body>
	MEMBER 테이블의 내용
	<table width="100%" border="1">
		<tr>
			<td>이름</td>
			<td>아이디</td>
			<td>이메일</td>
		</tr>
		<%
				//jdbc 드라이버 로딩 
				Class.forName("oracle.jdbc.driver.OracleDriver"); 
				
				Connection conn=null; // DBMS랑연결
				Statement stmt=null; //sql 실행시켜주는 객체
				ResultSet rs=null;  // DB결과를 그대로 jsp로 저장 
				
				try{
					String jdbcDriver ="jdbc:oracle:thin:@istudy.iptime.org:7000:ORCL";
					String dbUser="KH10";
					String dbpass="oracle";
					String query="select *from MEMBER_YM order by MEMBERID desc";
				
					conn=DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
					//static 인 getconnection을 사용할수있기때문에 class 
					stmt=conn.createStatement();
					rs=stmt.executeQuery(query);
					while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString("NAME") %></td>
			<td><%=rs.getString("MEMBERID") %></td>
			<td><%=rs.getString("EMAIL") %></td>
		</tr>
		<%
					}
				}catch(SQLException ex){
					out.println(ex.getMessage());
					ex.printStackTrace();
				}
				finally{
					if(rs!=null){ 
						try{
							rs.close();
							} catch(SQLException ex){
								
							}
					}
					if(stmt != null){
						try{
							stmt.close();
							} catch(SQLException ex){
								
							}
					}
					if(conn !=null){
						try{
							conn.close();
							}catch(SQLException ex){
								
							}
					}
				}
		%>



	</table>
</body>
</html>