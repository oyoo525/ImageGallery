<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%

	String no = request.getParameter("no");
	String commentId = request.getParameter("commentId");
	String comment = request.getParameter("comment");
	
	Image i = new Image();
	i.setNo(Integer.parseInt(no));
	i.setId(commentId);
	i.setComment(comment);
	
	ImageDao dao = new ImageDao();
	dao.insertComment(i);

	response.sendRedirect("ImageDetail.jsp?no="+no);
%>
<script>


</script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>