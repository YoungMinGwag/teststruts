package ssol.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soldesk.board.BoardDBBean;
import soldesk.board.BoardDataBean;
import soldesk.board.CommentDBBean;

public class ContentAction implements CommandAction{//�۳��� ó��
	
	public String requestPro(HttpServletRequest request,HttpServletResponse response)
	throws Throwable{
		//�ش� �۹�ȣ
		int num=Integer.parseInt(request.getParameter("num"));
		
		//�ش� ������ ��ȣ
		String pageNum=request.getParameter("pageNum");
		
		
		int pageSize=10;
		String cPageNum=request.getParameter("cPageNum");
		if(cPageNum==null){

			cPageNum="1";
		}
		int cCurrentPage=Integer.parseInt(cPageNum);
		int startRow=(cCurrentPage * 10) -9;
		int endRow=cCurrentPage * pageSize;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		BoardDBBean dbPro=BoardDBBean.getInstance();
		//�ش� �۹�ȣ�� ���� �ش� ���ڵ�
		BoardDataBean article=dbPro.getArticle(num);
		
		
		
		CommentDBBean cdb=CommentDBBean.getInstance();
		ArrayList comments=cdb.getComments(article.getNum(),startRow,endRow);
		int count=cdb.getCommentCount(article.getNum());

		
		
		int currentPage=Integer.parseInt(pageNum);
		List articleList=null;
		int count1=0;
		int number=0;
		count1=dbPro.getArticleCount();
		
		if(count1>0) {
			articleList=dbPro.getArticles(startRow, endRow);
		}else {
			articleList=Collections.EMPTY_LIST;
		}
		number=count-(currentPage-1)*pageSize;//�۸�Ͽ� ǥ���� �۹�ȣ
		
		
		//�ش� �信�� ����� �Ӽ�
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		
		request.setAttribute("cPageNum", new Integer(cPageNum));
		request.setAttribute("comments", comments);
		request.setAttribute("count", count);
		request.setAttribute("sdf",sdf);
		request.setAttribute("number", new Integer(number));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count1", new Integer(count1));
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("pageSize", new Integer(pageSize));
		
		return "/MVC/content.jsp";
	}

}
