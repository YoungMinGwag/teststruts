package kame.chap17.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.xml.internal.ws.Closeable;

import ssol.jdbc.JdbcUtil;

//ListArticleService Ŭ������ ��û�� �������� �ش��ϴ� �Խñ� ����� �о���� ���ؼ� DAO Ŭ���� �� ��� 

public class ArticleDao {

	private static ArticleDao instance=new ArticleDao();
	
	public static ArticleDao getInstance() {
		return instance;
	}
	private ArticleDao() {
		
	}
	//�Խñ��� ��ü ������ ���Ѵ�.
	public int selectCount(Connection conn) throws SQLException{
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt=conn.createStatement();
			//article_ym ���̺��� ��ü ���� ������ ���Ѵ�. 
			rs=stmt.executeQuery("select count(*) from article_ym");
			rs.next();
			return rs.getInt(1);
		}finally {
			JdbcUtil.close(stmt);
			JdbcUtil.close(rs);
		}
	}
	//��ü�Խñ� �߿� �� ������� ���࿡ ���ϴ� �Խñ��� �о�´�. 
	public List<Article> select(Connection conn,int firstRow,int endRow) throws SQLException{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//article �����͸� sequence_no�� ������������ �����ؼ� ������� ���࿡ �ش��ϴ� �ุ ���Ѵ�.
			pstmt=conn.prepareStatement("select article_id,group_id,sequence_no,posting_date,read_count,writer_name,password,title from ( "
					+ " select rownum rnum,article_id,group_id,sequence_no,posting_date,read_count,writer_name,password,title from ( "
					+ " select * from article_ym m order by m.sequence_no desc "
					+ " ) where rownum <= ? "
					+ ") where rnum >= ?");
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs=pstmt.executeQuery();
			//�����Ͱ� �������� ���� ��� �� List�� �����Ѵ�.
			if(!rs.next()) {
				return Collections.emptyList();
	
			}
			List<Article> articleList=new ArrayList<Article>();
			//�����Ͱ� ������ ��� �����ͷκ��� Article ��ü�� ������ articleList�� �����ϰ�,
			//articleList ��ü�� �����Ѵ�. 
			do {
				Article article=makeArticleFromResultSet(rs,false);
				articleList.add(article);
			}while(rs.next());
			return articleList;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	//ResultSet���� ���� �����͸� �о�� Artilce ��ü�� ������ �ش�. 
	// readContent�� ���� ���� article_ym ���̺�κ��� "content" Į���� ���� �о������ ���θ� �����Ѵ�.
	//�Խñ� ����� �о�ö� ���Ǵ� ArticleDao.select()�޼���� �Խñ� ������ �ʿ����� �����Ƿ� 
	//readContent �Ķ���� ������ false�� �����Ѵ�. 
	
	private Article makeArticleFromResultSet(ResultSet rs,boolean readContent) throws SQLException{
		Article article=new Article();
		article.setId(rs.getInt("article_id"));
		article.setGroupId(rs.getInt("group_id"));
		article.setSequenceNumber(rs.getString("sequence_no"));
		article.setPostingDate(rs.getTimestamp("posting_date"));
		article.setReadCount(rs.getInt("read_Count"));
		article.setWriterName(rs.getString("writer_name"));
		article.setPassword(rs.getString("password"));
		article.setTitle(rs.getString("title"));
		if(readContent) {
			article.setContent(rs.getString("content"));
			
		}
		return article;
	}
	// Article ��ü�� article_ym ���̺� ������ �ִ� insert ������ �����Ѵ�
	//insert() �޼���� �Ķ���ͷ� ���޹��� Article ��ü�κ��� ���� �о�� insert ������ 
	//�̿��ؼ�  article �����͸� �����Ѵ�.
	//������ ���Կ� �����ϸ� �űԷ� ���Ե� �������� Ű ���� �����Ѵ�. 
	public int insert(Connection conn , Article article)throws SQLException{
		PreparedStatement pstmt=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement("insert into article_ym " 
					+ "(article_id,group_id, sequence_no,posting_date,read_count, " 
					+ "writer_name,password ,title,content) " 
					+ "values(article_id_seq_ym.NEXTVAL,?,?,?,0,?,?,?,?)");
			pstmt.setInt(1,article.getGroupId());
			pstmt.setString(2,article.getSequenceNumber());
			pstmt.setTimestamp(3, new Timestamp(article.getPostingDate().getTime()));
			pstmt.setString(4,article.getWriterName());
			pstmt.setString(5,article.getPassword());
			pstmt.setString(6,article.getTitle());
			pstmt.setString(7,article.getContent());
			int insertedCount=pstmt.executeUpdate();
			if(insertedCount >0) {
				stmt=conn.createStatement();
				rs=stmt.executeQuery("select article_id_seq_ym.CURRVAL from dual");
				if(rs.next()) {
					return rs.getInt(1);
				}
				}
				return -1;
			}
		finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}

	}
	//�ش� ID�� �ش��ϴ� �Խñ���DB ���̺��� �о����, ��ȸ���� ���������ִ� ����� �����Ѵ�. 
	//������ ID�� �ش��ϴ� �����͸� ���̺��� �о���� Article ��ü�� �����ѵ� �����Ѵ�.
	//�������� ���� ��� null�� �����Ѵ�. 
	public Article selectById(Connection conn,int articleId)throws SQLException{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//������ ID�� �ش��ϴ� �����͸� ��ȸ�ϴ� ���� ���� 
		try {
			pstmt=conn.prepareStatement("select * from article_ym where article_id= ? ");
			pstmt.setInt(1,articleId);
			rs=pstmt.executeQuery();
			//�����Ͱ� �������� ���� ��� null ���� 
			if(!rs.next()) {
				return null;
			}
			//�����Ͱ� ������ ��� ResultSet���κ��� Article ��ü�� �����ѵ� ���� 
			Article article=makeArticleFromResultSet(rs, true);
			return article;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	//������ID�� �ش��ϴµ������� read_count Į�� ���� 1 ������Ų��. 
	public void increaseReadCount(Connection conn,int articleId)throws SQLException{
		PreparedStatement pstmt=null;
		try {
			//read_countĮ���� ���� 1 ������Ű�� ���� ���� 
			pstmt=conn.prepareStatement("update article_ym set read_count=read_count+1 where article_id= ?");
			pstmt.setInt(1, articleId);
			pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	//�亯 ���� ����� �����ϴ� �� �ʿ��� DB���� ����� �����Ѵ�. 
	//������ �ΰ� ���̿� �ִ� sequence_no Į���� ���� �ּҰ��� ���� �ִ� ����� ����
	
	public String selectLastSequenceNumber(Connection conn, String searchMaxSeqNum,String searchMinSeqNum) throws SQLException{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement("select min(SEQUENCE_NO) from article_ym where SEQUENCE_NO < ? and SEQUENCE_NO >= ?");
			pstmt.setString(1,searchMaxSeqNum);
			pstmt.setString(2,searchMinSeqNum);
			rs=pstmt.executeQuery();
			if(!rs.next()) {
				return null;
			}
			return rs.getString(1);
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	//DB�����͸� �����Ѵ�. 
	
	public int update(Connection conn,Article article)throws SQLException{
	PreparedStatement pstmt=null;
	try {
		pstmt=conn.prepareStatement("update article_ym set title=?,content=? where article_id=?");
		pstmt.setString(1,article.getTitle());
		pstmt.setString(2, article.getContent());
		pstmt.setInt(3, article.getId());
		return pstmt.executeUpdate();
	}finally {
		JdbcUtil.close(pstmt);
	}
	}
	public void delete(Connection conn,int articleId) throws SQLException{
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from article_ym where article_id = ?");
			pstmt.setInt(1, articleId);
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
