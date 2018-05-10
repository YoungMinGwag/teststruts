package ssol.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import soldesk.board.CommentDBBean;
import soldesk.board.CommentDataBean;

public class contentProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("euc-kr");
		
		CommentDataBean cmt = new CommentDataBean();
		cmt.setCommentt(request.getParameter("commentt"));
		cmt.setContent_num(Integer.parseInt(request.getParameter("content_num")));
		cmt.setComment_num(Integer.parseInt(request.getParameter("comment_num")));
		cmt.setCommenter(request.getParameter("commenter"));
		cmt.setIp(request.getRemoteAddr());
		cmt.setPasswd(request.getParameter("passwd"));
		cmt.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		CommentDBBean comt=CommentDBBean.getInstance();
		comt.insertComment(cmt);
		
		String content_num=request.getParameter("content_num");
		String p_num=request.getParameter("p_num");
		request.setAttribute("num", content_num);
		request.setAttribute("p_num", p_num);
		
		return "/MVC/contentPro.jsp";
	}

}
