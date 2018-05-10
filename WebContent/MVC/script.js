function writeSave(){
	if(document.writeform.writer.value==""){
		alert("작성자입력");
		document.writeform.writer.focus();
		return false;
	}
	if(document.writeform.subject.value==""){
		alert("제목을 입력하십시오.");
		document.writeform.subject.focus();
		return false;		
	}
	if(document.writeform.email.value==""){
		alert("이메일을 입력하십시오.");
		document.writeform.email.focus();
		return false;		
	}
	if(document.writeform.content.value==""){
		alert("내용을 입력하십시오.");
		document.writeform.content.focus();
		return false;		
	}
	if(document.writeform.passwd.value==""){
		alert("비밀번호를 입력하십시오.");
		document.writeform.passwd.focus();
		return false;		
	}
	
}
