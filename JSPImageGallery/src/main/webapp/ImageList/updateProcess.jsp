<%@page import="imagegallery.vo.Image"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no = request.getParameter("imageNo");
	String imageName = request.getParameter("imageName");
	String imageContent = request.getParameter("imageContent");
	String imagePath = request.getParameter("imagePath");
	String imageId = request.getParameter("imageId");
	
	
	Image i = new Image();
	i.setNo(Integer.parseInt(no));
	i.setImageName(imageName);
	i.setImageContent(imageContent);
	i.setImagePath(imagePath);
	i.setImageId(imageId);

	ImageDao dao = new ImageDao();
	dao.updateImage(i);
	
	response.sendRedirect("ImageDetail.jsp?no=" + no);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>