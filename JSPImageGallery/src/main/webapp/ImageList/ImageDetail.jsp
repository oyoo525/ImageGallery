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
	
	boolean commentUpdateValue = false;
%> 

<c:set var = "i" value="<%= i %>" />
<c:set var = "cList" value="<%= cList %>" />
<c:set var = "commentUpdateValue" value="<%=commentUpdateValue %>" />
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
	
	<!-- 이미지 정보출력 -->
	<form name="ImageDetail" id="ImageDetail" class="row">
		<div class="col">
			<div>
				<div class="col-10 offset-1 mb-1">
					<h1 class="fw-bold">${i.imageName }</h1> ${commentUpdateValue }
					<input type="hidden" name="no" id="no" value="${i.no }">
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
	
	
	<!-- 댓글입력하기 -->
	<form name="commentForm" id="commentForm" action="commnetProcess.jsp"
						class="row">
		<div class="col-10 offset-1">
			<div class="row">
				&nbsp;&nbsp;<pre>Comment</pre><br>
			</div>
			<!-- 댓글 입력창 -->
			<div	class="row">
				<div class="col-10">
					<input type="hidden" name="imageNo" id="imageNo" value="<%= i.getNo() %>">
					댓글번호 : <input type="text" name="commentNo" id="commentNo">
					아이디 : <input type="text" name="id" id="id">
					<input type="text" name="comment" id="comment" class="form-control">
				</div>
				<div class="col-2">
					<c:if test="${not commentUpdateValue }">
						<input type="submit" value="등록하기" class="btn btn-primary">
					</c:if>
					<c:if test="${commentUpdateValue }">
						<input type="button" 
									value="댓글수정"  class="btn btn-primary">
						<input type="button" value="수정취소" class="btn btn-primary">					
					</c:if>
				</div>					
			</div>
			
		</div>
		<c:forEach var="c" items="${cList }">
			<div class="row card p-3 m-2">
				<div class="col">
					<div class="row">
						<div class="col d-flex">
							<p class="me-auto">@${c.id }</p>
							<input type="button" class="commentUpdateBtn"
										data-comment-no="${c.commentNo}" 
										value="수정하기">&nbsp;
							<a href="#">삭제하기</a>
						</div>
					</div>
					<div class="row" id="comment-${c.commentNo}">
						<p>${c.comment }</p>
					</div>
				</div>
			</div>
		</c:forEach>
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
		/* <c:set var='commentUpdateValue' value='true' session='page' /> */
		var commentNo = $(this).data('comment-no');
        var currentComment = $('#comment-' + commentNo).text().trim();
        $("#comment").val(currentComment);
        $("#commentNo").val(commentNo);
        $("#comment").focus();
	});
	
	// 댓글 등록하기 버튼클릭
	

	$("#updateCommentValue").click(function() {
		/* <c:set var='commentUpdateValue' value='false' scope='session' /> */
		$('#commentForm').attr("action", "updateComment.jsp");
		$('#commentForm').submit();
	});
	
	// 수정 후 수정완료 버튼 클릭
	$("#updateCommentValue").click(function() {
		/* <c:set var='commentUpdateValue' value='false' scope='session' /> */

	});
	
	// 수정 후 수정취소 버튼 클릭
	

	
</script>
</body>
</html>