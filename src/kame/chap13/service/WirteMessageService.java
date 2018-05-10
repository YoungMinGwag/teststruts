package kame.chap13.service;

import java.sql.Connection;
import java.sql.SQLException;

import kame.chap13.dao.MessageDao;
import kame.chap13.model.Message;
import kame.jdbc.connection.ConnectionProvider;
import ssol.dao.oracle.MessageDaoProvider;
import ssol.jdbc.JdbcUtil;

public class WirteMessageService {

	private static WirteMessageService instance= new WirteMessageService();
	
	public static WirteMessageService getInstance() {
		return instance;
	}
	private WirteMessageService() {
		
	}
	public void write(Message message) throws ServiceException{
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			MessageDao messageDao=MessageDaoProvider.getInstnace().getMessageDao();
			messageDao.insert(conn, message);
		}catch (SQLException e) {
			throw new ServiceException("메시지 등록 실패:"+e.getMessage(),e);
			// TODO: handle exception
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
