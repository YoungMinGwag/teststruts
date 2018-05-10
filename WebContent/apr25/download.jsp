<%@page import="kame.chap18.pds.model.IncreaseDownloadCountService"%>
<%@page import="kame.chap18.pds.model.FileDownloadHelper"%>
<%@page	trimDirectiveWhitespaces="true" %>
<%@page import="java.net.URLEncoder" %>
<%@page import="kame.chap18.pds.model.PdsItemNotFoundException"%>
<%@page import="jdk.nashorn.internal.runtime.RewriteException"%>
<%@page import="kame.chap18.pds.model.GetPdsItemService"%>
<%@page import="kame.chap18.pds.model.PdsItem"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
int id=Integer.parseInt(request.getParameter("id"));
try{
	PdsItem item=GetPdsItemService.getInstance().getPdsItem(id);

	response.reset();
	
	
	String fileName=new String(item.getFileName().getBytes("euc-kr"),"iso-8859-1");
	
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment; filename=\""+fileName+"\"");
	response.setHeader("content-Transfer-Encoding","binary");
	response.setContentLength((int)item.getFileSize());
	response.setHeader("pragma", "no-cache");
	response.setHeader("Expires", "-1;");
	
	FileDownloadHelper.copy(item.getRealPath(),response.getOutputStream());
	response.getOutputStream().close();
	IncreaseDownloadCountService.getInstance().increaseCount(id);
	
}catch(PdsItemNotFoundException ex){
	response.setStatus(HttpServletResponse.SC_NOT_FOUND);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>