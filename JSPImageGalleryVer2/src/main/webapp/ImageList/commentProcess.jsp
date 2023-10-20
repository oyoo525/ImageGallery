<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no = request.getParameter("no");
	String commentId = request.getParameter("commentId");
	String comment = request.getParameter("comment");
	String order = request.getParameter("order");
	String pageNum = request.getParameter("pageNum");
	String keyword = request.getParameter("keyword");
	
	Image i = new Image();
	i.setNo(Integer.parseInt(no));
	i.setId(commentId);
	i.setComment(comment);
	
	ImageDao dao = new ImageDao();
	dao.insertComment(i);
	
	response.sendRedirect("ImageDetail.jsp?no="+ no + "&order=" + order + "&pageNum=" + pageNum);

%>
