package kame.chap13.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import kame.chap13.model.Message;
import ssol.jdbc.JdbcUtil;

//DB ���̺� ���� CRUD(create,read(select), update ,delete)������ �������ִ� �޼���
// �߻� Ŭ�����μ� �� DBMS�� �˸��� ������ �����ϴ� DAO Ŭ���� "MessageDao" Ŭ������ ��� �޾� ����

public abstract class MessageDao {
	//DB ���̺� �����͸� �߰��ϴ� Insert ������ �����ϴ� �޼��� ���� 
	public abstract int insert(Connection conn,Message message) throws SQLException;
	
	//DB���̺��� ������ �ֿ�Ű�� �ش��ϴ� ���� �����͸� �о�´�. 
	//�о�� �����͸� "makeMessgeFromResultSet"�޼��带 ����ؼ� Message ��ü�� �����Ѵ�.
	//�����ѵ� "Message"��ü�� �����Ѵ�. �ֿ�Ű�� �����Ͱ� ���� ��� null�� �����Ѵ�. 
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
	//ResultSet���κ��� �����͸� �о�� Message��ü�� �����ѵ� Message ��ü�� �����Ѵ�. 
	public Message makeMessageFromResultSet(ResultSet rs) throws SQLException{
		Message message=new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("quest_name")); //!
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		return message;
	}
	
	//DB���̺� ����� ���� ������ �����Ѵ�. 
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
	
	//DB���̺�κ��� ������(firstRow) ����(endRow)�� �ش��ϴ� �޽��� ����� �о���� �޼��� ����
	public abstract List<Message> selectList(Connection conn,int firstRow, int endRow) throws SQLException;
	
	//DB���̺��� ������ �ֿ�Ű�� �ش��ϴ� ���� �����͸� �����ϴ� ������ �����ϰ�
	//������ ���� ������ �����Ѵ�. 
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
