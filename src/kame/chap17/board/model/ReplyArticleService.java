package kame.chap17.board.model;
//답변 게시글의 순서 번호를 구해야 하기 때문에 게시글 쓰기 기능에 비해 상대적으로 복잡한 로직을 실행
//1.답변글을 등록할 부모글을 구한다. /존재하지 않을 경우 예외를 발생시킨다.
//2.부모글의 자식글중에서 순서 번호가 가장낮은 번호를 구한다. 
//3.답변글의 레벨값을1감소시킨 값을 순서 번호로 사용한다. 
//4.구한 순서 번호,부모 글과 동일한 그룹 번호를 사용해서 답변 글을 삽입한다. 

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Date;

import com.sun.javafx.scene.traversal.ParentTraversalEngine;

import kame.jdbc.connection.ConnectionProvider;
import ssol.jdbc.JdbcUtil;

public class ReplyArticleService {
	
	private static ReplyArticleService instance= new ReplyArticleService();
	
	public static ReplyArticleService getinstance() {
		return instance;
	}
	private ReplyArticleService() {
		
	}
	//ReplyingRequest로부터 article 객체를 생성한다. 
	public Article reply(ReplyingRequest replyingRequest) throws ArticleNotFoundException,CannotReplyArticleException,LastChildAleadyExistsException{
		Connection conn=null;
		Article article= replyingRequest.toArticle();
		
		try {
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			ArticleDao articleDao=ArticleDao.getInstance();
			//부모글 Article 객체 구함
			Article parent=articleDao.selectById(conn, replyingRequest.getParentArticleId());
			//부모글이 존재하지는지 여부와 답변 글을 등록할수있는지 확인한다. 
			try {
				checkParent(parent,replyingRequest.getParentArticleId());
				
			}
			//checkParent()가 예외발생시킬 경우 트랜잭션을 롤백하고 해당 예외를 발생 시킨다.
			catch(Exception e) {
				JdbcUtil.rollback(conn);
				if(e instanceof ArticleNotFoundException) {
					throw(ArticleNotFoundException)e;
				}else if(e instanceof CannotReplyArticleException) {
					throw(CannotReplyArticleException)e;
				}else if(e instanceof LastChildAleadyExistsException) {
					throw(LastChildAleadyExistsException)e;
				}
			}
			//자식글의 최대 순서 번호와 최소 순서 번호 구함
			String searchMaxSeqNum=parent.getSequenceNumber();
			String searchMinSeqNum=getSearchMinSeqNum(parent);
			//최대/최소 순서 번호 내에서 가장 작은 값을 갖는 자식 글의 순서 번호를 구한다. 
			String lastChildSeq=articleDao.selectLastSequenceNumber(conn, searchMaxSeqNum, searchMinSeqNum);
			//가장 작은 자식 글번호를 이용해서 새자식 글의 순서 번호를 구한다. 
			String sequenceNumber=getSequenceNumber(parent, lastChildSeq);
			//답변 글의 그룹 번호와 순서 번호를 설정한다. 
			article.setGroupId(parent.getGroupId());
			article.setSequenceNumber(sequenceNumber);
			article.setPostingDate(new Date());
			//답글을 테이블에 삽입한다.
			int articleId=articleDao.insert(conn, article);
			if(articleId==-1) {
				throw new RuntimeException("DB 삽입 안됨:"+articleId);
			}
			conn.commit();
			article.setId(articleId);
			return article;
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException("DB 작업 실패:"+e.getMessage(),e);
		}finally {
			if(conn!=null) {
				try {
					conn.setAutoCommit(true);
					
				}catch(SQLException e) {
					
				}
				JdbcUtil.close(conn);
			}
		}
	}
	// 부모글이 올바른지의 여부를 검사하는 메서드 
	private void checkParent(Article parent,int parentId)throws ArticleNotFoundException,CannotReplyArticleException{
		//부모글이 존재 하지 않을경우 예외처리 
		if(parent ==null) {
			throw new ArticleNotFoundException("부모글이 존재 하지 않음:"+parentId);
		}
		int parentLevel=parent.getLevel();
		//부모글이 레벨 3의 글인 경울 더이상 자식 글을 등록할 수없으므로 예외 처리 
		if(parentLevel==3) {
			throw new CannotReplyArticleException("마지막 레벨 글에는 답글을 달수 없습니다. : "+parent.getId());
		}
	}
	
	//articleDao.selectLastSequenceNumber()메서드는 파라미터로 전달받은 최대값과 최소값을 
	//이용해서 가장 작은 순서 번호를 갖는 자식글의 순서 번호를 리턴한다. 
	private String getSearchMinSeqNum(Article parent) {
		String ParentSeqNum=parent.getSequenceNumber();
		DecimalFormat decimalFormat=new DecimalFormat("0000000000000000");
		long parentSeqLongValue=Long.parseLong(ParentSeqNum);
		long searchMinLongValue=0;
		switch(parent.getLevel()) {
		case 0:
			searchMinLongValue=parentSeqLongValue/1000000L*1000000L;
			break;
		case 1:
			searchMinLongValue=parentSeqLongValue/10000L*10000L;
			break;
		case 2:
			searchMinLongValue=parentSeqLongValue/100L*100L;
			break;
		}
		return decimalFormat.format(searchMinLongValue);
	}
	//순서 번호를 이용해서 새로 추가할 답변 글의 순서 번호를 생성한다. 
	private String getSequenceNumber(Article parent,String lastChildSeq) throws LastChildAleadyExistsException{
		long parentSeqLong=Long.parseLong(parent.getSequenceNumber());
		int parentLevel=parent.getLevel();
		
		long decUnit=0;
		if(parentLevel ==0) {
			decUnit=10000L;
		}else if(parentLevel ==1) {
			decUnit=100L;
		}else if(parentLevel ==2) {
			decUnit= 1L;
		}
		String sequenceNumber=null;
		DecimalFormat decimalFormat=new DecimalFormat("0000000000000000");
		if(lastChildSeq==null) {// 답변 글이 없음
			sequenceNumber=decimalFormat.format(parentSeqLong - decUnit);
		}else {//답변글이있음
			//마지막 답변글인지 확인
			String orderOfLastChildSeq=null;
			if(parentLevel ==0) {
				orderOfLastChildSeq=lastChildSeq.substring(10, 12);
				sequenceNumber=lastChildSeq.substring(0,12)+"9999";
				
			}else if(parentLevel ==1) {
				orderOfLastChildSeq=lastChildSeq.substring(12, 14);
				sequenceNumber=lastChildSeq.substring(0, 14)+"99";
				
			}else if(parentLevel==2) {
				orderOfLastChildSeq=lastChildSeq.substring(14, 16);
				sequenceNumber=lastChildSeq;
			}
			if(orderOfLastChildSeq.equals("00")) {
				throw new LastChildAleadyExistsException("마지막 자식 글이 이미 존재합니다."+lastChildSeq);
			}
			long seq =Long.parseLong(sequenceNumber)-decUnit;
			sequenceNumber=decimalFormat.format(seq);
		}
		
		return sequenceNumber;
	}
}
