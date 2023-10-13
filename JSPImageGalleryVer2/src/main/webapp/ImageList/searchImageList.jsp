<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-xl">
	<!-- header -->
	<%@ include file="../pages/header.jsp" %>
	
	<!-- content -->
	<div class="row">
		<br><br><br>
	</div>
	<div class="row">
		<div class="col-10 offse-1 mb-1">
			<h2><%= searchKeyword %> 에 관한 검색결과</h2>
		</div>
	</div>
	<div class="row">
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
</html> --%>