<%@page import="kame.chap17.board.model.ArticleListModel"%>
<%@page import="kame.chap17.board.model.ListArticleService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//p파라미터로부터 읽어올 페이지 번호를 구한다.
	String pageNumberString=request.getParameter("p");
	int pageNumber=1;
	if(pageNumberString !=null && pageNumberString.length() >0){
		pageNumber=Integer.parseInt(pageNumberString);
	}
	ListArticleService listSerivce=ListArticleService.getInstatnce();
	//사용자가 요청한 페이지에 해당하는 ArticleListModel 객체를 구한다. 
	ArticleListModel articleListModel=listSerivce.getArticleList(pageNumber);
	//request객체의"listModel" 속성에 articleListModel 객체를 저장한다. 
	request.setAttribute("listModel", articleListModel);
	//페이제 목록 화면 하단에 보여줄 페이지 이동 링크의 페이지 시작 번호와 끝 번호를 계산해서 구한다.
	if(articleListModel.getTotalPageCount()>0){
		int beginPageNumber=(articleListModel.getRequestPage() -1)/10*10+1;
		int endPageNumber=beginPageNumber+9;
		if(endPageNumber > articleListModel.getTotalPageCount()){
			endPageNumber = articleListModel.getTotalPageCount();
		}
		//페이지 시작번호와 끝번호를 request 객체에 속성으로 저장한다. 
		request.setAttribute("beginPage",beginPageNumber);
		request.setAttribute("endPage",endPageNumber);
	}
%>
<!-- list_view.jsp 페이지로 이동한다. -->
<jsp:forward page="list_view.jsp"/>
