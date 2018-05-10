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

//ListArticleService 클래스는 요청한 페이지에 해당하는 게시글 목록을 읽어오기 위해서 DAO 클래스 를 사용 

public class ArticleDao {

	private static ArticleDao instance=new ArticleDao();
	
	public static ArticleDao getInstance() {
		return instance;
	}
	private ArticleDao() {
		
	}
	//게시글의 전체 개수를 구한다.
	public int selectCount(Connection conn) throws SQLException{
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt=conn.createStatement();
			//article_ym 테이블에서 전체 행의 개수를 구한다. 
			rs=stmt.executeQuery("select count(*) from article_ym");
			rs.next();
			return rs.getInt(1);
		}finally {
			JdbcUtil.close(stmt);
			JdbcUtil.close(rs);
		}
	}
	//전체게시글 중에 서 시작행과 끝행에 속하는 게시글을 읽어온다. 
	public List<Article> select(Connection conn,int firstRow,int endRow) throws SQLException{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//article 데이터를 sequence_no의 내림차순으로 정렬해서 시작행과 끝행에 해당하는 행만 구한다.
			pstmt=conn.prepareStatement("select article_id,group_id,sequence_no,posting_date,read_count,writer_name,password,title from ( "
					+ " select rownum rnum,article_id,group_id,sequence_no,posting_date,read_count,writer_name,password,title from ( "
					+ " select * from article_ym m order by m.sequence_no desc "
					+ " ) where rownum <= ? "
					+ ") where rnum >= ?");
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs=pstmt.executeQuery();
			//데이터가 존재하지 않을 경우 빈 List를 리턴한다.
			if(!rs.next()) {
				return Collections.emptyList();
	
			}
			List<Article> articleList=new ArrayList<Article>();
			//데이터가 존재할 경우 데이터로부터 Article 객체를 가져와 articleList에 저장하고,
			//articleList 객체를 리턴한다. 
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
	
	//ResultSet으로 부터 데이터를 읽어와 Artilce 객체를 생성해 준다. 
	// readContent의 값에 따라서 article_ym 테이블로부터 "content" 칼럼의 값을 읽어올지의 여부를 결정한다.
	//게시글 목록을 읽어올때 사용되는 ArticleDao.select()메서드는 게시글 내용이 필요하지 않으므로 
	//readContent 파라미터 값으로 false를 전달한다. 
	
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
	// Article 객체를 article_ym 테이블에 삽입해 주는 insert 쿼리를 실행한다
	//insert() 메서드는 파라미터로 전달받은 Article 객체로부터 값을 읽어와 insert 쿼리를 
	//이용해서  article 데이터를 삽입한다.
	//데이터 삽입에 성공하면 신규로 삽입된 데이터의 키 값을 리턴한다. 
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
	//해당 ID에 해당하는 게시글을DB 테이블에서 읽어오고, 조회수를 증가시켜주는 기능을 제공한다. 
	//지정한 ID에 해당하는 데이터를 테이블에서 읽어오ㅘ Article 객체를 생성한뒤 리턴한다.
	//존재하지 않을 경우 null을 리턴한다. 
	public Article selectById(Connection conn,int articleId)throws SQLException{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//지정한 ID에 해당하는 데이터를 조회하는 쿼리 실행 
		try {
			pstmt=conn.prepareStatement("select * from article_ym where article_id= ? ");
			pstmt.setInt(1,articleId);
			rs=pstmt.executeQuery();
			//데이터가 존재하지 않을 경우 null 리턴 
			if(!rs.next()) {
				return null;
			}
			//데이터가 존재할 경우 ResultSet으로부터 Article 객체를 생성한뒤 리턴 
			Article article=makeArticleFromResultSet(rs, true);
			return article;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	//지정한ID에 해당하는데이터의 read_count 칼럼 값을 1 증가시킨다. 
	public void increaseReadCount(Connection conn,int articleId)throws SQLException{
		PreparedStatement pstmt=null;
		try {
			//read_count칼럼의 값을 1 증가시키는 쿼리 실행 
			pstmt=conn.prepareStatement("update article_ym set read_count=read_count+1 where article_id= ?");
			pstmt.setInt(1, articleId);
			pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	//답변 쓰기 기능을 구현하는 데 필요한 DB관련 기능을 제공한다. 
	//지정한 두값 사이에 있는 sequence_no 칼럼의 값중 최소값을 구해 주는 기능을 제공
	
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
	//DB데이터를 수정한다. 
	
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
