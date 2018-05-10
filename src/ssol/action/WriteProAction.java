package ssol.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soldesk.board.BoardDBBean;
import soldesk.board.BoardDataBean;

public class WriteProAction implements CommandAction{//입력된 글 처리

	public String requestPro(HttpServletRequest request,HttpServletResponse response) 
	throws Throwable{
		//한글 인코딩
		request.setCharacterEncoding("euc-kr");
		
		BoardDataBean article=new BoardDataBean();//데이터처리 빈
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setWriter(request.getParameter("writer"));
		article.setEmail(request.getParameter("email"));
		article.setSubject(request.getParameter("subject"));
		article.setPasswd(request.getParameter("passwd"));
		article.setReg_date(new Timestamp(System.currentTimeMillis()));
		article.setRef(Integer.parseInt(request.getParameter("ref")));
		article.setRe_setp(Integer.parseInt(request.getParameter("re_setp")));
		article.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		article.setContent(request.getParameter("content"));
		article.setIp(request.getRemoteAddr());
		
		BoardDBBean dbPr=BoardDBBean.getInstance();
		dbPr.insertArticle(article);
		return "/MVC/writePro.jsp";
	}
}
