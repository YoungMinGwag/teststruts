<%@page import="soldesk.logon.LogonDataBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="soldesk.logon.LogonDBBean" %>
<%@ include file="/apr06/color.jsp"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String name = request.getParameter("name");
	String jumin1 =request.getParameter("jumin1");
	String jumin2=request.getParameter("jumin2");
	
	LogonDBBean manager = LogonDBBean.getInstance();
	String c = manager.test(name,jumin1,jumin2);

	int check=manager.test3(name,jumin1,jumin2);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body bgcolor="<%=bodyback_c%>" >
 		<%
 		if(check==1){
 		%>
				<table width="270" border="0" cellspacing="0" cellpadding="5">
						<tr bgcolor="<%=title_c%>">
							<td height="39">비밀번호 =  <%=c%> </td> 
							
						</tr>
					</table>
					
				<form action="test5.jsp" method="post" name="checkForm">
						<table width="270" border="0" cellspacing="0" cellpadding="5">
							<tr>
								<td bgcolor="<%=value_c%>" align="center">ID 찾기
									<p>
										<input type="text" size="10" maxlength="12" name="id"> <input
											type="submit" value="비밀번호 입력">
								</td>
							</tr>
						</table>
					</form>
					
			<%
 		}else{
			%>
			<table width="270" border="0" cellspacing="0" cellpadding="5">
						<tr bgcolor="<%=title_c%>">
							<td height="39">이름,주민번호를 다시 입력하세요</td> 
							
						</tr>
					</table>
					
		<%
 		}
		%>
</body>
</html>