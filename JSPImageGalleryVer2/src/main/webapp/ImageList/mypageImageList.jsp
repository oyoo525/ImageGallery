<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%@page import="java.sql.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String id = (String) session.getAttribute("id");

	ImageDao dao = new ImageDao();
	ArrayList<Image> iList = dao.imageList(id);
	
	request.setAttribute("iList", iList);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/formCheck.js"></script>
</head>
<body>
<div class="container">
	<!-- header -->
	<%@ include file="../pages/header.jsp" %>
	<!-- -->
	<div class="row">
		<%@ include file="../pages/infoSideBar.jsp" %>
		<div class="col-8 ps-5">
			<div class="row">
				<ul class="nav nav-tabs nav-pills nav-fill">
					<li class="nav-item">
						<a class="nav-link active bg-danger" aria-current="page" href="mypageImageList.jsp">내 이미지</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-danger" href="mypageCommentList.jsp">내 댓글</a>
					</li>
				</ul>
			</div>
			<div class="row py-3">
				<c:forEach var="i" items="${iList }">
					<div class="col-4">
						<a href="ImageDetail.jsp?no=${i.no }&imageId=${sessionScope.id}">
							<img name="images" id="images" class="w-100"
								src="${i.imagePath }" alt="이미지">
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>	
</div>
<script src="../bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>