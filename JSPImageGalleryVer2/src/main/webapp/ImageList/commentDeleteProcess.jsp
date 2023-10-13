<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>    
<%
	String commentNo = request.getParameter("commentNo");

	Image i = new Image();
	i.setCommentNo(Integer.parseInt(commentNo));
	
	ImageDao dao = new ImageDao();
	dao.deleteComment(i);
	
	String no = request.getParameter("no");
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