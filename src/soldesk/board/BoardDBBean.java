package soldesk.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDBBean {
	
	private static BoardDBBean instance= new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	private BoardDBBean() {
		
	}
	
	private Connection getConnection() throws Exception{
		String jdbcDriver= "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	//writePro.jsp
	public void insertArticle(BoardDataBean article) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//�亯������ �Ϲݱ������� �����ؼ� �Է½����ִ� ����! 
		int num=article.getNum();
		int ref=article.getRef();
		int re_setp=article.getRe_setp();
		int re_level=article.getRe_level();
		int number=0;
		String sql="";
		
		try {
			conn = getConnection();
			pstmt=conn.prepareStatement("select max(num) from board_ym");
			//board ���̺�����  num�̶� �÷��� �ִ밪 
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				number=rs.getInt(1)+1;
			}
			else {
				number=1;
			}
			if(num!=0) {
				sql="update board_ym set re_setp=re_setp+1 where ref=? and re_setp> ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,ref);
				pstmt.setInt(2,re_setp);
				pstmt.executeUpdate();
				
				re_setp=re_setp+1;
				re_level=re_level+1;
			}
			else {
				ref=number;
				re_setp=0;
				re_level=0;
			}
			//������ �ۼ� 
			sql="insert into board_ym(num,writer,email,subject,passwd,reg_date,ref,re_setp,re_level,content,ip) values(board_num_ym.NEXTVAL,?,?,?,?,?,?,?,?,?,?)"; 
			// number default 0,
			 
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1,article.getWriter());
			 pstmt.setString(2,article.getEmail());
			 pstmt.setString(3,article.getSubject());
			 pstmt.setString(4,article.getPasswd());
			 pstmt.setTimestamp(5,article.getReg_date());
			 pstmt.setInt(6,ref);
			 pstmt.setInt(7,re_setp);
			 pstmt.setInt(8,re_level);
			 pstmt.setString(9,article.getContent());
			 pstmt.setString(10,article.getIp());
			 pstmt.executeUpdate();
		} catch(Exception ex) {
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
	}
	//list.jsp: ����¡�� ���ؼ� ��ü DB�� �Էµ� ���Ǽ��� �ʿ��ϴ�. 
	// ����... ���� 
	public int getArticleCount() throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int x=0;
		try {
			conn = getConnection();
			
			pstmt=conn.prepareStatement("select count(*) from board_ym");
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				x= rs.getInt(1);
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
		return x;
	}
	
	//list.jsp => pading !! DB �κ��� �������� ����� �޴´�.
	
	public List getArticles(int start,int end) throws  Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List articleList= null;
		
		try {
			conn= getConnection();
			//������ �̾п��� ������
			pstmt=conn.prepareStatement("select num,writer,email,subject,passwd,reg_date,ref,re_setp,re_level,content,ip,readcount,r  " +
			"from (select num,writer,email,subject,passwd,reg_date,ref,re_setp,re_level,content,ip,readcount,rownum r " +
			"from (select num,writer,email,subject,passwd,reg_date,ref,re_setp,re_level,content,ip,readcount " +
			"from board_ym order by ref desc, re_setp asc) order by ref desc, re_setp asc ) where r >= ? and r <= ? ");
			
			pstmt.setInt(1,start);
			pstmt.setInt(2,end);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				articleList =new ArrayList(end);
				do {
					BoardDataBean article=new BoardDataBean();
					
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_setp(rs.getInt("re_setp"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					articleList.add(article);
					
				}while(rs.next());
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
		return articleList;
	}
	//read.jsp DB�κ��� ������ �����͸� ���ҿ´�.
	public BoardDataBean getArticle(int num) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDataBean article =null;
		try {
			conn= getConnection();
			
			pstmt=conn.prepareStatement("update board_ym set readcount=readcount+1 where num = ?");
			
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
			
			pstmt=conn.prepareStatement("select * from board_ym where num = ?");
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				article=new BoardDataBean();
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
	//updateform.jsp �������� ������ �����͸� �����Ë� 
	public BoardDataBean updateGetArticle(int num) throws Exception{
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDataBean article=null;
		
		try {
			conn=getConnection();
			
			pstmt=conn.prepareStatement("select * from board_ym where num= ?");
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				article =new BoardDataBean();
				
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
	//���� �����͸� �����ϴ� �޼ҵ�  updatepro.jsp
	public int updateArticle(BoardDataBean article) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String dbpasswd="";
		String sql="";
		int x=-1;
		
		 try {
	            conn = getConnection();
	           
	    pstmt = conn.prepareStatement(
	            "select passwd from board_ym where num = ?");
	            pstmt.setInt(1, article.getNum());
	            rs = pstmt.executeQuery();
	           
	    if(rs.next()){
	dbpasswd= rs.getString("passwd");
	if(dbpasswd.equals(article.getPasswd())){
	      sql="update board_ym set writer=?,email=?,subject=?,passwd=?";
	      sql+=",content=? where num=?";
	                pstmt = conn.prepareStatement(sql);

	                pstmt.setString(1, article.getWriter());
	                pstmt.setString(2, article.getEmail());
	                pstmt.setString(3, article.getSubject());
	                pstmt.setString(4, article.getPasswd());
	                pstmt.setString(5, article.getContent());
	pstmt.setInt(6, article.getNum());
	                pstmt.executeUpdate();
	x= 1;
	}else{
					x=0;
				}
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
		
		
		return x;
	}
	
	public int deleteArticle(int num,String passwd) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String dbpasswd="";
		int x=-1;
		try {
			conn=getConnection();
			
			pstmt=conn.prepareStatement("select passwd from board_ym where num = ?");
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd =rs.getString("passwd");
				if(dbpasswd.equals(passwd)) {
					pstmt=conn.prepareStatement("delete from board_ym where num=?");
					pstmt.setInt(1,num);
					pstmt.executeUpdate();
					x=1; //�ۻ��� ����
				}
				else {
					x=0; //��й�ȣ Ʋ��
				}
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
		
		
		return x;
	}
	

	
	
}