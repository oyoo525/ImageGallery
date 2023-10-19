<%@page import="imagegallery.vo.Image"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String no = request.getParameter("no");
	String pageNum = request.getParameter("pageNum");
	String keyword = request.getParameter("keyword");
	
	// 조회수 조회 후 증가
	ImageDao dao3 = new ImageDao();
	int count = dao3.readCount(Integer.parseInt(no));
	dao3.readCountUp(Integer.parseInt(no), count+1);
	
	// 이미지 출력
	ImageDao dao = new ImageDao();
	Image i = dao.getImage(Integer.parseInt(no));
	
	// 댓글 출력
	ImageDao dao2 = new ImageDao();
	ArrayList<Image> cList = dao2.commentList(i);
%> 

<c:set var = "i" value="<%= i %>" />
<c:set var = "cList" value="<%= cList %>" />
<c:set var = "pageNum" value="<%= pageNum %>" />
<c:set var = "keyword" value="<%= keyword %>" />
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
		<input type="hidden" name="pageNum" id="pageNum" value="${pageNum }">
		<input type="hidden" name="no" id="no" value="${i.no }">
		<input type="hidden" name="keyword" id="keyword" value="${keyword }">
		<input type="hidden" name="order" id="order" value="${sessionScope.order }">	
		<div class="col">
			<div class="row">
				<div class="col-10 offset-1 mb-1">
					<div class="row">
						<div class="col">
							<h1 class="fw-bold">${i.imageName }</h1>
						</div>
					</div>
					<div class="row">
						<div class="col-2">
							조회수 : ${i.readCount }
						</div>
						<div class="col-2">
							<c:if test="${empty sessionScope.id }">
								<input type="button" id="disabledLikeCountBtn" value="좋아요 ❤" 
										style="border: 0; border-radius: 5px; background-color: salmon"> ${i.likeCount }
							</c:if>
							<c:if test="${not empty sessionScope.id }">
								<input type="button" id="likeCountBtn" value="좋아요 ❤" 
										style="border: 0; border-radius: 5px; background-color: salmon"> ${i.likeCount }
							</c:if>

						</div>
						<div class="col-2">
						</div>
						<div class="col-6 text-end">
							<input type="button" name="imageListBtn" id="imageListBtn" value="목록보기" class="btn btn-light">
							<c:if test="${sessionScope.id == i.imageId }">
								<input type="button" name="updateBtn" id="updateBtn" value="수정하기" class="btn btn-light">
								<input type="button" name="deleteBtn" id="deleteBtn" value="삭제하기" class="btn btn-light">	
							</c:if>
						</div>
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
			<div	class="row px-2">
				<input type="hidden" name="no" id="no" value="<%= i.getNo() %>">
				<input type="hidden" name="commentNo" id="commentNo">
				<input type="hidden" name="commentId" id="commentId" value="${sessionScope.id }">
				<input type="hidden" name="pageNum" id="pageNum" value="${pageNum }">			
						
				<c:if test="${not empty sessionScope.id }">
					<div class="col-10">
						<input type="text" name="comment" id="comment" class="form-control">				
					</div>
					<div class="col-2 text-center">
						<input type="button" value="등록하기" id="commentPutBtn" 
									class="btn btn-outline-danger">	
						<input type="button" value="댓글수정" id="commentUpdateCompleteBtn" 
										class="btn btn-outline-danger" style="display:none">				
					</div>
				</c:if>			
				<c:if test="${empty sessionScope.id }">
					<div class="col-10">
						<input type="text" name="comment" id="comment" class="form-control" 
									placeholder="로그인 후 댓글을 등록할 수 있습니다">
					</div>
					<div class="col-2 text-center">
						<input type="button" value="로그인" id="loginBtn" 
										class="btn btn-outline-danger">
						<input type="button" value="댓글수정" id="commentUpdateCompleteBtn" 
										class="btn btn-outline-danger" style="display:none">		
					</div>					
				</c:if>
			</div>
			<c:forEach var="c" items="${cList }">
				<div class="row card p-3 m-2">
					<div class="col">
						<div class="row">
							<div class="col d-flex">
								<p class="me-auto">@${c.id }</p>
								<c:if test="${sessionScope.id == c.id }" > 
									<input type="button" class="commentUpdateBtn" value="수정" 
												data-comment-no="${c.commentNo}"
												style="text-decoration: underline; border: 0; background-color: transparent; color: gray">&nbsp;
									<input type="button" class="commentDeleteBtn" value="삭제" 
												data-comment-no2="${c.commentNo}"
												style="text-decoration: underline; border: 0; background-color: transparent; color: gray">
								</c:if>
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
</div>


<script src="../bootstrap/bootstrap.bundle.min.js"></script>
<script>
	// 목록보기
	$("#imageListBtn").on("click", function() {
		var order = $("#order").val();
		var pageNum = $("#pageNum").val();
		var keyword = $("#keyword").val();
		if($("#keyword").val() == null) {
			$("#ImageDetail").attr("action", "ImageList.jsp?order=" + order + "&pageNum=" + pageNum)
			$("#ImageDetail").submit();
		}
		if($("#keyword").val() != null) {
			$("#ImageDetail").attr("action", "ImageList.jsp?order=" + order + "&pageNum=" + pageNum + "&keyword=" + keyword)
			$("#ImageDetail").submit();
		}
	});
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
		$("#commentPutBtn").css("display", "none")
		$("#commentUpdateCompleteBtn").css("display", "block")
		
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
	// 댓글 등록을 위한 로그인 버튼
	$("#loginBtn").on("click", function() {
		location.href="loginForm.jsp";
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
	// 엔터키 이벤트
	$("#commentForm").keydown(function (event) {
        if (event.keyCode == '13') {
            if (window.event) {
                event.preventDefault();
                return;
            }
        }
 	});
	// 좋아요 버튼 클릭
	$("#likeCountBtn").on("click", function() {
		$("#ImageDetail").attr("action", "likeProcess.jsp");
		$("#ImageDetail").submit();
	});
	// 좋아요 버튼 클릭(로그인X)
	$("#disabledLikeCountBtn").on("click", function() {
		alert("로그인 후 좋아요를 눌러주세요");
	});
</script>
</body>
</html>