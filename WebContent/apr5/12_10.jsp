<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String idValue=request.getParameter("id");

	Connection conn=null;
	PreparedStatement pstmtItem=null;
	PreparedStatement pstmtDetail=null;
	
	String jdbcDriver="jdbc:oracle:thin:@istudy.iptime.org:7000:ORCL";
	String dbUser="KH10";
	String dbPass="oracle";
	
	Throwable occuredException =null;
	try{
		int id=Integer.parseInt(idValue);
		
		conn=DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		conn.setAutoCommit(false);
		
		pstmtItem =conn.prepareStatement("insert into ITEM_YM values(?,?)");
		pstmtItem.setInt(1,id);
		pstmtItem.setString(2,"��ǰ �̸�"+id);
		pstmtItem.executeUpdate();
		
		if(request.getParameter("error") !=null){
			throw new Exception("�ǵ������� ���� �߻� ��Ŵ ");
		}
		pstmtDetail =conn.prepareStatement("insert into ITEM_DETAIL_YM values(?,?)");
		pstmtDetail.setInt(1,id);
		pstmtDetail.setString(2,"�� ����"+id);
		pstmtDetail.executeUpdate();
		conn.commit();
	}catch(Throwable e){
		if(conn !=null){
			try{
				conn.rollback();
				
			}catch(SQLException es){}
		}
		occuredException =e;
		
	}finally{
		if(pstmtItem !=null){
			try{
				pstmtItem.close();
			}
			catch(SQLException ex){}
		}
		if(pstmtDetail !=null){
			try{
				pstmtDetail.close();
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
<title>ITEM �� �Է�</title>
</head>
<body>
<% if(occuredException !=null) { %>
������ �߻��Ͽ����ϴ�. : <%=occuredException.getMessage() %>
<% }
else {%>
�����Ͱ� ���������� ���Ծƿ� 
<% } %>
</body>
</html>