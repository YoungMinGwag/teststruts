package soldesk.mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ssol.action.CommandAction;
import ssol.action.NullAction;

public class ControllerUsingURI2 extends HttpServlet{
	
	private Map commandMap=new HashMap();//��ɾ�� ��ɾ� ó�� Ŭ������ ������ ����
	
	//��ɾ�� ó��Ŭ������ ���εǾ� �ִ� properties ������ �о Map��ü�� commandMap�� ����
    //��ɾ�� ó��Ŭ������ ���εǾ� �ִ� properties ������ Command.properties����
	
	public void init(ServletConfig config) throws ServletException{
		//web.xml���� propertyConfig�� �ش��ϴ� init-param�� ���� �о�� 
		String props=config.getInitParameter("configFile2");
		
		//��ɾ�� ó��Ŭ������ ���������� ������ properties ��ü ���� 
		Properties pr=new Properties();
		FileInputStream f=null;
		try {
			String configFilePath=config.getServletContext().getRealPath(props);
			//Command.properties ������ ������ �о��
			f=new FileInputStream(configFilePath);
			
			//command.properties������ ������ Properties��ü�� ����
			pr.load(f);
		}catch(IOException e) {
			throw new ServletException(e);
		}finally {
			if(f !=null) {
				try {
					f.close();
				}catch(IOException ex) {
					
				}
			}
		}
		//Iterator ��ü�� Enumeration��ü�� Ȯ���Ų ������ ��ü
		Iterator keyIter=pr.keySet().iterator();
		//��ü�� �ϳ��� ������ �� ��ü������ Properties��ü�� ����� ��ü�� ����
		while(keyIter.hasNext()) {
			String command=(String)keyIter.next();
			String className=pr.getProperty(command);
			try {
				//�ش� ���ڿ��� Ŭ������ �����.
				Class commandClass=Class.forName(className);
				//�ش�Ŭ������ ��ü�� ����
				Object commandInstance=commandClass.newInstance();
				// Map��ü�� commandMap�� ��ü ����
				commandMap.put(command,commandInstance);
			}catch(ClassNotFoundException e) {
				throw new ServletException(e);
			}catch(InstantiationException e) {
				throw new ServletException(e);
			}catch(IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}

	//get����� ���� �޼ҵ�
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws
	 ServletException,IOException{
		requestPro(request,response);
	}
	//post ����� ���� �޼ҵ�
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws
	 ServletException,IOException{
		requestPro(request,response);
	}
	
	//������� ��û�� �м��ؼ� �ش� �۾��� ó��
	private void requestPro(HttpServletRequest request,HttpServletResponse response)throws
	 ServletException,IOException{
		String view =null;
		CommandAction com=null;
		try {
			String command=request.getRequestURI();
			if(command.indexOf(request.getContextPath())==0) {
				command=command.substring(request.getContextPath().length());
			}
			com=(CommandAction)commandMap.get(command);
			if(com==null) {
				com=new NullAction();
			}
			view =com.requestPro(request,response);
		}catch(Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher(view);
		dispatcher.forward(request,response);
	}
}