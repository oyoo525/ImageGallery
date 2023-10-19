<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/formCheck.js"></script>
<style>



	@media screen and (min-width : 1024px) {

	}
</style>

</head>
<body>
<!-- Header -->
<div class="container-fluid fixed-top">
	<div class="row" style="background-color: #E3B3C3">
		<form name="searchBar" id="searchBar" class="col">
			<div class="row align-items-center mx-auto">
				<div class="col">
					<div class="row align-items-center mx-auto">
						<div class="col-1">
							<a href="ImageList.jsp">
								<img src="../img/avatars-8lnQmcAYb76TVJxy-KAxorQ-t500x500.jpg" style="width: 50px" alt="logo">
							</a>
						</div>
						<div class="col-9">
							<input type="text" name="keyword" id="keyword" required class="form-control">
						</div>
						<div class="col-2">
							<input type="button" id="searchBtn" value="검색하기" class="btn btn-warning">
						</div>
					</div>
				</div>
				<div class="colx text-end" style="width: 340px">
					<div class="row">
						<div class="col">
							<!-- 로그인 상태일때 -->
							<c:if test="${sessionScope.login }">
								<div class="d-fle">
									<a href="../ImageList/mypageInfo.jsp" class="btn btn-light">@${sessionScope.id }</a>&nbsp;
									<a href="../ImageList/logoutProcess.jsp" class="btn btn-light">로그아웃</a>&nbsp;
									<a href="uploadForm.jsp" class="btn btn-outline-success">업로드</a>
								</div>

							</c:if>
							<!-- 로그인 상태가 아닐때 -->
							<c:if test="${not sessionScope.login }">
								<div class="d-flex">
									<a href="../ImageList/joinForm.jsp" class="btn btn-light">회원가입</a>&nbsp;
									<a href="../ImageList/loginForm.jsp" class="btn btn-light">로그인</a>&nbsp;
									<a href="../ImageList/loginForm.jsp" class="btn btn-outline-success">업로드</a>								
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="row my-5">
	<p></p>
</div>

<script src="../bootstrap/bootstrap.bundle.min.js"></script>
<script>
	$("#searchBtn").on("click", function(){
		var order = $("#order").val();
		var keyword = $("#keyword").text();
		$("#searchBar").attr("ImageList.jsp?order=" + order + "&keyword=" + keyword);
		$("#searchBar").submit();
	});

</script>


</body>
</html>
	