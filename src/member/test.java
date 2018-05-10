package member;

public class test  implements java.io.Serializable{

	private String value;
	//값을 저장하는 필드
	
	public test() {
		//기본 생성자
	}
	
	public String getValue() {
		//필드의 값을 읽어오는 값
		return value;
	}
	
	public void setValue(String value) {
		//필드값을 변경하는겂
		this.value=value;
	}
}
