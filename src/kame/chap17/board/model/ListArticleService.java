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
	//한페이지에 보여줄 게시글 수를 10개로 설정
	public static final int COUNT_PER_PAGE=10;
	
	public ArticleListModel getArticleList(int requestPageNumber) {
		if(requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : "+requestPageNumber);
		}
		ArticleDao articleDao=ArticleDao.getInstance();
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			//전체 게시글 개수 구함 
			int totalArticleCount=articleDao.selectCount(conn);
			//전체 게시글이 0개인 경우 기본 ArticleListModel 객체를 리턴한다. 
			if(totalArticleCount ==0) {
				return new ArticleListModel();
			}
			//전체 페이지 개수를 구한다. 
			int totalPageCount =calculateTotalPageCount(totalArticleCount);
			//요청한 페이지 번호를 이용해서 읽어올 행의 시작번호와 끝 번호를 구한다.
			int firstRow=(requestPageNumber -1) * COUNT_PER_PAGE+1;
			int endRow=firstRow +COUNT_PER_PAGE-1;
			if(endRow > totalArticleCount) {
				endRow=totalArticleCount;
			}
			//articleDao.select 메서드를  이용해서 시작행과 끝행에 속하는 article목록을 구한다.
			List<Article> articleList=articleDao.select(conn, firstRow, endRow);
			//article목록,요청 페이지 번호,전체 페이지개수,시작과행,끝 행을 이용해서 articleListModel 객체를 생성한뒤 리턴한다.
			ArticleListModel articleListView=new ArticleListModel(articleList,requestPageNumber,totalPageCount,firstRow,endRow);
			return articleListView;
		}catch(SQLException e) {
			throw new RuntimeException("DB에러 발생: "+e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
			
		}
	}
	//전체 게시글 개수로 부터 전체 페이지 개수를 구해주는 메서드 
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
