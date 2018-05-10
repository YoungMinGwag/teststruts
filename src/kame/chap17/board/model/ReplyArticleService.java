package kame.chap17.board.model;
//�亯 �Խñ��� ���� ��ȣ�� ���ؾ� �ϱ� ������ �Խñ� ���� ��ɿ� ���� ��������� ������ ������ ����
//1.�亯���� ����� �θ���� ���Ѵ�. /�������� ���� ��� ���ܸ� �߻���Ų��.
//2.�θ���� �ڽı��߿��� ���� ��ȣ�� ���峷�� ��ȣ�� ���Ѵ�. 
//3.�亯���� ��������1���ҽ�Ų ���� ���� ��ȣ�� ����Ѵ�. 
//4.���� ���� ��ȣ,�θ� �۰� ������ �׷� ��ȣ�� ����ؼ� �亯 ���� �����Ѵ�. 

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
	//ReplyingRequest�κ��� article ��ü�� �����Ѵ�. 
	public Article reply(ReplyingRequest replyingRequest) throws ArticleNotFoundException,CannotReplyArticleException,LastChildAleadyExistsException{
		Connection conn=null;
		Article article= replyingRequest.toArticle();
		
		try {
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			ArticleDao articleDao=ArticleDao.getInstance();
			//�θ�� Article ��ü ����
			Article parent=articleDao.selectById(conn, replyingRequest.getParentArticleId());
			//�θ���� ������������ ���ο� �亯 ���� ����Ҽ��ִ��� Ȯ���Ѵ�. 
			try {
				checkParent(parent,replyingRequest.getParentArticleId());
				
			}
			//checkParent()�� ���ܹ߻���ų ��� Ʈ������� �ѹ��ϰ� �ش� ���ܸ� �߻� ��Ų��.
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
			//�ڽı��� �ִ� ���� ��ȣ�� �ּ� ���� ��ȣ ����
			String searchMaxSeqNum=parent.getSequenceNumber();
			String searchMinSeqNum=getSearchMinSeqNum(parent);
			//�ִ�/�ּ� ���� ��ȣ ������ ���� ���� ���� ���� �ڽ� ���� ���� ��ȣ�� ���Ѵ�. 
			String lastChildSeq=articleDao.selectLastSequenceNumber(conn, searchMaxSeqNum, searchMinSeqNum);
			//���� ���� �ڽ� �۹�ȣ�� �̿��ؼ� ���ڽ� ���� ���� ��ȣ�� ���Ѵ�. 
			String sequenceNumber=getSequenceNumber(parent, lastChildSeq);
			//�亯 ���� �׷� ��ȣ�� ���� ��ȣ�� �����Ѵ�. 
			article.setGroupId(parent.getGroupId());
			article.setSequenceNumber(sequenceNumber);
			article.setPostingDate(new Date());
			//����� ���̺� �����Ѵ�.
			int articleId=articleDao.insert(conn, article);
			if(articleId==-1) {
				throw new RuntimeException("DB ���� �ȵ�:"+articleId);
			}
			conn.commit();
			article.setId(articleId);
			return article;
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException("DB �۾� ����:"+e.getMessage(),e);
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
	// �θ���� �ùٸ����� ���θ� �˻��ϴ� �޼��� 
	private void checkParent(Article parent,int parentId)throws ArticleNotFoundException,CannotReplyArticleException{
		//�θ���� ���� ���� ������� ����ó�� 
		if(parent ==null) {
			throw new ArticleNotFoundException("�θ���� ���� ���� ����:"+parentId);
		}
		int parentLevel=parent.getLevel();
		//�θ���� ���� 3�� ���� ��� ���̻� �ڽ� ���� ����� �������Ƿ� ���� ó�� 
		if(parentLevel==3) {
			throw new CannotReplyArticleException("������ ���� �ۿ��� ����� �޼� �����ϴ�. : "+parent.getId());
		}
	}
	
	//articleDao.selectLastSequenceNumber()�޼���� �Ķ���ͷ� ���޹��� �ִ밪�� �ּҰ��� 
	//�̿��ؼ� ���� ���� ���� ��ȣ�� ���� �ڽı��� ���� ��ȣ�� �����Ѵ�. 
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
	//���� ��ȣ�� �̿��ؼ� ���� �߰��� �亯 ���� ���� ��ȣ�� �����Ѵ�. 
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
		if(lastChildSeq==null) {// �亯 ���� ����
			sequenceNumber=decimalFormat.format(parentSeqLong - decUnit);
		}else {//�亯��������
			//������ �亯������ Ȯ��
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
				throw new LastChildAleadyExistsException("������ �ڽ� ���� �̹� �����մϴ�."+lastChildSeq);
			}
			long seq =Long.parseLong(sequenceNumber)-decUnit;
			sequenceNumber=decimalFormat.format(seq);
		}
		
		return sequenceNumber;
	}
}
