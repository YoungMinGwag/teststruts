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

//"OracleMessageDao" 클래스는 "MessageDao"클래스를 상속받도록 구현하고 있다.
public class OracleMessageDao extends MessageDao{
	
	//insert 쿼리를 수행한다.
	//message_id칼럼은 auto_increment이므로 값을 지정하지 않는다. 
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

	//limt 쿼리를 이요해서 지정한 행만큼의 데이터를 읽어온다. 
	//데이터가 존재할경우 "ResultSet"으로부터 "Message"객체를 생성해서 "List"에 저장후 리턴 
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
