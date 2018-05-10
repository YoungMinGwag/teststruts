package ssol.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soldesk.board.BoardDBBean;
import soldesk.board.BoardDataBean;

public class UpdateFormAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,HttpServletResponse response)
	throws Throwable{
		
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		
		BoardDBBean dbPro=BoardDBBean.getInstance();
		BoardDataBean article=dbPro.updateGetArticle(num);
		
		//�ش� �信�� ����� �Ӽ�
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		
		return "/MVC/updateForm.jsp";
	}
}
