package kame.chap17.board.model;
//ArticleDao.selectLastSequenceNumber() �޼��带 �̿��ؼ� �亯�� ����� �θ� �Խñۿ� ��ϵ�
//������ �ڽ� �Խñ��� ���� ��ȣ�� ���Ѵ�.

//�亯 ���� ��û ������ ǥ���ϴ� Ŭ�����μ� WritingRequest�� ���������� 
//���� �ۼ��� �̸� ��ȣ ������ �����ϰ������� �߰��� �亯�� ����� �θ�Խñ��� ID�� �����Ѵ�. 

public class ReplyingRequest extends WritingRequest{
	private int parentArticleId;
	
	public int getParentArticleId() {
		return parentArticleId;
	}
	public void setParentArticleId(int parentArticleId) {
		this.parentArticleId=parentArticleId;
	}

}
