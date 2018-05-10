package kame.chap13.model;
//DB 테이블에서 읽어온 값을 저장하거나 또는 사용자가 입력한 값을
//DAO에 전달할때 사용되는 클래스인 Message
public class Message {
	private int id;
	private String guestName;
	private String password;
	private String message;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	//발명록 메시지에 암호가 지정되어 있는지 확인해 주는 메서드 
	//DeleteMessageService 클래스에서 삭제 기능을 구현할때 사용된다. 
	public boolean hasPassword() {
		return password !=null && !password.isEmpty();
	}
}
