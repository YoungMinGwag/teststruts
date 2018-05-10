package kame.chap17.board.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.sun.javafx.css.CalculatedValue;

import kame.jdbc.connection.ConnectionProvider;
import ssol.jdbc.JdbcUtil;

public class ListArticleService {
	private static ListArticleService instance = new ListArticleService();
	
	public static ListArticleService getInstatnce() {
		return instance;
	}
	private ListArticleService() {
		
	}
	//���������� ������ �Խñ� ���� 10���� ����
	public static final int COUNT_PER_PAGE=10;
	
	public ArticleListModel getArticleList(int requestPageNumber) {
		if(requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : "+requestPageNumber);
		}
		ArticleDao articleDao=ArticleDao.getInstance();
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			//��ü �Խñ� ���� ���� 
			int totalArticleCount=articleDao.selectCount(conn);
			//��ü �Խñ��� 0���� ��� �⺻ ArticleListModel ��ü�� �����Ѵ�. 
			if(totalArticleCount ==0) {
				return new ArticleListModel();
			}
			//��ü ������ ������ ���Ѵ�. 
			int totalPageCount =calculateTotalPageCount(totalArticleCount);
			//��û�� ������ ��ȣ�� �̿��ؼ� �о�� ���� ���۹�ȣ�� �� ��ȣ�� ���Ѵ�.
			int firstRow=(requestPageNumber -1) * COUNT_PER_PAGE+1;
			int endRow=firstRow +COUNT_PER_PAGE-1;
			if(endRow > totalArticleCount) {
				endRow=totalArticleCount;
			}
			//articleDao.select �޼��带  �̿��ؼ� ������� ���࿡ ���ϴ� article����� ���Ѵ�.
			List<Article> articleList=articleDao.select(conn, firstRow, endRow);
			//article���,��û ������ ��ȣ,��ü ����������,���۰���,�� ���� �̿��ؼ� articleListModel ��ü�� �����ѵ� �����Ѵ�.
			ArticleListModel articleListView=new ArticleListModel(articleList,requestPageNumber,totalPageCount,firstRow,endRow);
			return articleListView;
		}catch(SQLException e) {
			throw new RuntimeException("DB���� �߻�: "+e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
			
		}
	}
	//��ü �Խñ� ������ ���� ��ü ������ ������ �����ִ� �޼��� 
	private int calculateTotalPageCount(int totalArticleCount) {
		if(totalArticleCount==0) {
			return 0;
			
		}
		int pageCount=totalArticleCount/COUNT_PER_PAGE;
		if(totalArticleCount % COUNT_PER_PAGE>0) {
			pageCount++;
		}
		return pageCount;
	}
}
