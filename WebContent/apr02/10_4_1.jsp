<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String memberid=(String) session.getAttribute("MEMBERID");
	boolean login =memberid==null ?false:true;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 폼</title>
</head>
<body>
	<form name="form"
		action="<%= request.getContextPath() %>/apr02/10_4.jsp" method="post">

		아이디 <input type="text" name="id" size="10"> 암호 <input
			type="password" name="password" size="10"> 아이디 저장 <input
			type="checkbox" name="checkbox" onclick="aa(this);"> <input
			type="submit" value="로그인">

	</form>


</body>
</html>

<script> 
	function aa(chckbox){
		if(chckbox.checked == true){
			document.form.id.value='<%=memberid%>';
			document.form.checkbox.checked="checked";
		}
		
	}
	
 </script>
<!-- 
 
 if(document.form.checkbox.checked ==true){
	     document.form.id.value='<%=memberid%>';
	}   
	else if(document.form.checkbox.checked ==false ){
	   memberid.invalidate();
	}
	
		var chk1 =document.form.checkbox.checked;
	
	if(chk1 ==true){
		document.form.id.value='<%=memberid%>';
	}
	if(chk1 ==false){
		document.getElementById("id").value='';
	}
	
	// Check
document.getElementById("checkbox").checked = true;

//  Uncheck
document.getElementById("checkbox").checked = false;
  -->
