package ssol.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormAction implements CommandAction{
	
	public String requestPro(HttpServletRequest request,HttpServletResponse response)
	throws Throwable{
		return "/logon2/loginForm.jsp";
	}

}
