<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ImageBoard.ContentDBBean"%>
<%@page import="ImageBoard.ContentDataBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "ImageBoard.Theme" %>
<%@ page import = "ImageBoard.ThemeManager" %>
<%@ page import = "ImageBoard.ThemeManagerException" %>

 <%
	String themeId = request.getParameter("id");
	ThemeManager manager = ThemeManager.getInstance();
	Theme theme = manager.select(Integer.parseInt(themeId));
	
%>
<script>
	function writeSave(){
		if(document.comment.commentt.value==""){
			alert("코멘트를 입력하십시요.");
			document.comment.commentt.focus();
			return false;
		}
		
		if(document.comment.commenter.value==""){
			alert("작성자를 입력하십시요.");
			document.comment.commenter.focus();
			return false;
		}
		if(document.comment.passwd.value==""){
			alert("비밀번호를 입력하십시요.");
			document.comment.passwd.focus();
			return false;
		}
	}
</script>
<%
	String pageNum=request.getParameter("page");
	int pageSize=5;
	String cPageNum=request.getParameter("cPageNum");
	if(cPageNum==null){
		cPageNum="1";
	}
	int cCurrentPage=Integer.parseInt(themeId);
	int startRow=(cCurrentPage * 5) -4;
	int endRow=cCurrentPage * pageSize;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

		ContentDBBean cdb=ContentDBBean.getInstance();
		ArrayList comments=cdb.getComments(theme.getId(),startRow,endRow);
		int count=cdb.getCommentCount(theme.getId());
		
%>

<script type="text/javascript">
function dolm(img){
	 img1= new Image(); 
	 img1.src=(img); 
	 imgControll(img); 
}
function imgControll(img){
	if((img1.width!=0)&&(img1.height!=0)){ 
	    viewImage(img); 
	  } 
	  else{ 
	     controller="imgControll('"+img+"')"; 
	     intervalID=setTimeout(controller,20); 
	  } 
	}
	
function viewImage(img){ 
	 W=img1.width; 
	 H=img1.height; 
	 O="width="+W+",height="+H+",scrollbars=yes"; 
	 imgWin=window.open("","",O); 
	 imgWin.document.write("<html><head><title>:*: 이미지상세보기 :*::</title></head>");
	 imgWin.document.write("<body topmargin=0 leftmargin=0>");
	 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	 imgWin.document.close();
	}
</script>
<c:set var="theme" value="<%=theme %>"/>
<c:if test="${empty theme }">
존재하지 않는 테마 이미지입니다.
</c:if>
<c:if test="${! empty theme }">
<table width="100%" border="1" cellpadding="1" cellspacing="0" >
<tr>
	<td>제목</td>
	<td>${theme.title }</td>
</tr>
<tr>
	<td>작성자</td>
	<td>
	${theme.name }
	<c:if test="${empty theme.email }">
	<a href="mailto:${theme.email }">[이메일]</a>
	</c:if>
	</td>
</tr>
<c:if test="${! empty theme.image }">
<tr>
	<td colspan="2" align="center">
		<a href="javascript:viewLarge('/Javajob/image/${theme.image }')">
		<img src="/KH10/image/${theme.image }" width="200" border="0" title="클릭하시면 원본크기로 볼수있어" style="cursor:pointer;" >
		<br><input type="button" onclick="dolm('/KH10/image/${theme.image}')" value="크게보기"/>
		</a>
	</td>
</tr>
</c:if>
<tr>
	<td>내용</td>
	<td><pre>${theme.content }</pre></td>
</tr>
<tr>
	<td colspan="2">
	<a href="javascript:goReply()">[답변]</a>
	<a href="javascript:goModify()">[수정]</a>
	<a href="javascript:goDelete()">[삭제]</a>
	<a href="javascript:goList()">[목록]</a>
	</td>
</tr>
<form method=post action="test.jsp" name="comment"
			onsubmit="return writeSave()">
			<tr align=center>
				<td>코멘트 작성</td>
				<td colspan=2><textarea name=commentt rows="6" cols="40"></textarea>
					<input type=hidden name=content_num value=<%=theme.getId() %>>
					<input type=hidden name=p_num value=<%=themeId%>> <input
					type=hidden name=comment_num value=<%=count + 1%>></td>
				<td align=center>작성자<br> <input type=text name=commenter
					size=10><br> 비밀번호<br> <input type=password
					name=passwd size=10>
				<p>
						<input type=submit value=코멘트달기></td>
			</tr>
		</form>
</table>

<%if(count>0){ %>
            <p>
            <table width=500 border=0 cellspacing=0 cellpadding=0 align=center>
               <tr>
                  <td>코멘트 수: <%=comments.size() %>
               </tr>
               <%for(int i=0;i<comments.size();i++){
                     ContentDataBean dbc=(ContentDataBean)comments.get(i);
               %>
                  <tr>
                     <td align=left size=250>
                     &nbsp;<b><%=dbc.getCommenter() %>&nbsp;님</b> (<%=sdf.format(dbc.getReg_date())%>)
                     </td>
                     <td align=right size=250> 접속IP:<%=dbc.getIp() %>
                     &nbsp;<a href="delCommentForm.jsp?ctn=<%=dbc.getContent_num()%>&cmn=<%=dbc.getComment_num() %>&p_num=<%=page %>" >[삭제]</a>&nbsp;
                     </td>
                  </tr>   
                  <tr>
                     <td colspan=2><%=dbc.getCommentt() %><td>
               <%} %>
                  </tr>
                  
            </table>
            <%}
    %>
</c:if>

<script language="JavaScript">
function goRely(){
	document.move.action = "writeForm.jsp";
	document.move.submit();
}
function goModify(){
	document.move.action = "updateForm.jsp";
	document.move.submit();
}
function goDelete(){
	document.move.action = "deleteForm.jsp";
	document.move.submit();
}
function goList(){
	document.move.action = "list.jsp";
	document.move.submit();
}
function viewLarge(imgUrl){
	
}
</script>

<form name="move" method="post">
	<input type="hidden" name="id" value="${theme.id }">
	<input type="hidden" name="parentId" value="${theme.id }">
	<input type="hidden" name="groupId" value="${theme.groupId }">
	
	<input type="hidden" name="page" value="${param.page }">
	<c:forEach var="searchCond" items="${paramValues.search_cond }">
		<c:if test="${searchCond == 'title' }">
		<input type="hidden" name="search_cond" value="title">
		</c:if>
		<c:if test="${searchCond == 'name' }">
		<input type="hidden" name="search_cond" value="name">
		</c:if>
	</c:forEach>
	
	<c:if test="${! empty param.search_key }">
	<input type="hidden" name="search_key" value="${param.search_key }">
	</c:if>
</form>