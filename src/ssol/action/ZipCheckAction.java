package ssol.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soldesk.logon.LogonDBBean;
import soldesk.logon.ZipcodeBean;

public class ZipCheckAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("euc-kr");
		
		String check=request.getParameter("check");
		String area3=request.getParameter("area3");
		LogonDBBean manager=LogonDBBean.getInstance();
		Vector zipcodeList=manager.zipcodeRead(area3);
		int totalList=zipcodeList.size();
		
		return "/logon2/zipcheck.jsp";
	}

}
