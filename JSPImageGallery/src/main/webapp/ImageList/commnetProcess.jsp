<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%

	String id = request.getParameter("id");;
	String commnet = request.getParameter("commnet");
	String no = request.getParameter("imageNo");

	Image i = new Image();
	i.setNo(Integer.parseInt(no));
	i.setId(id);
	i.setComment(commnet);
	
	ImageDao dao = new ImageDao();
	dao.insertComment(i);

	response.sendRedirect("ImageDetail.jsp?no="+no);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name="no" id="no" value="<%= no %>">
</body>
</html>