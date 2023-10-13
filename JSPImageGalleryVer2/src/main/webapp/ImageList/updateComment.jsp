<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.vo.Image"%>
<%@page import="imagegallery.dao.ImageDao"%>   
<%
	request.setCharacterEncoding("UTF-8");

	String commentNo = request.getParameter("commentNo");
	String comment = request.getParameter("comment");	
	String imageNo = request.getParameter("imageNo");
	
	System.out.println(commentNo);
	System.out.println(comment);
	System.out.println(imageNo);
	/* 
 	Image i = new Image();
	i.setCommentNo(Integer.parseInt(commentNo));
	i.setComment(comment);
	
	ImageDao dao = new ImageDao();
	dao.updateComment(i);
	
	session.invalidate();
	response.sendRedirect("ImageDetail.jsp?no=" + commentImageNo);
	
	 */

%>
<%= commentNo %>
<%= comment %>