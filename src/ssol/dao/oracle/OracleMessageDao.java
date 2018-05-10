package ssol.dao.oracle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import kame.chap13.dao.MessageDao;
import kame.chap13.model.Message;
import ssol.jdbc.JdbcUtil;

//"OracleMessageDao" Ŭ������ "MessageDao"Ŭ������ ��ӹ޵��� �����ϰ� �ִ�.
public class OracleMessageDao extends MessageDao{
	
	//insert ������ �����Ѵ�.
	//message_idĮ���� auto_increment�̹Ƿ� ���� �������� �ʴ´�. 
	public int insert(Connection conn,Message message) throws SQLException{
	
		PreparedStatement pstmt=null;
		try {
				pstmt=conn.prepareStatement("insert into guestbook_message_ym(message_id,quest_name,password,message) values(message_raypray_seq_ym.NEXTVAL,?,?,?)");
				pstmt.setString(1,message.getGuestName());
				pstmt.setString(2,message.getPassword());
				pstmt.setString(3,message.getMessage());
				return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}

	//limt ������ �̿��ؼ� ������ �ุŭ�� �����͸� �о�´�. 
	//�����Ͱ� �����Ұ�� "ResultSet"���κ��� "Message"��ü�� �����ؼ� "List"�� ������ ���� 
	//
	public List<Message> selectList(Connection conn,int firstRow, int endRow) throws SQLException{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement("select message_id,quest_name,password,message from ( "
										+"select rownum rnum, message_id, quest_name, password, message from ( "
										+"select * from guestbook_message_ym m order by m.message_id desc " 
										+ ") where rownum <= ? "
										+ ") where rnum >= ?");
			pstmt.setInt(1,endRow);
			pstmt.setInt(2,firstRow);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				List<Message> messageList=new ArrayList<Message>();
				
				do {
					messageList.add(super.makeMessageFromResultSet(rs));
				}while(rs.next());
				return messageList;
			}else {
				return Collections.emptyList();
			}
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
}
