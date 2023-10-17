<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	Image i = new Image();
	i.setId(id);
	i.setPass(pass);
	
	ImageDao dao = new ImageDao();
	boolean isPass = dao.passCheck(i);
%>
<c:set var="isPass" value="<%= isPass %>" scope="page"/>
<c:if test="${not isPass }">
	<script>
 		alert("비밀번호가 일치하지 않습니다.");
		history.back(); 
	</script>
</c:if>
<c:if test="${isPass }">
	<%
		ImageDao dao2 = new ImageDao();
		dao.deleteComment(id);
		dao.deleteImage(id);
		dao.deleteMember(i);
		
		session.invalidate();
		response.sendRedirect("ImageList.jsp");
	
	%>
</c:if>
