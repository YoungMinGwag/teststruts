package kame.chap17.board.model;

import java.sql.Connection;
import java.sql.SQLException;

import kame.jdbc.connection.ConnectionProvider;
import ssol.jdbc.JdbcUtil;
import sun.management.jdp.JdpBroadcaster;

//게시글 읽기 기능을 제공한다.
//ArtcileDao를 이용해서 게시글 데이터를 읽어오고 게시글이 존재할 경우 조회수를 증가시킨다. 
public class ReadArticleService {

	private static ReadArticleService instance=new ReadArticleService();
	public static ReadArticleService getInsteance() {
		return instance;
	}
	private ReadArticleService() {
		
	}
	//게시글을 조회하고 조회수를 증가시켜 주는 메서드, 내부적으로 selectArticle() 호출
	public Article readArticle(int articleId) throws ArticleNotFoundException{
		return selectArticle(articleId,true);
	}
	
	//실제 게시글 조회 기능을 구현한 메서드 
	private Article selectArticle(int articleId,boolean increasecount) throws ArticleNotFoundException{
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			ArticleDao articleDao =ArticleDao.getInstance();
			//ArticleDao를 이용해서 지정한 ID의 article 을 구한다. 
			Article article=articleDao.selectById(conn, articleId);
			//Article이 존재하지 않을 경우 예외를 발생시킨다. 
			if(article==null) {
				throw new ArticleNotFoundException("게시글이 존재하지 않습니다."+articleId);
			}
			//increasecount가 true인 경우 조회수를 증가시킨다. 
			if(increasecount) {
				//화면에 보여질 조회수도 1증가시킨다. 
				articleDao.increaseReadCount(conn, articleId);
				article.setReadCount(article.getReadCount()+1);
				
			}
			return article;
		}catch(SQLException e) {
			throw new RuntimeException("DB 에러 발생: "+e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
	//게시글만 조회하고 조회수는 증가시켜 주지 않는 메서드 
	//게시글 수정화면을 보요주기위해 Article 객체를 읽어옴 따라서 조회수는 증가 안됨 
	public Article getArticle(int articleId)throws ArticleNotFoundException{
		return selectArticle(articleId, false);
	}
}
