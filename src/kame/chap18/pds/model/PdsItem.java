package kame.chap18.pds.model;

public class PdsItem {

	private int id; // 키 값 
	private String fileName; //업로드 한 파일 이름
	private String realPath; //업로드 한 파일을 저장한 실제 경로
	private long fileSize; // 업로드한 파일의 크기
	private int downloadCount; //다운로드 횟수
	private String description; //간단한 설명
	
	
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
