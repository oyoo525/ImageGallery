<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%@page import="java.sql.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ImageDao dao = new ImageDao();
	ArrayList<Image> iList = dao.imageList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../bootstrap/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<!-- Header -->
	<div class="row">
		<form class="col-8">
			<div class="row">
				<div class="col-1">
					<img src="https://via.placeholder.com/50" alt="샘플이미지">
				</div>
				<div class="col-9">
					<input type="text" class="form-control">
				</div>
				<div class="col-2">
					<input type="button" value="검색하기" href="" class="btn btn-warning">
				</div>
			</div>
		</form>
		<div class="col-4">
			<input type="button" value="회원가입" href="" class="btn btn-light">
			<input type="button" value="로그인" href="" class="btn btn-light">
		</div>
	</div>
	
	<!-- content -->
	<div class="row position-relative my-3"> <!-- 이미지 검색 -->
		<div>
			<img src="https://via.placeholder.com/1320X500">
		</div>
		<div class="col-8 offset-2 d-block position-absolute">
			<p><input type="text" class="form-control"></p>
		</div>
	</div>
	<div class="row"> <!-- 이미지 출력 -->

	</div>
	
	
	
	
	<script src="../bootstrap/bootstrap.bundle.min.js"></script>
</div>
</body>
</html>