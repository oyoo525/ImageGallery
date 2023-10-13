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
	<!-- 이미지 정보출력 -->
	<form name="ImageDetail" id="ImageDetail" class="row mt-5">
		<div class="col">
			<div class="row">
				<div class="col-10 offset-1 mb-1">
					imageNo : <input type="text" name="no" id="no" value="${i.no }">
					<h1 class="fw-bold">${i.imageName }</h1>
					<div class="text-end">
						<input type="button" name="updateBtn" id="updateBtn" value="수정하기" class="btn btn-light">
						<input type="button" name="deleteBtn" id="deleteBtn" value="삭제하기" class="btn btn-light">
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
						<pre>Editor : ${i.imageId }</pre>
					</div>
					<div class="row">
						<div class="col">
							<pre>Content</pre>
							<pre>${i.imageContent }</pre>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-10 offset-1 my-3">
					<span class="row border-bottom"></span>
				</div>
			</div>
		</div>
	</form>
	
	
	<!-- 댓글 입출력하기 -->
	<form name="commentForm" id="commentForm" action="commentProcess.jsp"
						class="row">
		<div class="col-10 offset-1">
			<div class="row">
				&nbsp;&nbsp;<pre>Comment</pre><br>
			</div>
			<!-- 댓글 입력창 -->
			<div	class="row">
				<div class="col-10">
					<input type="hidden" name="no" id="no" value="<%= i.getNo() %>">
					댓글번호 : <input type="text" name="commentNo" id="commentNo">
					아이디 : <input type="text" name="commentId" id="commentId">
					<input type="text" name="comment" id="comment" class="form-control">
				</div>
				<div class="col-2">
						<input type="button" value="등록하기" id="commentPutBtn" 
									class="btn btn-primary">
						<input type="button" value="댓글수정" id="commentUpdateCompleteBtn" 
									class="btn btn-primary">			
				</div>					
			</div>
			<c:forEach var="c" items="${cList }">
				<div class="row card p-3 m-2">
					<div class="col">
						<div class="row">
							<div class="col d-flex">
								<p class="me-auto">@${c.id }</p>
								<input type="button" class="commentUpdateBtn" value="수정하기" 
											data-comment-no="${c.commentNo}">&nbsp;
								<input type="button" class="commentDeleteBtn" value="삭제하기" 
											data-comment-no2="${c.commentNo}">
							</div>
						</div>
						<div class="row" id="comment-${c.commentNo}">
							<p>${c.comment }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		

	</form>

	
<script>
	// 이미지디테일 > 수정하기 버튼 클릭
	$('#updateBtn').click(function() {
		$('#ImageDetail').attr("action", "updateForm.jsp").attr("method", "post");
		$('#ImageDetail').submit();
		
	});
	
	// 이미지디테일 > 삭제하기 버튼 클릭
	$('#deleteBtn').click(function() {
		$('#ImageDetail').attr("action", "deleteProcess.jsp").attr("method", "post");
		$('#ImageDetail').submit();
		
	});
	
	
	// 하나의 댓글에서 수정하기 버튼 클릭
	$('.commentUpdateBtn').click(function() {
		var commentNo = $(this).data('comment-no');
        var currentComment = $('#comment-' + commentNo).text().trim();
        $("#commentNo").val(commentNo);
        $("#comment").val(currentComment);
        $("#comment").focus();
	});
	// 하나의 댓글에서 삭제하기 버튼 클릭
	$('.commentDeleteBtn').click(function() {
		var commentNo = $(this).data('comment-no2');
		$("#commentNo").val(commentNo);
		
		$("#commentForm").attr("action", "commentDeleteProcess.jsp");
		$("#commentForm").submit();
	});
	
	
	
	// 댓글등록하기 클릭
	$("#commentPutBtn").on("click", function() {
		$("#commentForm").attr("action", "commentProcess.jsp");
		$("#commentForm").submit();
	});
	// 댓글수정완료버튼 클릭
	$("#commentUpdateCompleteBtn").on("click", function() {
		$("#commentForm").attr("action", "commentUpdateProcess.jsp");
		$("#commentForm").submit();
	});
	
	
	

	
</script>
</body>
</html>