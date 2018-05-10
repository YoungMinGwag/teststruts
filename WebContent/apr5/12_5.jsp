<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.Reader"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String memberID=request.getParameter("memberID");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
		String dbPass="oracle";
		String query="select * from MEMBER_HISTORY_YM where MEMBERID='"+memberID+"'";
		
		conn=DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
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
			<td>히스토리</td>
			<td>
				<%
				String history=null;
				Reader reader=null;
				try{
					reader=rs.getCharacterStream("HISTORY");
					if(reader !=null){
						StringBuffer buff=new StringBuffer();
						char[] ch=new char[512];
						int len=-1;
						
						while((len=reader.read(ch)) != -1){
							buff.append(ch,0,len);
						}
						history =buff.toString();
					}
				}catch(IOException ex){
					out.print("예외 발생:"+ex.getMessage());
				}finally{
					if(reader !=null){
						try{
							reader.close();
						}
						catch(IOException ex){}
					}
				}
				%> <%=history %>
			</td>
		</tr>
	</table>
	<%
			
		}
		else{
			%>
	<%=memberID %>
	회원의 히스토리가 없습니다.
	<% 
		}
	}catch(SQLException ex){
		

	%>
	에러 발생:
	<%=ex.getMessage() %>
	<% }
finally{
	if(rs !=null) {
		try{
			rs.close();
		}
		catch(SQLException es){}
	}
	if(stmt !=null) {
		try{
			stmt.close();
		}
		catch(SQLException es){}
	}
	if(conn !=null) {
		try{
			conn.close();
		}
		catch(SQLException es){}
	}
}
%>

</body>
</html>