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
		alert("이름 입력해요");
		inputForm.guestName.focus();
		return false;
	}
	
	if(!inputForm.password.value){
		alert("암호 입력해요");
		inputForm.password.focus();
		return false;
	}
	
	if(!inputForm.message.value){
		alert("메시지 입력해요");
		inputForm.message.focus();
		return false;
	}
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 메시지 목록</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<form  action="writeMessage.jsp" method="post" name="test" onsubmit="return aa();">
		이름: <input type="text" name="guestName" /> 암호: <input
			type="password" name="password" /><br /> <br /> 
			메시지:<textarea rows="3" cols="60" name="message" style="margin: 0px; width: 326px; height: 189px;"></textarea>
		<br /> <input type="submit" value="메시지 남기기" />
	</form>
	<hr>
	<%
	 if(viewData.isEmpty()){
	%>
	등록된 메시지가 없습니다.
	<%}else{/*메시지 있는 경우 처리 시작*/ %>
	<table border="1">
		<%
	for(Message message:viewData.getMessageList()){
	%>
		<tr>
			<td>메시지 번호: <%=message.getId() %><br /> 손님 이름: <%=message.getGuestName() %><br />
				메시지: <%=message.getMessage() %><br /> <a
				href="confirmDeletion.jsp?messageId=<%=message.getId()%>">[삭제하기]</a>
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