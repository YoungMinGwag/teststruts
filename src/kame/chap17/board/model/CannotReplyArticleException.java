package kame.chap17.board.model;
//답변글을 등록하려고 할때에는 CannotReplyArticleException 예외를 발생시킨다.

public class CannotReplyArticleException extends Exception{

	public CannotReplyArticleException(String message) {
		super(message);
	}
}
