package kame.chap17.board.model;
//ArticleDao.selectLastSequenceNumber() 메서드를 이용해서 답변을 등록할 부모 게시글에 등록된
//마지막 자식 게시글의 순서 번호를 구한다.

//답변 쓰기 요청 정보를 표현하는 클래스로서 WritingRequest와 마찬가지로 
//제목 작성자 이름 암호 내용을 포함하고있으며 추가로 답변을 등록할 부모게시글의 ID를 포함한다. 

public class ReplyingRequest extends WritingRequest{
	private int parentArticleId;
	
	public int getParentArticleId() {
		return parentArticleId;
	}
	public void setParentArticleId(int parentArticleId) {
		this.parentArticleId=parentArticleId;
	}

}
