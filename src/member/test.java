package member;

public class test  implements java.io.Serializable{

	private String value;
	//���� �����ϴ� �ʵ�
	
	public test() {
		//�⺻ ������
	}
	
	public String getValue() {
		//�ʵ��� ���� �о���� ��
		return value;
	}
	
	public void setValue(String value) {
		//�ʵ尪�� �����ϴ�
		this.value=value;
	}
}
