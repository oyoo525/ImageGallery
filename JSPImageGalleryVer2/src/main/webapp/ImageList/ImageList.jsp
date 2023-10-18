<!-- 처리중 -->
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%@page import="java.sql.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
	final int PAGE_SIZE = 12;
	final int PAGE_GROUP = 10;
%>
<%
	request.setCharacterEncoding("UTF-8");

	String pageNum = request.getParameter("pageNum");
	String keyword = request.getParameter("keyword");
	
	if(pageNum == null) {
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = currentPage * PAGE_SIZE - (PAGE_SIZE - 1);
	int endRow = startRow + PAGE_SIZE - 1;
	int listCount = 0;

	ArrayList<Image> iList = null;
	ImageDao dao = new ImageDao();
	
	boolean searchOption = (keyword == null || keyword.equals("")) ? false : true ;
	if(!searchOption) {
		// 게시글 검색을 안했을 때
		listCount = dao.getImageCount();
		iList = dao.imageList(startRow, endRow);
	} else {
		// 게시글 검색을 했을 때
		listCount = dao.getImageCount(keyword);
		iList = dao.imageList(keyword, startRow, endRow);
	}
	
	int pageCount = listCount / PAGE_SIZE 
			+ (listCount % PAGE_SIZE == 0 ? 0 : 1);
	int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
		- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
	int endPage = startPage + PAGE_GROUP - 1;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}	
%>
<c:set var="iList" value="<%= iList %>" />
<c:set var="currentPage" value="<%= currentPage %>" />
<c:set var="pageGroup" value="<%= PAGE_GROUP %>" /> 
<c:set var="pageCount" value="<%= pageCount %>" />
<c:set var="startPage" value="<%= startPage %>" />
<c:set var="endPage" value="<%= endPage %>" />
<c:set var="searchOption" value="<%= searchOption %>" />
<c:set var="keyword" value="<%= keyword %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/formCheck.js"></script>
<style>
	#back {
	height:367px;
	width:1320px; 
	position: relative;
	}

</style>
</head>
<body>

<div class="container-xl">
	<!-- header -->
	<%@ include file="../pages/header.jsp" %>
	
	<!-- content -->
	<c:if test="${not searchOption }">
		<div name="mainButtons" class="row position-relative my-1">
			<div id="back" class="col">
				<div class="row">
					<div class="col">
						<img src="../img/top_character.png" style="width:1320px" class="w-100">
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${searchOption }">
		<div class="row">
			<div class="col">
				<h2>"${keyword }"에 대한 검색 결과</h2>
			</div>
		</div>
	</c:if>
	
	<!-- 이미지 출력 -->
	<c:if test="${not searchOption }">
		<c:if test="${empty iList }">
			<div class="row">
				<div class="col">
					이미지를 찾을 수 없습니다
				</div>
			</div>
		</c:if>
		<c:if test="${not empty iList }">
			<div class="row text-center">
				<c:forEach var="i" items="${iList }">
					<div style="width:300px; height:300px; display:inline-block; margin: 10px">
						<a href="ImageDetail.jsp?no=${i.no }&pageNum=${currentPage }">
							<img name="images" id="images"
								src="${i.imagePath }" alt="이미지" 
								style="width:300px; height:300px; object-fit:cover; display:inline-block">
						</a>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</c:if>
	<c:if test="${searchOption }">
		<c:if test="${empty iList }">
			<div class="row">
				<div class="col">
					이미지를 찾을 수 없습니다
				</div>
			</div>
		</c:if>
		<c:if test="${not empty iList }">
			<div class="row text-center">
				<c:forEach var="i" items="${iList }">
					<div style="width:300px; height:300px; display:inline-block; margin: 10px">
						<a href="ImageDetail.jsp?no=${i.no }&pageNum=${currentPage }&keyword=${keyword }">
							<img name="images" id="images"
								src="${i.imagePath }" alt="이미지"
								style="width:300px; height:300px; object-fit:cover; display:inline-block">
						</a>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</c:if>
	
	
	<!-- 페이지네이션 -->
	<c:if test="${not searchOption }">
		<div class="row">
			<div class="col">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
					  	<c:if test="${ startPage > pageGroup }">
						    <li class="page-item">
						      <a class="page-link" href="ImageList.jsp?pageNum=${ startPage - pageGroup }">Pre</a>
						    </li>
					    </c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
					    	<c:if test="${i == currentPage }">
						    	<li class="page-item active" aria-current="page">
						    		<span class="page-link">${i}</span>
						    	</li>
					    	</c:if>
					    	<c:if test="${i != currentPage }">
						    	<li class="page-item"><a class="page-link" href="ImageList.jsp?pageNum=${ i }">${i}</a></li>
						    </c:if>					    
					    </c:forEach>
					    <c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="ImageList.jsp?pageNum=${ startPage + pageGroup }">Next</a>
						    </li>
					  	</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</c:if>
	<c:if test="${searchOption }">
		<div class="row">
			<div class="col">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
					  	<c:if test="${ startPage > pageGroup }">
						    <li class="page-item">
						      <a class="page-link" href="ImageList.jsp?pageNum=${ startPage - pageGroup }&keyword=${keyword }">Pre</a>
						    </li>
					    </c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
					    	<c:if test="${i == currentPage }">
						    	<li class="page-item active" aria-current="page">
						    		<span class="page-link">${i}</span>
						    	</li>
					    	</c:if>
					    	<c:if test="${i != currentPage }">
						    	<li class="page-item"><a class="page-link" href="ImageList.jsp?pageNum=${i }&keyword=${keyword }">${i}</a></li>
						    </c:if>					    
					    </c:forEach>
					    <c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="ImageList.jsp?pageNum=${ startPage + pageGroup }&keyword=${keyword }">Next</a>
						    </li>
					  	</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</c:if>
	
	<script src="../bootstrap/bootstrap.bundle.min.js"></script>
</div>
</body>
</html>