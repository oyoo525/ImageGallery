<%@page import="imagegallery.vo.Image"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String no = request.getParameter("no");
	
	ImageDao dao = new ImageDao();
	Image i = dao.getImage(Integer.parseInt(no));
	
	ImageDao dao2 = new ImageDao();
	ArrayList<Image> cList = dao2.commentList(i);
	

%> 
<c:set var = "i" value="<%= i %>" />
<c:set var = "cList" value="<%= cList %>" />
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
	<div class="row my-5">
		<div class="col">
			<div class="row">
				&nbsp;<br>&nbsp;
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col-10 offset-1 mb-1">
					<h1 class="fw-bold">${i.imageName }</h1>
					<div class="text-end">
						<input type="button" value="수정하기" class="btn btn-light">
						<input type="button" value="삭제하기" class="btn btn-light">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-10 offset-1 mb-3">
					<span class="row border-bottom"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-5 text-center"><!-- 이미지 보여주기 -->
					<img src="${i.imagePath }" class="w-100">
				</div>
				<div class="col-5"><!-- 상세내용 -->
					<div class="row">
						<div class="col">
							<pre>Content</pre>
							<pre>${i.imageContent }</pre>
						</div>
					</div>
					<div class="row">
						<pre>Editor : ${i.imageId }</pre>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-10 offset-1 my-3">
					<span class="row border-bottom"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-10 offset-1">
					<div class="row">
						&nbsp;&nbsp;댓글달기<br>
					</div>
					<form name="commentForm" id="commentForm" action="commnetProcess.jsp"
								class="row">
						<div class="col-10">
							<input type="hidden" name="imageNo" id="imageNo" value="<%= i.getNo() %>">
							아이디 : <input type="text" name="id" id="id">
							<input type="text" name="commnet" id="commnet" class="form-control">
						</div>
						<div class="col-2">
							<input type="submit" value="등록하기" class="btn btn-primary">
						</div>					
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-10 offset-1 mb-1">
					<c:forEach var="c" items="${cList }">
						<div class="row">
							@${c.id }<br>
							${c.comment }
							<span ></span>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	

		
	
	
	
	
	</div>
</body>
</html>