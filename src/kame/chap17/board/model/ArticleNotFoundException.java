package kame.chap17.board.model;
//예외 클래스로서 ReadArticleService 클래스나 UpdateArticleService 클래스 등에서 
//게시글이 존재하지 않을겨웅 발생되는 예외클래스 이다. 
public class ArticleNotFoundException  extends Exception{
	public ArticleNotFoundException(String msg) {
		super(msg);
	}
}
