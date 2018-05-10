package kame.chap17.board.model;
//답변 글을 99개 등록해서 더이상 답변 글을 등록할수 없는 경우 LastChildAleadyExistsException 예외 처리 
public class LastChildAleadyExistsException extends Exception{

	public LastChildAleadyExistsException(String message) {
		super(message);
	}
}
