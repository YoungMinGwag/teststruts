package kame.chap18.pds.model;

public class PdsItem {

	private int id; // Ű �� 
	private String fileName; //���ε� �� ���� �̸�
	private String realPath; //���ε� �� ������ ������ ���� ���
	private long fileSize; // ���ε��� ������ ũ��
	private int downloadCount; //�ٿ�ε� Ƚ��
	private String description; //������ ����
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getRealPath() {
		return realPath;
	}
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
