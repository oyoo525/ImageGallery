<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%@page import="java.sql.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ImageDao dao = new ImageDao();
	ArrayList<Image> iList = dao.imageList();
	
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

<div class="container-xl">
	<!-- header -->
	<%@ include file="../pages/header.jsp" %>
	
	<!-- content -->
	<div class="row">
		&nbsp;
	</div>
	<div class="row position-relative my-5"> <!-- 이미지 검색 -->
		<div>
			<br>
			<img src="../img/top_character.png" class="w-100" style="width:1320px">
		</div>
	</div>
	<div class="row"> <!-- 이미지 출력 -->
		<div class="col">
			<div class="row">
				<c:forEach var="i" items="${iList }">
					<div class="col-4">
						<a href="ImageDetail.jsp?no=${i.no }">
							<img name="images" id="images" class="w-100"
								src="${i.imagePath }" alt="이미지">
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	

	
	<script src="../bootstrap/bootstrap.bundle.min.js"></script>
</div>
</body>
</html>