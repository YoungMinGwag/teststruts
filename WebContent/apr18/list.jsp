<%@page import="kame.chap13.model.Message"%>
<%@page import="kame.chap13.model.MessageListView"%>
<%@page import="kame.chap13.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
String pageNumberStr=request.getParameter("page");
int pageNumber=1;
if(pageNumberStr !=null){
	pageNumber=Integer.parseInt(pageNumberStr);
}
GetMessageListService messageListService=GetMessageListService.getInstance();
MessageListView viewData=messageListService.getMessageList(pageNumber);
%>
<script language="javascript">
function aa(){
	inputForm =eval("document.test");
	if(!inputForm.guestName.value){
		alert("�̸� �Է��ؿ�");
		inputForm.guestName.focus();
		return false;
	}
	
	if(!inputForm.password.value){
		alert("��ȣ �Է��ؿ�");
		inputForm.password.focus();
		return false;
	}
	
	if(!inputForm.message.value){
		alert("�޽��� �Է��ؿ�");
		inputForm.message.focus();
		return false;
	}
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �޽��� ���</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<form  action="writeMessage.jsp" method="post" name="test" onsubmit="return aa();">
		�̸�: <input type="text" name="guestName" /> ��ȣ: <input
			type="password" name="password" /><br /> <br /> 
			�޽���:<textarea rows="3" cols="60" name="message" style="margin: 0px; width: 326px; height: 189px;"></textarea>
		<br /> <input type="submit" value="�޽��� �����" />
	</form>
	<hr>
	<%
	 if(viewData.isEmpty()){
	%>
	��ϵ� �޽����� �����ϴ�.
	<%}else{/*�޽��� �ִ� ��� ó�� ����*/ %>
	<table border="1">
		<%
	for(Message message:viewData.getMessageList()){
	%>
		<tr>
			<td>�޽��� ��ȣ: <%=message.getId() %><br /> �մ� �̸�: <%=message.getGuestName() %><br />
				�޽���: <%=message.getMessage() %><br /> <a
				href="confirmDeletion.jsp?messageId=<%=message.getId()%>">[�����ϱ�]</a>
			</td>
		</tr>
		<%
	}
	%>
	</table>
	<%
	for(int i=1;i<=viewData.getPageTotalCount();i++){
	%>
	<a href="list.jsp?page<%=i%>">[<%=i%>]
	</a>
	<%
	}
	%>
	<%
	}
	%>
</body>
</html>