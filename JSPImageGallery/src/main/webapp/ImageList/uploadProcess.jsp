
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	input file 넣을시 cos.jar 라이브러리 넣어주기 
	애플리케이션 초기화 파라미터 넣어주기 (web.xml)
-->
<%!
	static String uploadDir;
	static File parentFile;

	public void jspInit() {
		uploadDir = getServletContext().getInitParameter("uploadDir");
		String realPath = getServletContext().getRealPath(uploadDir);
		parentFile = new File(realPath);
		
		if(!(parentFile.exists() && parentFile.isDirectory())) {
			parentFile.mkdir();
		}
	}
%>
<%
	String realPath = application.getRealPath(uploadDir);
	int maxFileSize = 1024 * 1024 * 4;
	String encoding = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, realPath, maxFileSize, encoding, 
			new DefaultFileRenamePolicy());

	String id = multi.getParameter("imageId");
	String imageName = multi.getParameter("imageName");
	String imageContent = multi.getParameter("imageContent");
	String imagePath = multi.getOriginalFileName("imagePath"); 

	String fileName = "";

	Image i = new Image();
	i.setId(id);
	i.setImageName(imageName);
	i.setImageContent(imageContent);
	i.setImagePath("../upload/" + imagePath); 
	
	ImageDao dao = new ImageDao();
	dao.insertImage(i);

	response.sendRedirect("ImageList.jsp");
%>