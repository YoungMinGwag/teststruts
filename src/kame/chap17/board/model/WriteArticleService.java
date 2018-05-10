package kame.chap17.board.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Date;
//게시글 쓰기 기능을 실행한다.
//idGenerator를 이용해서 신규 그룹 번호를 생성하고, 
//ArticleDao를 이용해서 DB에 삽입한다. 
import javax.management.RuntimeErrorException;

import kame.jdbc.connection.ConnectionProvider;
import ssol.jdbc.JdbcUtil;

public class WriteArticleService {

	private static WriteArticleService instance=new WriteArticleService();
	public static WriteArticleService getInstance() {
		return instance;
	}
	private WriteArticleService() {
		
	}
	public Article write(WritingRequest writingRequest) throws IdGenerationFailedException{
		int groupId=IdGenerator.getInstance().getnerateNextId("article_ym");
		
		Article article=writingRequest.toArticle();
		article.setGroupId(groupId);
		article.setPostingDate(new Date());
		DecimalFormat decimalFormat =new DecimalFormat("0000000000");
		article.setSequenceNumber(decimalFormat.format(groupId)+"999999");
		
		Connection conn=null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			int articleId=ArticleDao.getInstance().insert(conn, article);
			if(articleId== -1) {
				JdbcUtil.rollback(conn);
				throw new RuntimeException("DB 삽입 안됨:"+articleId);
				
			}
			conn.commit();
			article.setId(articleId);
			return article;
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException("DB에러 : "+e.getMessage(),e);
		}finally {
			if(conn !=null) {
				try {
					conn.setAutoCommit(true);
					
				}catch (SQLException e) {
				}
				JdbcUtil.close(conn);
			}
		}
	}
}
