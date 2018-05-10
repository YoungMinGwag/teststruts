<%@page import="kame.chap18.pds.model.PdsItemListModel"%>
<%@page import="kame.chap18.pds.model.ListPdsItemService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNumberString = request.getParameter("p");
	int pageNumber = 1; 
	if (pageNumberString != null && pageNumberString.length() > 0) {
		pageNumber = Integer.parseInt(pageNumberString);
	}
	ListPdsItemService listSerivce = ListPdsItemService.getInstance();
	PdsItemListModel itemListModel = listSerivce.getPdsItemList(pageNumber);
	
	request.setAttribute("listModel", itemListModel);
	
	if (itemListModel.getTotalPageCount() > 0) {
		int beginPageNumber = (itemListModel.getRequestPage() - 1) / 10 * 10 + 1;
		int endPageNumber = beginPageNumber + 9;
		if (endPageNumber > itemListModel.getTotalPageCount()) {
			endPageNumber = itemListModel.getTotalPageCount();
		}
		request.setAttribute("beginPage", beginPageNumber);
		request.setAttribute("endPage", endPageNumber);
	}
%>
<jsp:forward page="list_view.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>