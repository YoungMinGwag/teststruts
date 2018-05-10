package ImageBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import soldesk.board.BoardDBBean;
import soldesk.board.BoardDataBean;

public class ImageBoardDBBean {
	
	
private static ImageBoardDBBean instance= new ImageBoardDBBean();
	
	public static ImageBoardDBBean getInstance() {
		return instance;
	}
	
	private ImageBoardDBBean() {
		
	}
	
	private Connection getConnection() throws Exception{
		String jdbcDriver= "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	//read.jsp DB로부터 한줄의 데이터를 가죠온다.
		public ImageBoardDataBean getArticle(int num) throws Exception{
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ImageBoardDataBean article =null;
			try {
				conn= getConnection();
				
				pstmt=conn.prepareStatement("update board_ym set readcount=readcount+1 where num = ?");
				
				pstmt.setInt(1,num);
				pstmt.executeUpdate();
				
				pstmt=conn.prepareStatement("select * from board_ym where num = ?");
				pstmt.setInt(1,num);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					article=new ImageBoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_setp(rs.getInt("re_setp"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
				}
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				if(rs !=null) {
					try {
						rs.close();
					}catch(SQLException ex) {}
				}
				if(pstmt !=null) {
					try {
						pstmt.close();
					}catch(SQLException ex) {}
				}
				if(conn !=null) {
					try {
						conn.close();
					}catch(SQLException ex) {}
				}
			}
			
			return article;
		}
}
