package ssol.dao.oracle;

import kame.chap13.dao.MessageDao;

public class MessageDaoProvider {
	//�̱��� ���� ���� 
	private static MessageDaoProvider instance=new MessageDaoProvider();
	public static MessageDaoProvider getInstnace() {
		return instance;
	}
	private MessageDaoProvider() {
		
	}
	//oracle DBMS Ÿ�Կ� �˸��� MessageDeo��ü�� �̸� �����Ѵ�.
	private OracleMessageDao oracleDao=new OracleMessageDao();
	//����� DBMS Ÿ���� �����ϴ� �ʵ�
	private String dbms;
	//����� DBMS Ÿ���� �����Ҷ� ���Ǵ� �޼��� 
	public void setDbms(String dbms) {
		this.dbms=dbms;
	}
	//������ DBMS Ÿ�Կ� ���� �˸��� MessageDeo ��ü�� �����Ѵ�.
	//DBMS Ÿ�Կ� �˸��� ��ü�� �������� ���� ��� null�� �����Ѵ�.
	public MessageDao getMessageDao() {
		if("oracle".equals(dbms)) {
			return oracleDao;
		}
		return null;
	}
}
