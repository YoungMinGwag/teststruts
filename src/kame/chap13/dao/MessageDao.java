package kame.chap13.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import kame.chap13.model.Message;
import ssol.jdbc.JdbcUtil;

//DB 테이블에 대한 CRUD(create,read(select), update ,delete)쿼리를 실행해주는 메서드
// 추상 클래스로서 각 DBMS에 알맞은 쿼리를 실행하는 DAO 클래스 "MessageDao" 클래스를 상속 받아 구현

public abstract class MessageDao {
	//DB 테이블에 데이터를 추가하는 Insert 쿼리를 수행하는 메서드 정의 
	public abstract int insert(Connection conn,Message message) throws SQLException;
	
	//DB테이블에서 지정한 주요키에 해당하는 행의 데이터를 읽어온다. 
	//읽어온 데이터를 "makeMessgeFromResultSet"메서드를 사용해서 Message 객체에 저장한다.
	//저장한뒤 "Message"객체를 리턴한다. 주요키에 데이터가 없을 경우 null을 리턴한다. 
	public Message select(Connection conn, int messageId) throws SQLException{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement("select * from guestbook_message_ym where message_id=?");
			pstmt.setInt(1,messageId);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return makeMessageFromResultSet(rs);
			}
			else {
				return null;
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	//ResultSet으로부터 데이터를 읽어와 Message객체에 저장한뒤 Message 객체를 리턴한다. 
	public Message makeMessageFromResultSet(ResultSet rs) throws SQLException{
		Message message=new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("quest_name")); //!
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		return message;
	}
	
	//DB테이블에 저장된 행의 개수를 리턴한다. 
	public int selectCount(Connection conn) throws SQLException{
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery("select count(*) from guestbook_message_ym");
			rs.next();
			return rs.getInt(1);
		}finally {
			JdbcUtil.close(stmt);
			JdbcUtil.close(rs);
		}
	}
	
	//DB테이블로부터 시작행(firstRow) 끝행(endRow)에 해당하는 메시지 목록을 읽어오는 메서드 정의
	public abstract List<Message> selectList(Connection conn,int firstRow, int endRow) throws SQLException;
	
	//DB테이블에서 지정한 주요키에 해당하는 행의 데이터를 삭제하는 쿼리를 실행하고
	//삭제된 행의 개수를 리턴한다. 
	public int delete(Connection conn,int messageId) throws SQLException{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement("delete from guestbook_message_ym where message_id=?");
			pstmt.setInt(1,messageId);
			return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
}
