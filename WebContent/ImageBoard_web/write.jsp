<%@page import="ImageBoard.ThemeManager"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="ImageBoard.ImageUtil"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="ImageBoard.FileUploadRequestWrapper"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// temp ��� Ȯ��!! �ʿ� 
	FileUploadRequestWrapper requestWrap=new FileUploadRequestWrapper(request,-1,-1,"C:\\Java\\App\\KH10\\WebContent\\temp");
	HttpServletRequest tempRequest=request;
	request=requestWrap;
%>
<jsp:useBean id="theme" class="ImageBoard.Theme">
	<jsp:setProperty name="theme" property="*"/>
</jsp:useBean>
<%
	FileItem imageFileItem=requestWrap.getFileItem("imageFile");
	String image="";
	if(imageFileItem.getSize()>0){
		image=Long.toString(System.currentTimeMillis());
		//�̹����� ������ ��ο� ����
		File imageFile =new File("C:\\Java\\App\\KH10\\WebContent\\image",image);
		if(imageFile.exists()){
			for(int i=0;true;i++){
				imageFile =new File("C:\\Java\\App\\KH10\\WebContent\\image",image+"_"+i);
				if(!imageFile.exists()){
					image=image+"_"+i;
					break;
				}
			}
		}
		imageFileItem.write(imageFile);;
		
		File destFile=new File("C:\\Java\\App\\KH10\\WebContent\\image",image+".small.jpg");
		ImageUtil.resize(imageFile,destFile,50,ImageUtil.RATIO);
	}
	theme.setRegister(new Timestamp(System.currentTimeMillis()));
	theme.setImage(image);
	
	ThemeManager manager=ThemeManager.getInstance();
	manager.insert(theme);
%>
<script>
alert("���ο� �̹����� ����߽��ϴ�.");
location.href="list.jsp";
</script>
