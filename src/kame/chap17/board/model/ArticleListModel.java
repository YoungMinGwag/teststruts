package kame.chap17.board.model;

import java.util.ArrayList;
import java.util.List;

//�Խñ� ��� ȭ���� �����ϴµ� �ʿ��� ������ �����Ѵ�.
//�Խñ�(article) ���,��û ������ ��ȣ,��ü ������ ���� ���� ������ �����Ѵ�. 

public class ArticleListModel {
	
	private List<Article> articleList; // ȭ�鿡 ������ �Խñ� ��� 
	private int requestPage; // ����ڰ� ��û�� ������ ��ȣ
	private int totalPagecount; //��ü ������ ����
	private int startRow;// ���� �Խñ� ����� ������  
	private int endRow; // ���� �Խñ� ����� ���� 
	
	public ArticleListModel() {
		this(new ArrayList<Article>(),0,0,0,0);
	}
	
	public ArticleListModel(List<Article> articleList, int requestPageNumber, int totalPageCount,
							int startRow ,int endRow){
		this.articleList = articleList;
		this.requestPage=requestPageNumber;
		this.totalPagecount=totalPageCount;
		this.startRow=startRow;
		this.endRow=endRow;
	}
	public List<Article> getArticleList(){
		return articleList;
	}
	public boolean isHasArticle() {
		return ! articleList.isEmpty();
	}
	public int getRequestPage() {
		return  requestPage;
	}
	public int getTotalPageCount() {
		return totalPagecount;
	}
	
	public int getStartRow() {
		return startRow;
	}
	public int getEndRow() {
		return endRow;
	}
}
