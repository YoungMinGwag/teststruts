package kame.chap13.dao;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import ssol.dao.oracle.MessageDaoProvider;


//MessageDaoProvider.setDbms() 메서드를 호출해서 초기화 해주는 기능을 제공 
//서블릿 클래스
public class MessageDaoProviderInit extends HttpServlet {

	public void init(ServletConfig config) throws ServletException{
		//dbms 초기화 파라미터 값을 구한다.
		String dbms=config.getInitParameter("dbms");
		if(dbms !=null) {
		//DBMS 타입을 초기화 한다. 
			MessageDaoProvider.getInstnace().setDbms(dbms);
		}
		
	}
}
