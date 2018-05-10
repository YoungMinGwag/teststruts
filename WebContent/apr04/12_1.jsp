<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%> <!-- Ŭ���� jdbc ����̹����� ���� -->
<%@page import="java.sql.ResultSet"%> <!--�������̽�  statement ��ü�� ���� �����ͺ��̽��� ���۵� sQL�������� ��ȯ�Ǵ� ������ -->
<%@page import="java.sql.Statement"%> <!-- �������̽� SQL���� ������ ���̽��� �����ϴ�   -->
<%@page import="java.sql.Connection"%> <!-- jdbc API�� ���� �����ͺ��̽� ���� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���</title>
</head>
<body>
	MEMBER ���̺��� ����
	<table width="100%" border="1">
		<tr>
			<td>�̸�</td>
			<td>���̵�</td>
			<td>�̸���</td>
		</tr>
		<%
				//jdbc ����̹� �ε� 
				Class.forName("oracle.jdbc.driver.OracleDriver"); 
				
				Connection conn=null; // DBMS������
				Statement stmt=null; //sql ��������ִ� ��ü
				ResultSet rs=null;  // DB����� �״�� jsp�� ���� 
				
				try{
					String jdbcDriver ="jdbc:oracle:thin:@istudy.iptime.org:7000:ORCL";
					String dbUser="KH10";
					String dbpass="oracle";
					String query="select *from MEMBER_YM order by MEMBERID desc";
				
					conn=DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
					//static �� getconnection�� ����Ҽ��ֱ⶧���� class 
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