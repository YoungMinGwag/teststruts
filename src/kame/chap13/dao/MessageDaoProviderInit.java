package kame.chap13.dao;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import ssol.dao.oracle.MessageDaoProvider;


//MessageDaoProvider.setDbms() �޼��带 ȣ���ؼ� �ʱ�ȭ ���ִ� ����� ���� 
//���� Ŭ����
public class MessageDaoProviderInit extends HttpServlet {

	public void init(ServletConfig config) throws ServletException{
		//dbms �ʱ�ȭ �Ķ���� ���� ���Ѵ�.
		String dbms=config.getInitParameter("dbms");
		if(dbms !=null) {
		//DBMS Ÿ���� �ʱ�ȭ �Ѵ�. 
			MessageDaoProvider.getInstnace().setDbms(dbms);
		}
		
	}
}
