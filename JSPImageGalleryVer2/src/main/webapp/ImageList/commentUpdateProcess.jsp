<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.vo.Image"%>
<%@page import="imagegallery.dao.ImageDao"%>    	
<%
	String commentNo = request.getParameter("commentNo");
	String comment = request.getParameter("comment");

	Image i = new Image();
	i.setCommentNo(Integer.parseInt(commentNo));
	i.setComment(comment);
	
	ImageDao dao = new ImageDao();
	dao.updateComment(i);
	
	String no = request.getParameter("no");
	response.sendRedirect("ImageDetail.jsp?no=" + no);

%>
