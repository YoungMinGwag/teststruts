<%@page import="kame.chap17.board.model.ArticleListModel"%>
<%@page import="kame.chap17.board.model.ListArticleService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//p�Ķ���ͷκ��� �о�� ������ ��ȣ�� ���Ѵ�.
	String pageNumberString=request.getParameter("p");
	int pageNumber=1;
	if(pageNumberString !=null && pageNumberString.length() >0){
		pageNumber=Integer.parseInt(pageNumberString);
	}
	ListArticleService listSerivce=ListArticleService.getInstatnce();
	//����ڰ� ��û�� �������� �ش��ϴ� ArticleListModel ��ü�� ���Ѵ�. 
	ArticleListModel articleListModel=listSerivce.getArticleList(pageNumber);
	//request��ü��"listModel" �Ӽ��� articleListModel ��ü�� �����Ѵ�. 
	request.setAttribute("listModel", articleListModel);
	//������ ��� ȭ�� �ϴܿ� ������ ������ �̵� ��ũ�� ������ ���� ��ȣ�� �� ��ȣ�� ����ؼ� ���Ѵ�.
	if(articleListModel.getTotalPageCount()>0){
		int beginPageNumber=(articleListModel.getRequestPage() -1)/10*10+1;
		int endPageNumber=beginPageNumber+9;
		if(endPageNumber > articleListModel.getTotalPageCount()){
			endPageNumber = articleListModel.getTotalPageCount();
		}
		//������ ���۹�ȣ�� ����ȣ�� request ��ü�� �Ӽ����� �����Ѵ�. 
		request.setAttribute("beginPage",beginPageNumber);
		request.setAttribute("endPage",endPageNumber);
	}
%>
<!-- list_view.jsp �������� �̵��Ѵ�. -->
<jsp:forward page="list_view.jsp"/>
