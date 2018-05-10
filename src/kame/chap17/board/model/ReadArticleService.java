package kame.chap17.board.model;

import java.sql.Connection;
import java.sql.SQLException;

import kame.jdbc.connection.ConnectionProvider;
import ssol.jdbc.JdbcUtil;
import sun.management.jdp.JdpBroadcaster;

//�Խñ� �б� ����� �����Ѵ�.
//ArtcileDao�� �̿��ؼ� �Խñ� �����͸� �о���� �Խñ��� ������ ��� ��ȸ���� ������Ų��. 
public class ReadArticleService {

	private static ReadArticleService instance=new ReadArticleService();
	public static ReadArticleService getInsteance() {
		return instance;
	}
	private ReadArticleService() {
		
	}
	//�Խñ��� ��ȸ�ϰ� ��ȸ���� �������� �ִ� �޼���, ���������� selectArticle() ȣ��
	public Article readArticle(int articleId) throws ArticleNotFoundException{
		return selectArticle(articleId,true);
	}
	
	//���� �Խñ� ��ȸ ����� ������ �޼��� 
	private Article selectArticle(int articleId,boolean increasecount) throws ArticleNotFoundException{
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			ArticleDao articleDao =ArticleDao.getInstance();
			//ArticleDao�� �̿��ؼ� ������ ID�� article �� ���Ѵ�. 
			Article article=articleDao.selectById(conn, articleId);
			//Article�� �������� ���� ��� ���ܸ� �߻���Ų��. 
			if(article==null) {
				throw new ArticleNotFoundException("�Խñ��� �������� �ʽ��ϴ�."+articleId);
			}
			//increasecount�� true�� ��� ��ȸ���� ������Ų��. 
			if(increasecount) {
				//ȭ�鿡 ������ ��ȸ���� 1������Ų��. 
				articleDao.increaseReadCount(conn, articleId);
				article.setReadCount(article.getReadCount()+1);
				
			}
			return article;
		}catch(SQLException e) {
			throw new RuntimeException("DB ���� �߻�: "+e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
	//�Խñ۸� ��ȸ�ϰ� ��ȸ���� �������� ���� �ʴ� �޼��� 
	//�Խñ� ����ȭ���� �����ֱ����� Article ��ü�� �о�� ���� ��ȸ���� ���� �ȵ� 
	public Article getArticle(int articleId)throws ArticleNotFoundException{
		return selectArticle(articleId, false);
	}
}
