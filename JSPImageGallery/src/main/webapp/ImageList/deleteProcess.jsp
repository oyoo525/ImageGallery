<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	
 	Image i = new Image();
	i.setNo(Integer.parseInt(no));
	
	ImageDao dao = new ImageDao();
	dao.deleteImage(i);
	
	response.sendRedirect("ImageList.jsp");

%>
