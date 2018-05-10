package kame.chap17.board.model;
//게시글 수정 기능과 삭제 기능은 게시글 등록 시 입력한 암호와 동일한 암호를 입력하지 않을때 발생되는 예외처리
public class InvalidPasswordException extends Exception{

	public InvalidPasswordException(String message) {
		super(message);
	}
}
