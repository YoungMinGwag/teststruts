package ssol.dao.oracle;

import kame.chap13.dao.MessageDao;

public class MessageDaoProvider {
	//싱글톤 패턴 구현 
	private static MessageDaoProvider instance=new MessageDaoProvider();
	public static MessageDaoProvider getInstnace() {
		return instance;
	}
	private MessageDaoProvider() {
		
	}
	//oracle DBMS 타입에 알맞은 MessageDeo객체를 미리 생성한다.
	private OracleMessageDao oracleDao=new OracleMessageDao();
	//사용할 DBMS 타입을 지정하는 필드
	private String dbms;
	//사용할 DBMS 타입을 설정할때 사용되는 메서드 
	public void setDbms(String dbms) {
		this.dbms=dbms;
	}
	//설정한 DBMS 타입에 따라 알맞은 MessageDeo 객체를 리턴한다.
	//DBMS 타입에 알맞은 객체가 존재하지 않을 경우 null을 리턴한다.
	public MessageDao getMessageDao() {
		if("oracle".equals(dbms)) {
			return oracleDao;
		}
		return null;
	}
}
