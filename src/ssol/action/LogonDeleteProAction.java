package ssol.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soldesk.logon.LogonDBBean;

public class LogonDeleteProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("euc-kr");
		
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		
		LogonDBBean dbPro= LogonDBBean.getInstance();
		int check=dbPro.deleteMember(id, passwd);
		
		request.setAttribute("check", new Integer(check));
		
		
		return "/logon2/deletePro.jsp";
	}

}
