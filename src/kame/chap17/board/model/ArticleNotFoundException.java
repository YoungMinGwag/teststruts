package kame.chap17.board.model;
//���� Ŭ�����μ� ReadArticleService Ŭ������ UpdateArticleService Ŭ���� ��� 
//�Խñ��� �������� �����ܿ� �߻��Ǵ� ����Ŭ���� �̴�. 
public class ArticleNotFoundException  extends Exception{
	public ArticleNotFoundException(String msg) {
		super(msg);
	}
}
