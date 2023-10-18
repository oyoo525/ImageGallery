<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.vo.Image"%>
<%@page import="imagegallery.dao.ImageDao"%>    
<%
	String no = request.getParameter("no");
	String id = (String) session.getAttribute("id");
	
	String pageNum = request.getParameter("pageNum");
 	
	Image i = new Image();
	i.setNo(Integer.parseInt(no));
	i.setId(id);
	
	ImageDao dao = new ImageDao();
	boolean check = dao.likeCheck(i);
	
	i = new Image();
	i.setNo(Integer.parseInt(no));
	i.setId(id);
	
 	if(!check) {
		dao.likeValueInsert(i);
	} else {
		dao.likeValueDelete(i);
	} 
 	
 	response.sendRedirect("ImageDetail.jsp?no=" + no + "&pageNum=" + pageNum);
	
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